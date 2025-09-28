#lang racket
(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (plus a b)
  (if (= a 0) 
      b 
      (inc (plus (dec a) b))))

; (plus 3 4)
; (inc (plus 2 4))
; (inc (inc (plus 1 4)))
; (inc (inc (inc (plus 0 4))))
; (inc (inc (inc 4)))
; (inc (inc 5))
; (inc 6)
; 7
; Cada llamada a plus queda pendiente de un inc
; Es un procedimiento recursivo -> "linear recursion"

(define (plus a b)
  (if (= a 0) 
      b 
      (plus (dec a) (inc b))))

; (plus 3 4)
; (plus 2 5)
; (plus 1 6)
; (plus 0 7)
; 7
; No se acumulan operaciones pendientes
; Es un procedimiento recursivo -> "linear iteration"
