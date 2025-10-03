#lang racket
; Procedimiento para devolver la lista (NO VACÍA) solo con el último elemento
(define (last-element lst)
  (if (null? (cdr lst))
      (car lst)
      (last-element (cdr lst))))
  
  