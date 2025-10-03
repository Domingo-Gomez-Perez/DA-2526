#lang racket

;Exercise 1.32

;QUESTION 1

;Show that `sum` and `product` are both special
;cases of a still more general notion called `accumulate` that combines a
;collection of terms, using some general accumulation function:

;```
;(accumulate combiner null-value term a next b)
;```

;`Accumulate` takes as arguments the same term and range specifications as
;`sum` and `product`, together with a `combiner` procedure (of
;two arguments) that specifies how the current term is to be combined with the
;accumulation of the preceding terms and a `null-value` that specifies what
;base value to use when the terms run out.  Write `accumulate` and show how
;`sum` and `product` can both be defined as simple calls to `accumulate`.

;ANSWER

;So basically the accumulate here is the abstraction of any basic operation in a range of numbers
;This is the recursive version of it
(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate-rec combiner null-value term (next a) next b))))

;This would be the definition of SUM with this general call
(define (sum term a next b)
  (accumulate-rec + 0 term a next b))

;This would be the definition of PRODUCT with this general call
(define (product term a next b)
  (accumulate-rec * 1 term a next b))


;QUESTION 2

;If your `accumulate` procedure generates a recursive process, write one
;that generates an iterative process.  If it generates an iterative process,
;write one that generates a recursive process.

;ANSWER 
;For the iterative version of it we have to the define the iter and the accumulator as we did in previous exercises
(define (accumulate-iter combiner null-value term a next b)
  (define (iter x result)
    (if (> x b)
        result
        (iter (next x) (combiner (term x) result))))
  (iter a null-value))
