#lang racket
(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (square x) (* x x))   ; función que eleva al cuadrado
(define (inc x) (+ x 1))      ; función que incrementa en 1

((compose square inc) 6)
;; Paso a paso:
;; inc(6) → 7
;; square(7) → 49
;; Resultado final → 49