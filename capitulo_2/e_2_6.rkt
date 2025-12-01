#lang racket

;; Ejercicio 2.6
;; Church numerales
(define zero (lambda (f) (lambda (x) x)))
(define one  (lambda (f) (lambda (x) (f x))))
(define two  (lambda (f) (lambda (x) (f (f x)))))

;; Suma de Church numerales
(define (+-church m n)
  (lambda (f)
    (lambda (x)
      ((m f) ((n f) x)))))

;; Conversión a número entero
(define (church->int n)
  ((n (lambda (x) (+ x 1))) 0))

;; Pruebas
(displayln "Numeralesde Church")
(displayln (string-append "zero = " (number->string (church->int zero)))) ; 0
(displayln (string-append "one = " (number->string (church->int one))))   ; 1
(displayln (string-append "two = " (number->string (church->int two))))   ; 2

(define three ((add-1 two)))
(displayln (string-append "three (add-1 two) = " (number->string (church->int three)))) ; 3

(define five ((+-church two three)))
(displayln (string-append "two + three = " (number->string (church->int five)))) ; 5
