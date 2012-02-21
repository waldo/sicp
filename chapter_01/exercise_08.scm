; Exercise 1.8.
; Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value
;
;  x
; ---
; y^2 + 2y
; ------------
;       3
;
; Use this formula to implement a cube-root procedure analogous to the square-root procedure. (In section 1.3.4 we will see how to implement Newton's method in general as an abstraction of these square-root and cube-root procedures.)

(define (root-iter guess x)
  (if (good-enough? guess x)
      guess
      (root-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
  (< (/ (abs (- guess (improve guess x))) (abs guess)) 0.0000001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (cube-rt x)
  (root-iter 1.0 x))

; test
(cube-rt 27)
; 3.000....
(cube-rt 8)
; 2.000....
(cube-rt 747)
; 9.07347...

