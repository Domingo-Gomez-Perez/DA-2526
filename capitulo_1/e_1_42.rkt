#lang racket

; compose recibe dos funciones f y g, y devuelve una nueva funcion que aplica g primero, y luego f
(define (compose f g)
  (lambda (x)
    (f (g x))))

; square elevada un numero al cuadrado
(define (square x)
  (* x x))

; inc incrementa en uno x
(define (inc x)
  (+ x 1))

; (compose square inc) -> (lambda (x) (square (inc x)))
; (lambda (x) (square (inc x))) 6)
; (square (inc 6))
; (square 7)
; 49
((compose square inc) 6) ; -> 49
