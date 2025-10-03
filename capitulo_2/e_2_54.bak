#lang racket

;; Definición de equal? recursiva
(define (my-equal? a b)
  (cond
    ;; Caso 1: ambos son símbolos
    [(and (symbol? a) (symbol? b))
     (eq? a b)]

    ;; Caso 2: ambos son números
    [(and (number? a) (number? b))
     (= a b)]

    ;; Caso 3: ambos son listas
    [(and (pair? a) (pair? b))
     (and (my-equal? (car a) (car b))
          (my-equal? (cdr a) (cdr b)))]

    ;; Caso 4: ambos son vacíos
    [(and (null? a) (null? b)) #t]

    ;; En cualquier otro caso
    [else #f]))

;; Pruebas del enunciado
(my-equal? '(this is a list) '(this is a list))
; => #t

(my-equal? '(this is a list) '(this (is a) list))
; => #f

;; Pruebas con números
(my-equal? 5 5)
; => #t

(my-equal? '(1 2 3) '(1 2 3))
; => #t

(my-equal? '(1 2 3) '(1 2 (3)))
; => #f
