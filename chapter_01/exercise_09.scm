; Exercise 1.9.
; Each of the following two procedures defines a method for adding two positive integers in terms of the procedures inc, which increments its argument by 1, and dec, which decrements its argument by 1.
;
; (define (+ a b)
;   (if (= a 0)
;       b
;       (inc (+ (dec a) b))))
;
; (define (+ a b)
;   (if (= a 0)
;       b
;       (+ (dec a) (inc b))))
;
; Using the substitution model, illustrate the process generated by each procedure in evaluating (+ 4 5). Are these processes iterative or recursive?

;; option 1 - recursive
; (+ 4 5)
; (if (= 4 0)) 5 (inc (+ (dec 4) 5)) ;; evaluating the dec and if for simplicity
; (inc (+ 3 5))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9

;; option 2 - incremental
; (+ 4 5)
; (if (= 4 0)) 5 (+ (dec 4) (inc 5))) ;; evaluating the dec, inc and if for simplicity
; (+ 3 6)
; (+ 2 7)
; (+ 1 8)
; (+ 0 9)
; 9
