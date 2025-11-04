#lang racket

;Va recorriendo la lista y hace el cuadrado de cada elemento
(define (square-list1 items)
  (if (null? items)
      '()
      (cons (* (car items) (car items)) (square-list1 (cdr items)))))

;Se usa la funcion cuadrado para que se aplique a cada elemento de la lista
(define (square-list2 items)
  (map (lambda (x) (* x x)) items))