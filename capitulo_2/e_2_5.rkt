#lang racket
; Ejericio 2.5

(define (cons a b)
  (* (expt 2 a) (expt 3 b))) ; Codifica a y b como factores primos

(define (car x)
  (define (n-divs n divisor contador)
    (if (= 0 (remainder n divisor))
        (n-divs (/ n divisor) divisor (+ contador 1))
        contador))
  (n-divs x 2 0)) ; Cuenta factores de 2

(define (cdr x)
  (define (n-divs n divisor contador)
    (if (= 0 (remainder n divisor))
        (n-divs (/ n divisor) divisor (+ contador 1))
        contador))
  (n-divs x 3 0)) ; Cuenta factores de 3

; Ejemplos
(define a (cons 8 64))
(println a) ; 43046721
(car a) ; 8
(cdr a) ; 64

(define b (cons 25 9))
(println b) ; 19683
(car b) ; 25
(cdr b) ; 9

