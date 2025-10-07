#lang racket

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5) ; Retorna 5
(new-if (= 1 1) 0 5) ; Retorna 0

(define (square x) (* x x))

(define (average x y) 
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; Version original con el if normal
(define (sqrt-iter-original guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter-original (improve guess x) x)))

; Version con el new-if
(define (sqrt-iter-new-if guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter-new-if (improve guess x) x)))

(sqrt-iter-original 1.0 2) ; Realiza la aproximación correctamente
;(safe-sqrt-iter-new-if 1.0 2) ; Si se ejecuta esto el programa no termina, se queda en un bucle infinito.

; El motivo por el que se queda en un bucle infinito es porque new-if se trata de un procedimiento
; que en racket emplea applicative-order, es decir, todos los argumentos de la función se evalúan antes de
; aplicar la función. Esto resulta en que el algoritmo intenta constantemente mejorar el resultado ejecutando
; (sqrt-iter-new-if (improve guess x) x)) cuando en realidad ya se tiene un resultado suficientemente bueno como
; para que la condición (good-enough? guess x) se cumpla, y nunca retorna el guess.
; Con el if es distinto, pues emplea normal-order y por lo tanto en cuanto se cumple la condición (good-enough? guess x)
; directamente retorna la aproximación sin tener que evaluar (sqrt-iter-new-if (improve guess x) x))).
