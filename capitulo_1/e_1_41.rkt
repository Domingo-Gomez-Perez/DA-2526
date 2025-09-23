#lang racket
;Definimos la funcion double
(define (double f)
  (lambda (x) (f (f x))))

;Definimos inc
(define (inc x)
  (+ x 1))

(((double (double double)) inc) 5) ;El resultado es 21
