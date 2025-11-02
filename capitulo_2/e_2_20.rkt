#lang racket


;Se obtiene la paridad del primer elemento, y luego se filtra dependiendo de su paridad
(define (same-parity . numeros)
  (let*  ((primero (car numeros))        
         (par? (even? primero)))         
    (filter (lambda (n) (if par? (even? n) (odd? n))) numeros))) 

