#lang racket
; Ejercicio 1 del capitulo 2
;
; Definir el make rat de forma que si le paso 2 numeros negativos, com el racional es positivo salgan ambos positivos. Si el número es negativo
; solo el numerador será negativo
(define (make-rat n d)
  (cond ((and (< n 0) (< d 0)) (cons (- n) (- d))) ; Si los dos son negativos, se les da la vuelta
        ((< d 0) (cons (- n) (- d))) ; Si solo d es negativo, también se les da la vuelta
        (else (cons n d)))) ; El resto de opciones se queda como está

; PRUEBAS
(make-rat -2 -3)
(make-rat 2 3)
(make-rat -2 3)
(make-rat 2 -3)

        
      
      