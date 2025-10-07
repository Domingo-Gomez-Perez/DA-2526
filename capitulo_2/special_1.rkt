#lang racket
(define (TRUE x y) x)
(define (FALSE x y) y)

(define (NOT func)
  (lambda (x y) (func y x)))

(define (AND func1 func2)
  (lambda (x y) (func1 (func2 x y) (func1 x y))))

(define (OR func1 func2)
  (lambda (x y) (func1 (func1 x y) (func2 x y))))

