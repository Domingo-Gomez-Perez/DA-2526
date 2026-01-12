#lang racket

; Ejercicio 2.4
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
    (z (lambda (p q) p)))

(define (cdr z)
    (z (lambda (p q) q)))

; Ejemplos
(define a (cons 1 2))
(car a) ; 1
(cdr a) ; 2

(define b (cons 'a 'b))
(car b) ; a
(cdr b) ; b