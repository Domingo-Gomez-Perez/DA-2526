#lang racket

(define (f x) 
   (let ((a (+ x 10))
         (b (* a 5)))
         (+ a b))
)

(f 2)      ; Fails because we are trying to define two local
; variables (a = x+10 and b = a*5), where the second variable
; depends on the value of the first local variable. This is not
; possible because the value of a and b is computed outside the
; let, meaning that when we try to give b its value, a doesn't have
; a value in that scope (but if we were to change it to (b (* 2 5)),
; for example, the code would be able to finish running, since outside
; the let but inside f, both a and b have a value assigned.
