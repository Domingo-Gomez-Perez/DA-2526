#lang racket

; double recibe una funcion f y devuelve otra que aplica f dos veces
(define (double f)
  (lambda (x) (f (f x))))

(define (inc x)
  (+ x 1))

; se va a aplicar double 4 veces a inc:
; inc = 1 -> 1 * 2 = 2 -> 2 * 2 = 4 -> 4 * 2 = 8 -> 8 * 2 = 16
; tras ello se suman 16 y 5
(((double (double double)) inc) 5) ; -> 21 
