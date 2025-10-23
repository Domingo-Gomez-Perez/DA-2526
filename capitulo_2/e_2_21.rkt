#lang racket

;; Definición recursiva
(define (square-list items)
  (if (null? items)
      '()                                     ; lista vacía si no hay elementos
      (cons (* (car items) (car items))       ; cuadrado del primer elemento
            (square-list (cdr items)))))      ; recursión con el resto

;; Definición usando map
(define (square-list2 items)
  (map (lambda (x) (* x x)) items))           ; aplica el cuadrado a cada elemento

(square-list (list 1 2 3 4 25))
(square-list2 (list 1 2 3 4))
