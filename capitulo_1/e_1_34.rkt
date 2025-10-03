#lang racket
(define (f g)
  (g 2)
  )

(define (square x)
  (* x x))

; Since (f g) results in the interpreter evaluating (g 2),
; when calling (f f) the interpreter tries to evaluate (f 2), but 2 isn't
; a procedure (and the definition of f consists of calling another function g
; changing the parameter to 2) therefore the combination (f f) doesn't work.