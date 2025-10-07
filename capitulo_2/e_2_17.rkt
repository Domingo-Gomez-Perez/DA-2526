#lang racket
; Procedimiento para devolver la lista (NO VACÍA) solo con el último elemento
(define (last-element list)
  (if (null? (cdr list))
      (car list)
      (last-element (cdr list))))
  
  