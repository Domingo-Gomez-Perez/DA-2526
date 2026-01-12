#lang racket

; El first y rest es lo mismo que car y cdr.
(define (stream-map proc s1 s2)
  (stream-cons 
   (proc (stream-first s1) (stream-first s2))
   (stream-map proc (stream-rest s1) (stream-rest s2))
   )
  )

(define (mul-streams s1 s2) 
  (stream-map * s1 s2))

(define (integers-from n)
  (stream-cons n (integers-from (+ n 1))))

(define factorials (stream-cons 1 (mul-streams (integers-from 1) factorials)))

(stream-first (stream-rest(stream-rest(stream-rest(stream-rest factorials))))) ; Factorial de 4 