#lang racket

(define(cuadrado x)
  (* x x))

(define (inc n)
    (+ 1 n)
)

;Basicamente crea una nueva funcion con un argumento. Esta nueva funcion es la composicion de f(g(x)).
(define (compose f g)
  (lambda (x) (f (g x)))
 )


((compose cuadrado inc) -6) ;Retorna 25, * (+ 1 -6) (+ 1 -6) --> * 5 5






