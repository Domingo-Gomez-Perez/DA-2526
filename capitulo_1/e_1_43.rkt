#lang racket

(define (compose f g)
  (lambda (x)
    (f (g x))))

; repeated aplica f n veces, siendo f un procedimiento y n un numero entero positivo
(define (repeated f n)
  (if (= n 1)
      f
      (repeated (compose f f) (- n 1))))

(define (square x)
  (* x x))

; (square (square 5))
; (square 25)
((repeated square 2) 5) ; -> 625
