#lang racket
(define (square x) (* x x))

(define (sum-of-squares-of-two-largest a b c)
  (cond ((and (<= a b) (<= a c)) (+ (square b) (square c)))
        ((and (<= b a) (<= b c)) (+ (square a) (square c)))
        (else (+ (square a) (square b)))))

(sum-of-squares-of-two-largest 1 2 3) ; -> 13
(sum-of-squares-of-two-largest 4 3 5) ; -> 41
(sum-of-squares-of-two-largest 6 5 2) ; -> 61