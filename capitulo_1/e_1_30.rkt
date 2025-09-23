#lang racket


(define (sum-1 x) (+ 1 x))  ; definition of next

(define (identity x) x)  ; definition of term

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a))))) 
  (iter a 0))

; example to test: (sum identity 1 sum-1 5)


    

  
  