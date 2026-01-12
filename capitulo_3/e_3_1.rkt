#lang racket

(define (make-accumulator initial)
  (define (accumulator num)
    (set! initial (+ num initial))
    initial
    )
  accumulator
  )

; Prueba de funcionamiento
(define A (make-accumulator 5))
(define B (make-accumulator 0))

(A 10)
(B 1)
(A 10)
