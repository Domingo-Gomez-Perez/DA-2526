#lang racket
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; Vamos a comprobar paso a paso el procedimiento:
; 1. (if (> b 0) + -)
; Si b es positivo, la expresión devuelve el procedimiento +
; Si b es cero o negativo, devuelve el procedimiento -
; 2. ((if (> b 0) + -) a b))
; Si b es positivo, devuelve a + b
; Si b es negativo, devuelve a - (-b)
; En ambos casos el procedimiento devuelve a + |b|

(a-plus-abs-b 2 4) ; -> 6
(a-plus-abs-b 2 -4) ; -> 6
(a-plus-abs-b 2 0) ; -> 2