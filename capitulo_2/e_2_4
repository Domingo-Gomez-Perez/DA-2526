#lang racket

;; Ejercicio 2.4
;; ============================================
;; Definición alternativa de cons, car y cdr
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))  ; devuelve el primer elemento

(define (cdr z)
  (z (lambda (p q) q)))  ; devuelve el segundo elemento

;; ============================================
;; Pruebas
(define pair (cons 10 20))

(displayln "=== Pruebas con la implementación alternativa de pares ===")
(displayln (string-append "car (cons 10 20): " (number->string (car pair)))) ; 10
(displayln (string-append "cdr (cons 10 20): " (number->string (cdr pair)))) ; 20

;; Otro ejemplo con strings
(define pair2 (cons "hola" "mundo"))
(displayln (string-append "car (cons \"hello\" \"world\"): " (car pair2))) ; "hola"
(displayln (string-append "cdr (cons \"hello\" \"world\"): " (cdr pair2))) ; "mundo"
