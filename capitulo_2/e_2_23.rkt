#lang racket

(define (for-each proc items)
  (if (null? items)
      #t                      ; devuelve el valor arbitrario "t"
      (begin
        (proc (car items))    ; aplica el procedimiento al primer elemento
        (for-each proc (cdr items))))) 

;; Ejemplo de uso
(for-each
 (lambda (x)
   (newline)
   (display x))
 (list 57 321 88))
