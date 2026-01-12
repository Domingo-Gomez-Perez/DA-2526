#lang racket
(define (make-accumulator init)
  (define (increase add)
    (begin
      (set! init (+ init add))
      init)
    )
  increase
 )

(define a (make-accumulator 5))

(a 6) ;11
(a 5) ;16
(a 4) ;20
