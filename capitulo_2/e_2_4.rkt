#lang racket
(define (cons x y) 
  (lambda (m) (m x y)))

(define (car z) 
  (z (lambda (p q) p)))

; (car (cons 2 3)) --> Output 2, does yield the value of x.

(define (cdr z)
  (z (lambda (p q) q)))