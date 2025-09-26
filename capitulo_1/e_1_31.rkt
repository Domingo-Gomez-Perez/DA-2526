#lang racket

; Version recursiva
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

; Version iterativa
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

; Comprobación
(product (lambda (x) (* x x)) 2 (lambda (x) (+ x 1)) 5)
(product-iter (lambda (x) (* x x)) 2 (lambda (x) (+ x 1)) 5)

(define (inc n)
  (+ n 1))

; Factorial
(define (factorial n)
  (product (lambda (x) x) 1 inc n))

; Comprobacion
(factorial 5)

; Aproximación de pi
(define (pi-approx n)
  (define (square x) (* x x))
  (define (next x) (+ x 2))
  (* 4
     (/
      (* 2 (product square 4.0 next n))
      (* n (product square 3.0 next (- n 1))))))

; Comprobacion
(pi-approx 100)
