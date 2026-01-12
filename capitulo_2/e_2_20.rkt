#lang racket

(define (paridad inicial . resto)
  (define es-par (if (even? inicial) even? odd?))
  (cons inicial (filter es-par resto)))

(paridad 1 2 3 4 5 6 7)
; Resultado (1 3 5 7)

(paridad 2 3 4 5 6 7)
; Resultado (2 4 6)