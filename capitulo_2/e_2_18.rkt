#lang racket

(define (reverse l)
  (flatten (reverse-rec l '()))
  )

;This algorythm only requires n steps for a list of n items
(define (reverse-rec l res)
  (if (null? l)
      res
      (reverse-rec (cdr l) (cons (car l) res))
      )
  )

(reverse (list 1 4 9 16 25))
(reverse (list 6 5 4 3 2 1))