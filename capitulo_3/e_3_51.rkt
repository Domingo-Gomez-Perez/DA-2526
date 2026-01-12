#lang racket
(require racket/stream)

(define (show x)
  (displayln x)
  x)

(define x
  (stream-map
   show
   (in-range 0 11)))

(stream-ref x 5)
(stream-ref x 7)

;; En racket/stream no hay memoización: cada stream-ref recorre y evalúa
;; otra vez la secuencia. Por eso show se ejecuta 2 veces y salen 5 5 y 7 7.
