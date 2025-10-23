#lang racket
(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))


(define (square x) (* x x))

((repeated square 2) 5)
;; paso 1: square(square(5))
;; square(5) = 25
;; square(25) = 625
;; resultado => 625