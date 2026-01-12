#lang racket

;Ejercicio 2.6

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define zero (lambda (f) (lambda (x) x))) ; Aplica f cero veces a x

(define one (lambda (f) (lambda (x) (f x)))) ; Aplica f una vez a x

(define two (lambda (f) (lambda (x) (f ((one f) x))))) ; Aplica f dos veces a x

; Ejercicio 6 especial part

(define (TRUE x y) x)
(define (FALSE x y) y)

(define (NOT a)
  (a FALSE TRUE))

(define (AND a b)
  (a b FALSE))

(define (OR a b)
  (a TRUE b)) 

; Ejemplos de uso
(NOT TRUE) ; FALSE
(NOT FALSE) ; TRUE
(AND TRUE FALSE) ; FALSE
(AND TRUE TRUE) ; TRUE
(OR TRUE FALSE) ; TRUE
(OR FALSE FALSE) ; FALSE
