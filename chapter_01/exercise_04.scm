; Exercise 1.4.
; Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:
;
; (define (a-plus-abs-b a b)
;   ((if (> b 0) + -) a b))

; Operator is selected based on an if statement in a manner no different to selecting a value and then applied to operands a and b.
