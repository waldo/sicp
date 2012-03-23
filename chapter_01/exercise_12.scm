; Exercise 1.12.
; The following pattern of numbers is called Pascal's triangle.
;     1
;    1 1
;   1 2 1
;  1 3 3 1
; 1 4 6 4 1

; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it. Write a procedure that computes elements of Pascal's triangle by means of a recursive process.

(define (fact n)
  (fact-iter 1 n))

(define (fact-iter total n)
  (if (= n 0)
    total
    (fact-iter (* total n) (- n 1))))

(define (pascals-triangle x y)
  (/ (fact (- x 1)) (* (fact (- y 1)) (fact (- x y)))))


; test
(not (member #f (list
  (= (pascals-triangle 1 1) 1)
  (= (pascals-triangle 2 1) 1)
  (= (pascals-triangle 2 2) 1)
  (= (pascals-triangle 3 2) 2)
  (= (pascals-triangle 5 3) 6)
  (= (pascals-triangle 6 2) 5)
  (= (pascals-triangle 6 3) 10)
  (= (pascals-triangle 6 4) 10)
  (= (pascals-triangle 7 4) 21)
)))
