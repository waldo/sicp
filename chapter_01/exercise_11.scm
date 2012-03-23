; Exercise 1.11.
; A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

; recursive
(define (f-recursive n)
  (cond ((< n 3) n)
        (else (+ (f-recursive (- n 1))
                 (* 2 (f-recursive (- n 2)))
                 (* 3 (f-recursive (- n 3)))))))
; test
(not (member #f (list
  (= (f-recursive 0) 0) ; #t
  (= (f-recursive 1) 1) ; #t
  (= (f-recursive 2) 2) ; #t
  (= (f-recursive 3) 4) ; #t
  (= (f-recursive 4) 11) ; #t
  (= (f-recursive 5) 25) ; #t
  (= (f-recursive 6) 59) ; #t
)))

; iterative
(define (f-iterative n)
  (f-sub-iter 0 1 2 n))

(define (f-sub-iter a b c n)
  (if (= n 0)
    a
    (f-sub-iter b c (+ (* 3 a) (* 2 b) c) (- n 1))))

; test
(not (member #f (list
  (= (f-iterative 0) 0) ; #t
  (= (f-iterative 1) 1) ; #t
  (= (f-iterative 2) 2) ; #t
  (= (f-iterative 3) 4) ; #t
  (= (f-iterative 4) 11) ; #t
  (= (f-iterative 5) 25) ; #t
  (= (f-recursive 6) 59) ; #t
)))
