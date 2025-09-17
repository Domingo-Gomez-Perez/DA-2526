#lang racket

(define(cuadrado x)
  (* x x))

(define (cubo x)
  (* x x x))

(define (raiz-cubica aproximacion x)
  (if (esta-bien-aproximacion-cubica? aproximacion x)
      aproximacion
      (raiz-cubica (mejorar-aproximacion-cubica aproximacion x) x)))

(define (esta-bien-aproximacion-cubica? aproximacion x)
  (< (abs (- (cubo aproximacion) x)) 0.001))


(define (mejorar-aproximacion-cubica aproximacion x)
  (/ (+ (/ x (cuadrado aproximacion))
        (* 2 aproximacion))
     3))

;Similar a el ejemplo de clase de la raiz cuadrada

(raiz-cubica 1.0 8)  
(raiz-cubica 1.0 27)      

