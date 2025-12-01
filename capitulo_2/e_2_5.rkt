#lang racket


;;Ejercicio 2.5
;; Representa el par (a, b) como 2^a * 3^b
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

;; Recuperamos el número de veces que 2 divide n
(define (car z)
  (define (count-divisions n factor)
    (if (zero? (remainder n factor))
        (+ 1 (count-divisions (/ n factor) factor))
        0))
  (count-divisions z 2))  ;el número de factores de 2

;; Recupera el número de veces que 3 divide n
(define (cdr z)
  (define (count-divisions n factor)
    (if (zero? (remainder n factor))
        (+ 1 (count-divisions (/ n factor) factor))
        0))
  (count-divisions z 3))  ;obtenemos número de factores de 3
