#lang racket

;; Procedimiento same-parity:
;; recibe al menos un número (x) y una lista de más números (rest).
;; Devuelve una lista con todos los números que tienen la misma paridad que x.

(define (same-parity x . rest)
  ;; función auxiliar para comprobar si dos números tienen la misma paridad
  (define (same? a b)
    (= (remainder a 2) (remainder b 2)))

  ;; filtramos los elementos de 'rest' que cumplen la paridad de x
  (define (filter-same lst)
    (cond [(null? lst) '()]                            ; caso base
          [(same? x (car lst)) (cons (car lst) (filter-same (cdr lst)))] ; coincide
          [else (filter-same (cdr lst))]))             ; no coincide

  ;; el resultado siempre empieza con x, seguido de los filtrados
  (cons x (filter-same rest)))


(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)