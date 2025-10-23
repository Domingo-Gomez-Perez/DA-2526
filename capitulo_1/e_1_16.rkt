#lang racket
(define (fast-expt number exp)
  (define (fast-expt-iter number exp result)
    (if (= exp 0)
        result
        (if (es-par? exp)
            (fast-expt-iter (* number number) (/ exp 2) result) ; a^n = (a^2)^(n/2)
            (fast-expt-iter number (- exp 1) (* result number)) ; a^n = a * a^(n-1) --> Must remember 'a' keep it in 'result'.
            )
        )
    )
  (fast-expt-iter number exp 1)
  )


(define (es-par? number)
   (= (remainder number 2) 0)
  )