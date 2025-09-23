#lang racket
;; El procedimiento (a-plus-abs-b a b) calcula "a + |b|".
;; El operador (en lugar de ser fijo, como + o -) se elige usando un 'if'.
;; 
;; - Si b > 0, entonces (if (> b 0) + -) devuelve el operador '+'.
;;   Así, la operación es (+ a b) → que es a + b.
;;
;; - Si b <= 0, entonces (if (> b 0) + -) devuelve el operador '-'.
;;   Así, la operación es (- a b) → que equivale a a - b.
;;   Como b es negativo o cero, "a - b" en realidad suma el valor absoluto de b.
;;
;; De este modo, la función implementa a + |b|.

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; Pruebas de la función:

(a-plus-abs-b 5 3)   ; Caso con b positivo: (5 + 3) = 8
(a-plus-abs-b 5 -3)  ; Caso con b negativo: (5 - (-3)) = 8
(a-plus-abs-b 10 0)  ; Caso con b = 0: (10 - 0) = 10

