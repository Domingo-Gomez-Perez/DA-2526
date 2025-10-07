#lang racket

(define(cuadrado x)
  (* x x))




;Repetir va decrementando la "n" mientras vuelve a llamar a la funcion que se le pasa con el argumento de lambda.
(define (repeated f n)
  (if (< n 1)
      (lambda (x) x)                  
      (lambda (x) (f ((repeated f (- n 1)) x)))))




((repeated cuadrado 7) 2)



