#lang racket
(define (deep-reverse l)
  (reverse-rec l '())
  )

;This algorythm only requires n steps for a list of n items
(define (reverse-rec l res)
  (if (null? l)
      res
      (if (list? (car l))
          (reverse-rec (cdr l) (cons (deep-reverse (car l)) res)) ;Siguiente elemento es una lista
          (reverse-rec (cdr l) (cons (car l) res))                  ;Siguiente elemento no es una lista
          )
      )
  )

(deep-reverse (list 1 4 9 '(2 6 8) 25 16))
(deep-reverse (list 6 5 4 '(65 43) 3 2 1 '(32 1)))

(deep-reverse (list (list 1 2) (list 3 4)))