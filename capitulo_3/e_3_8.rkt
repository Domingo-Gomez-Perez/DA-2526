#lang racket
(define temp 1)   ; El valor de temp indica si es el primer argumento
(define (f x)
  (if (> temp 0)
      (begin
        (set! temp 0) ; La primera llamada a la función cambia el valor de temp
        x
        )
      0
  )
)

(+ (f 0) (f 1)) ;0
(set! temp 1)
(+ (f 1) (f 0)) ;1