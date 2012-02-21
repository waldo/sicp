; Exercise 1.7.
; The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?
;

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; Too small
; (sqrt 0.0000001)
; 0.03125106561775382 as an answer when it should be more like 0.000316227766 out by two orders of magnitude

; Too big
; (sqrt 111222333444555)
; Takes too long (> 1 minute on 32-bit version) to complete because 0.001 -10^18 smaller than the target

(define (better-good-enough? guess x)
  (< (/ (abs (- guess (improve guess x))) (abs guess)) 0.0000001))

(define (better-sqrt x)
  (better-sqrt-iter 1.0 x))

(define (better-sqrt-iter guess x)
  (if (better-good-enough? guess x)
      guess
      (better-sqrt-iter (improve guess x)
                 x)))

(better-sqrt 0.0000001)
; 0.00031622776664863746
(better-sqrt 111222333444555)
; 10546199.95299168
