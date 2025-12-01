#lang racket


;; Ejercicio 2.23
;; ===============
;; Función
;; 
(define (for-each proc lst)
  (if (null? lst)
      #t                                  ; valor arbitrario cuando termina
      (begin
        (proc (car lst))                   ; aplica proc al primer elemento
        (for-each proc (cdr lst)))))      ; recurre con el resto de la lista


(for-each
 (lambda (x)
   (newline)
   (display x))
 (list 57 321 88))
