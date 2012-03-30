; Exercise 1.13.
; Prove that Fib(n) is the closest integer to φ^n/sqrt(5), where φ = (1 + sqrt(5)) / 2. Hint: Let ψ = (1 - sqrt(5)) / 2. Use induction and the definition of the Fibonacci numbers (see section 1.2.2) to prove that Fib(n) = (φ^n - ψ^n) / sqrt(5).

(define (phi)
  (/ (+ 1 (sqrt 5)) 2))

(define (psi)
  (/ (- 1 (sqrt 5)) 2))

(define (fib-math n)
  (/ (- (expt (phi) n) (expt (psi) n))
    (sqrt 5)))


; test
(not (member #f (list
  (= (round (fib-math 0)) 0)
  (= (round (fib-math 1)) 1)
  (= (round (fib-math 2)) 1)
  (= (round (fib-math 3)) 2)
  (= (round (fib-math 4)) 3)
  (= (round (fib-math 5)) 5)
  (= (round (fib-math 6)) 8)
  (= (round (fib-math 7)) 13)
  (= (round (fib-math 8)) 21)
)))

; Key helpful points: http://www.billthelizard.com/2009/12/sicp-exercise-113-fibonacci-and-golden.html
; φ^2 = φ + 1
; φ^-1 + 1 = φ
; ψ^2 = ψ + 1
; ψ^-1 + 1 = ψ

; show for fib(0) = 0 = (φ^0 - ψ^0) / sqrt(5) = 0
; show for fib(1) = 0 = (φ^1 - ψ^1) / sqrt(5) = 1
; show for fib(2) = 0 = (φ^2 - ψ^2) / sqrt(5) = 1
; show for fib(k+1) = fib(k) + fib(k-1),
;   (φ^(k+1) - ψ^(k+1)) / sqrt(5) = (φ^(k) - ψ^(k)) / sqrt(5) + (φ^(k-1) - ψ^(k-1)) / sqrt(5)
;   ... = ((φ^k - ψ^k) + (φ^(k-1) - ψ^(k-1))) / sqrt(5)
;   ... = (φ^k + φ^(k+1) - ψ^k - ψ^(k+1)) / sqrt(5)
;   ... = ((φ^(k+1) * (φ^-1 + φ^-2)) - (ψ^(k+1) * (ψ^-1 + ψ^-2))) / sqrt(5)
;   ... = ((φ^(k+1) * φ^-1 * (1 + φ^-1)) - (ψ^(k+1) * ψ^1 * (1 + ψ^-1))) / sqrt(5)
;   ... = ((φ^(k+1) * φ^-1 * φ)) - (ψ^(k+1) * ψ^1 * ψ) / sqrt(5)
;   ... = ((φ^(k+1) * φ^-1 * φ)) - (ψ^(k+1) * ψ^1 * ψ) / sqrt(5)
;   ... = ((φ^(k+1) * 1)) - (ψ^(k+1) * 1) / sqrt(5)
;   ... = (φ^(k+1) - ψ^(k+1)) / sqrt(5)

; closest integer part
; fib(n) = (φ^n - ψ^n) / sqrt(5)
; fib(n) = φ^n / sqrt(5) - ψ^n / sqrt(5)
; fib(n) - ψ^n / sqrt(5) = φ^n / sqrt(5)

; ψ^n / sqrt(5) > -0.5 AND ψ^n / sqrt(5) < 0.5
; n >= 0
; ψ^n > -0.5 * sqrt(5)
; -0.618^n > -1.118
; -0.618^0 > -1.118 = -1 ; and approaches 0 for very large n (thus < 0.5 is fine too)
