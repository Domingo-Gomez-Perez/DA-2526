#lang racket

;Genero un funcion que devuelva una función acumulador, donde cada llamada suma su argumento al estado interno del acumulador, como se pide.

(define (make-accumulator initial)
  (let ((sum initial))
    (lambda (n)
      (set! sum (+ sum n))
      sum)))


(define A (make-accumulator 5))

(A 10)  
(A 10)   
