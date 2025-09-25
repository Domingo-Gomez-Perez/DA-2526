#lang racket

; Devuelve el valor x al cubo
(define (cube x)
  (* x x x))

; Comprueba si guess elevado al cubo esta suficientemente cerca de x
(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

; Calcula una nueva aproximacion usando el metodo de Newton
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

; Si la conjetura es buena la retorna, en caso contrario la sigue mejorando
(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x) x)))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(cbrt 8) ; -> 2.000004911675504




