#lang racket
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; El 1 como función. Es decir, se ejecuta una función 1 vez
(define one (lambda (f) (lambda(x) f x)))

; El 2 como función. Es decir, se ejecuta una función 2 veces
(define two (lambda (f) (lambda(x) (f (f x)))))

; Suma como procedimiento
(define (+ m n)
  (lambda(f)
    (lambda(x)
      ((m f) ((n f) x)))))
  