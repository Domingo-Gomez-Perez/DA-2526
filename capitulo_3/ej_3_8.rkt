#lang racket

;Hago una función f tal que el resultado de (+ (f 0) (f 1)) depende del orden de evaluación.

(define (f x)
  (if (= x 0)
      (begin
        (set! a 1)
        0)
      a))

(define a 0)


(+ (f 0) (f 1))
