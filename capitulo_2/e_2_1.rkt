#lang racket


(define (make-rat n d)
  (if (> n 0)
      (if (> d 0) (cons n d) (cons (* n -1) (* d -1)))
          (if (< d 0) (cons (* n -1) (* d -1)) (cons n d)))
)

;Ejemplos de funcionamiento
(make-rat 1 2)
(make-rat 1 -2)
(make-rat -1 2)
(make-rat -1 -2)