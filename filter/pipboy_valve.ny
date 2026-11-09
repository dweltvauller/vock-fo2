$nyquist plug-in
$version 4
$type process
$preview linear
$name "VOCK Pip-Boy Valve"
$debugbutton true
$author "dweltvauller"
$release 1.0

;; Chain:
;;  1. Mono. Stereo gets mixed down; both channels get the result.
;;  2. Bandpass 500-2500 Hz (4th-order Butterworth).
;;  3. Tube saturation: tanh with drive 1.8 and warmth 0.2.
;;  4. Mechanical delay: resonant comb, 22 ms, feedback 0.3, mix 0.3.
;;  5. Compressor, 4:1 above -18 dB, 5 ms attack, 80 ms release.
;;  6. Presence, +3 dB through a 2nd-order Butterworth band at 840-1560 Hz,
;;     added on top of the dry signal.
;;  7. Static: white noise, band-limited to 500-2500 Hz, at -44 dB peak.
;;  8. Normalize the peak to -1 dBFS.
;; Steps 3 and 5 work on the take's real level, so a quiet take gets
;; less saturation and compression than a loud one.


(defun mono (s)
  (if (arrayp s)
      (mult 0.5 (sum (aref s 0) (aref s 1)))
      s))

;; Complex numbers as (re . im) pairs; XLISP has none built in.
(defun c+ (a b) (cons (+ (car a) (car b)) (+ (cdr a) (cdr b))))
(defun c- (a b) (cons (- (car a) (car b)) (- (cdr a) (cdr b))))
(defun c* (a b)
  (cons (- (* (car a) (car b)) (* (cdr a) (cdr b)))
        (+ (* (car a) (cdr b)) (* (cdr a) (car b)))))
(defun c/ (a b)
  (let ((d (+ (* (car b) (car b)) (* (cdr b) (cdr b)))))
    (cons (/ (+ (* (car a) (car b)) (* (cdr a) (cdr b))) d)
          (/ (- (* (cdr a) (car b)) (* (car a) (cdr b))) d))))
(defun csqrt (a)
  (let* ((x (car a)) (y (cdr a))
         (r (sqrt (+ (* x x) (* y y))))
         (re (sqrt (max 0.0 (* 0.5 (+ r x)))))
         (im (sqrt (max 0.0 (* 0.5 (- r x))))))
    (cons re (if (< y 0.0) (- im) im))))

;; Butterworth bandpass from lo to hi Hz. order must be even.
;; Each lowpass prototype pole maps to two bandpass poles; each pole and
;; its conjugate make one biquad with zeros at DC and Nyquist. The
;; sections are scaled so the gain at the band centre is exactly 1.
(defun butter-bp (s order lo hi)
  (let* ((sr (snd-srate s))
         (w1 (tan (/ (* pi lo) sr)))         ; prewarped edges
         (w2 (tan (/ (* pi hi) sr)))
         (hbw (* 0.5 (- w2 w1)))
         (wo2 (cons (* w1 w2) 0.0))
         (one (cons 1.0 0.0))
         ;; band centre on the unit circle, e^-jw0, from tan(w0/2) = sqrt(w1 w2)
         (t2 (* w1 w2))
         (zc (cons (/ (- 1.0 t2) (+ 1.0 t2)) (/ (* -2.0 (sqrt t2)) (+ 1.0 t2))))
         (zc2 (c* zc zc))
         (h one)
         secs)
    (dotimes (k (/ order 2))
      (let* ((th (/ (* pi (+ 1 (* 2 k))) (* 2.0 order)))
             (a (c* (cons (- (cos th)) (sin th)) (cons hbw 0.0)))
             (d (csqrt (c- (c* a a) wo2))))
        (dolist (p (list (c+ a d) (c- a d)))
          (let* ((z (c/ (c+ one p) (c- one p)))   ; bilinear transform
                 (a1 (* -2.0 (car z)))
                 (a2 (+ (* (car z) (car z)) (* (cdr z) (cdr z)))))
            (push (list a1 a2) secs)
            (setf h (c* h (c/ (c- one zc2)
                              (c+ (c+ one (c* (cons a1 0.0) zc))
                                  (c* (cons a2 0.0) zc2)))))))))
    (dolist (sec secs)
      (setf s (biquad-m s 1.0 0.0 -1.0 1.0 (first sec) (second sec))))
    (scale (/ 1.0 (car h)) s)))

(defun tanh (x)
  (let ((e (exp (* -2.0 (abs x)))))
    (* (if (< x 0.0) -1.0 1.0) (/ (- 1.0 e) (+ 1.0 e)))))

;; Steps 3 to 5. Each step only looks back in time, so one pass over the
;; samples does all three. The delay keeps its last 22 ms in a ring buffer.
;; The samples go through in blocks of 1024. Fetching the whole take as one
;; Lisp array takes one memory node per sample; on a long take Nyquist runs
;; out of nodes and its garbage collector recurses until Audacity crashes.
(setf valve-class (send class :new '(src left sr ring dn pos env)))

(send valve-class :answer :isnew '(s n) '(
  (setf src s)
  (setf left n)
  (setf sr (snd-srate s))
  ;; mechanical delay, 22 ms rounded down to whole samples
  (setf dn (max 1 (truncate (/ (* sr 22.0) 1000.0))))
  (setf ring (make-array dn))
  (dotimes (i dn) (setf (aref ring i) 0.0))
  (setf pos 0)
  (setf env 0.0)))

;; Returns the next block, or NIL after the last sample of the take.
;; Every block must be the same length, so the last one carries the
;; zeros snd-fetch-array pads it with; valve cuts them off afterwards.
(send valve-class :answer :next '() '(
  (let* ((arr (if (> left 0) (snd-fetch-array src 1024 1024)))
         (k (if arr (length arr) 0))
         (out (if arr (make-array k)))
         ;; saturation
         (drive 1.8)
         (warmth 0.2)
         (tdrive (tanh drive))
         ;; mechanical delay
         (fb 0.3)
         (mix 0.3)
         ;; compressor
         (thr (expt 10.0 (/ -18.0 20.0)))
         (slope (- (- 1.0 (/ 1.0 4.0))))      ; ratio 4:1
         (att (exp (/ -1.0 (* sr 0.005))))    ; 5 ms attack
         (rel (exp (/ -1.0 (* sr 0.080))))    ; 80 ms release
         x d y ax c)
    (dotimes (i k)
      (setf d (* drive (aref arr i)))
      (setf x (/ (tanh (+ d (* warmth d (abs d)))) tdrive))
      (setf y (+ x (* fb (aref ring pos))))   ; ring holds y from dn ago
      (setf (aref ring pos) y)
      (setf pos (if (= (1+ pos) dn) 0 (1+ pos)))
      (setf x (+ (* (- 1.0 mix) x) (* mix y)))
      (setf ax (abs x))
      (setf c (if (> ax env) att rel))
      (setf env (+ (* c env) (* (- 1.0 c) ax)))
      (setf (aref out i)
            (if (> env thr) (* x (expt (/ env thr) slope)) x)))
    (setf left (- left k))
    out)))

(defun valve (s n)
  (let ((sr (snd-srate s)))
    (extract-abs 0 (/ n sr)
                 (snd-fromarraystream 0 sr (send valve-class :new s n)))))

(defun presence (s)
  (sum s (scale (- (db-to-linear 3) 1.0) (butter-bp s 2 840 1560))))

(defun static (sr dur)
  (let ((nz (butter-bp (snd-white 0 sr dur) 2 500 2500)))
    (scale (/ (db-to-linear -44) (max 1e-9 (peak nz ny:all))) nz)))


(let* ((n (truncate len))
       (s (mono *track*))
       (sr (snd-srate s))
       (s (butter-bp s 4 500 2500))
       (s (valve s n))
       (s (presence s))
       (s (sum s (static sr (/ n sr)))))
  (scale (/ (db-to-linear -1) (max 1e-9 (peak s ny:all))) s))
