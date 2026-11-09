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

;; Feeds a sound through fn one sample at a time, in blocks of 1024.
;; Fetching the whole take as one Lisp array takes one memory node per
;; sample; on a long take Nyquist runs out of nodes and its garbage
;; collector recurses until Audacity crashes. snd-fromarraystream needs
;; every block the same length, so the last one carries the zeros
;; snd-fetch-array pads it with; map-samples cuts them off.
(setf block-class (send class :new '(src left fn)))

(send block-class :answer :isnew '(s n f) '(
  (setf src s)
  (setf left n)
  (setf fn f)))

;; Returns the next block, or NIL after the last sample of the take.
(send block-class :answer :next '() '(
  (let* ((arr (if (> left 0) (snd-fetch-array src 1024 1024)))
         (k (if arr (length arr) 0))
         (out (if arr (make-array k))))
    (dotimes (i k)
      (setf (aref out i) (funcall fn (aref arr i))))
    (setf left (- left k))
    out)))

(defun map-samples (s n fn)
  (let ((sr (snd-srate s)))
    (extract-abs 0 (/ n sr)
                 (snd-fromarraystream 0 sr (send block-class :new s n fn)))))

(defun tanh (x)
  (let ((e (exp (* 2.0 x))))
    (/ (- e 1.0) (+ e 1.0))))

;; Step 3 on the peak-normalized signal. Nyquist has no built-in
;; compressor like this, so this walks the samples.
(defun compressor (s n)
  (let* ((sr (snd-srate s))
         (k (/ 1.0 (max 1e-9 (peak s ny:all))))
         (thr (expt 10.0 (/ -24.0 20.0)))
         (slope (- (- 1.0 (/ 1.0 5.0))))      ; ratio 5:1
         (att (exp (/ -1.0 (* sr 0.0002))))   ; 0.2 ms attack
         (rel (exp (/ -1.0 (* sr 0.080))))    ; 80 ms release
         (env 0.0))
    (map-samples s n
      (lambda (v)
        (let* ((x (* k v))
               (ax (abs x))
               (c (if (> ax env) att rel)))
          (setf env (+ (* c env) (* (- 1.0 c) ax)))
          (if (> env thr) (* x (expt (/ env thr) slope)) x))))))

;; Steps 4 and 5 (before the high-pass): saturation and the asymmetric
;; speaker clip, on the peak-normalized result of the compressor.
(defun grit (s n)
  (let* ((drive 4.0)
         (k (/ drive (max 1e-9 (peak s ny:all))))
         (tdrive (tanh drive)))
    (map-samples s n
      (lambda (v)
        (max -0.70 (min 0.45 (/ (tanh (* k v)) tdrive)))))))

(let* ((n (truncate len))
       (s (mono *track*))
       (s (lowpass2 (highpass4 s 400) 2500))
       (s (compressor s n))
       (s (grit s n))
       (s (hp s 30))
       (s (eq-band s 1800 3 0.44))   ; 1530-2070 Hz
       (s (eq-band s 1200 2 0.89))   ; 840-1560 Hz
       ;; at-abs takes real seconds; plain "at" would count in
       ;; selection lengths, since Audacity scales the selection to 1.
       (s (if (= echo 0)
              (sim s (at-abs 0.1277 (cue (scale (db-to-linear -27) s))))
              s)))
  (scale (/ (db-to-linear -1) (peak s ny:all)) s))
