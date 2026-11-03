$nyquist plug-in
$version 4
$type process
$preview linear
$name "VOCK Power Armor"
$debugbutton true
$author "dweltvauller"
$release 1.0

;; The chain, in order:
;;  1. Mono. Stereo gets mixed down; both channels get the result.
;;  2. Bandpass. Steep low cut at 400 Hz, gentle top cut at 2500 Hz.
;;  3. Compressor, 5:1 above -24 dB, very fast attack.
;;  4. Saturation (tanh, drive 4.0) for grit.
;;  5. Speaker clip: positive peaks flattened at 0.45, negative at 0.70,
;;     then a 30 Hz high-pass to remove the offset.
;;  6. Megaphone cone, +3 dB in a narrow band at 1.8 kHz.
;;  7. Presence, +2 dB around 1.2 kHz.
;;  8. Echo, one faint repeat 127.7 ms later at -27 dB (optional).
;;  9. Normalize the peak to -1 dBFS.
;; Steps 3 and 4 each start from a peak-normalized signal, so quiet and
;; loud takes get the same amount of squash and grit.

$control echo "Echo" choice "Yes,No" 0


(defun mono (s)
  (if (arrayp s)
      (mult 0.5 (sum (aref s 0) (aref s 1)))
      s))

(defun array-peak (arr n)
  (let ((pk 1e-9))
    (dotimes (i n pk)
      (setf pk (max pk (abs (aref arr i)))))))

(defun tanh (x)
  (let ((e (exp (* 2.0 x))))
    (/ (- e 1.0) (+ e 1.0))))

;; Steps 3 to 5 (before the high-pass). Nyquist has no built-in compressor
;; or asymmetric clipper like this, so this walks the samples.
(defun dynamics (s n)
  (let* ((sr (snd-srate s))
         (arr (snd-fetch-array s n n))
         (thr (expt 10.0 (/ -24.0 20.0)))
         (slope (- (- 1.0 (/ 1.0 5.0))))      ; ratio 5:1
         (att (exp (/ -1.0 (* sr 0.0002))))   ; 0.2 ms attack
         (rel (exp (/ -1.0 (* sr 0.080))))    ; 80 ms release
         (drive 4.0)
         (env 0.0)
         (k 0.0)
         x ax c)
    ;; compressor on the peak-normalized signal
    (setf k (/ 1.0 (array-peak arr n)))
    (dotimes (i n)
      (setf x (* k (aref arr i)))
      (setf ax (abs x))
      (setf c (if (> ax env) att rel))
      (setf env (+ (* c env) (* (- 1.0 c) ax)))
      (setf (aref arr i)
            (if (> env thr) (* x (expt (/ env thr) slope)) x)))
    ;; saturation and speaker clip on the peak-normalized result
    (setf k (/ drive (array-peak arr n)))
    (dotimes (i n)
      (setf x (/ (tanh (* k (aref arr i))) (tanh drive)))
      (setf (aref arr i) (max -0.70 (min 0.45 x))))
    (snd-from-array 0 sr arr)))


(let* ((n (truncate len))
       (s (mono *track*))
       (s (lowpass2 (highpass4 s 400) 2500))
       (s (dynamics s n))
       (s (hp s 30))
       (s (eq-band s 1800 3 0.44))   ; 1530-2070 Hz
       (s (eq-band s 1200 2 0.89))   ; 840-1560 Hz
       ;; at-abs takes real seconds; plain "at" would count in
       ;; selection lengths, since Audacity scales the selection to 1.
       (s (if (= echo 0)
              (sim s (at-abs 0.1277 (cue (scale (db-to-linear -27) s))))
              s)))
  (scale (/ (db-to-linear -1) (peak s ny:all)) s))
