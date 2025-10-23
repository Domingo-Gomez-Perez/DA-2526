#lang racket

(define (new-if predicate 
                then-clause 
                else-clause)
  (cond (predicate then-clause)))


(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))


; entra en un bucle infinito por que con el new-if es de orden aplicativo entonces evalua los tres argumentos y en este caso al evaluar
; good-enough? guess y (sqrt-iter (improve guess x) x))) y en este ultimo es en el que se queda en un bucle infinito


