#lang racket

(define (f a b c) (cond (( and (> a b) (> b c)) (+ (* a 1) (* b b)))
      (else 25)))

(f 3 2 1)