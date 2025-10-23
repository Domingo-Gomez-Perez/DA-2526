#lang racket


(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))


(define (productiter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorialiter n)
  (productiter (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(define (factorial n)
  (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(factorialiter 5)
(factorial 5)


; Aproximación de pi usando product
(define (pi-approx n)
  (* 4.0
     (/ (product (lambda (n) (* 2.0 n (* 2.0 n)))
                 1
                 (lambda (n) (+ n 1))
                 n)
        (product (lambda (n) (* (- (* 2.0 n) 1) (- (* 2.0 n) 1)))
                 1
                 (lambda (n) (+ n 1))
                 n))))
(pi-approx 10)
(pi-approx 50)
(pi-approx 100)