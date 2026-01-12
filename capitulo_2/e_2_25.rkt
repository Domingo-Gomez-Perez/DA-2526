#lang racket
; Ejercicio 25 del capitulo 2
;
; Sacar con combinaciones de car y cdr el 7 de las siguientes listas
(define (lista1)
  (list 1 3 (list 5 7) 9))
(lista1)
; (1 3 (5 7) 9)
(car (cdr (car (cdr (cdr (lista1))))))

(define (lista2)
  (list (list 7)))
(lista2)
;((7))
(car (car (lista2)))

(define (lista3)
  (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(lista3)
;(1 (2 (3 (4 (5 (6 7))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (lista3)))))))))))))



