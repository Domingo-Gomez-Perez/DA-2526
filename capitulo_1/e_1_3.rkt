#lang racket

(define (square x)
  (* x x)
  )

(define (sum-of-squares-of-two-largest a b c)
  (if (>= a b) ; a >= b ?
      (if (>= b c) ; if a >= b, then b >= c ?
          (+ (square a) (square b)) ; a >= b and b >= c -> (a*a) + (b*b)
      (+ (square a) (square c)) ; a >= b and c > b -> (a*a) + (c*c)
      )
      (if (>= a c) ; if c > a, then a >= c ?
          (+ (square a) (square b)) ; b > a and a >= c -> (a*a) + (b*b)
          (+ (square b) (square c)) ; b > a and c > a -> (b*b) + (c*c)
          )
      )
  )