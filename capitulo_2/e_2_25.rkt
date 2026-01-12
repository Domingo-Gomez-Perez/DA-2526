#lang racket

;Ejercicio 2. 25 Usa combinaciones de cdr y car que extraigan 7

;(1 3 (5 7) 9)
(define lista '(1 3 (5 7) 9))
(car (cdr (car (cddr lista))))

;((7))
(define lista2 '((7)))
(car (car lista2))

;(1 (2 (3 (4 (5 (6 7))))))
(define lista3 '(1 (2 (3 (4 (5 (6 7)))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr lista3))))))))))))