; Exercise 1.3.
; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (sum-of-squares a b)
  (+ (* a a) (* b b)))

(define (max a b)
  (if (>= a b)
  a
  b))

(define (three-args x y z)
  (sum-of-squares
    (max x y) (max y z)))

; test
(= (three-args -1 -2 -3) 5)
(= (three-args 12 3 4) 160)
(= (three-args 2 3 3) 18)
(= (three-args 3 3 3) 18)
