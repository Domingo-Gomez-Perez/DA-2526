#lang racket

;;Ejercicio 2.17
;; =====================

(define (last-pair lst)
  ;; en eel caso de que la cola este vacia solo tiene un elemento la canbeza , devuelve la lista
  ;; en caso negativo la lista tiene mas elementos en los que buscar, con lo que se llama recursivamente
  (if (null? (cdr lst))
      lst
      (last-pair (cdr lst))))


(displayln (last-pair (list 23 72 149 34))) ; ⇒ '(34)
