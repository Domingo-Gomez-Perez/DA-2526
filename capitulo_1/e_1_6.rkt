#lang racket
(define (new-if predicate 
                then-clause 
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

(define (square x)
  (* x x))

; Comprueba si la aproximacion guess es suficientemente buena para la raiz cuadrada de x
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y) 
  (/ (+ x y) 2))

; Calcula una nueva aproximacion de la raiz cuadrada usando el metodo de Newton
(define (improve guess x)
  (average guess (/ x guess)))

; Calcula la raiz cuadrada de x utilizando el new-if
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; Calcula la raiz cuadrada de x utilizando el if
(define (sqrt-iter2 guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter2 (improve guess x) x)))

(define (sqrt2 x)
  (sqrt-iter2 1.0 x))

(sqrt 2)
(sqrt2 2)

; Al utilizar sqrt-iter con el new-if el programa no termina. Esto ocurre porque en Scheme, al llamar
; a un procedimiento ordinario, todos los argumentos se evaluan antes de que la funcion sea ejecutada
; (orden aplicativo).

; Por lo tanto new-if evalua tanto la clausula then (guess) como la clausula else ((sqrt-iter (improve guess x) x))
; antes de que se ejecute la funcion. Esto da lugar a que, incluso aunque la condicion good-enough? sea verdadera,
; se llame recursivamente a sqrt-iter, causando un bucle infinito.