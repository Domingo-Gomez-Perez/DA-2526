#lang racket

(define (p) (p)) ; función que se llama a sí misma infinitamente

(define (test x y)
  (if (= x 0)
      0
      y))

; Al evaluar la función podemos comprobar que se queda colgado el programa.
(test 0 (p))

; Con evaluación por orden aplicativo (la que usa Racket):
; (test 0 (p)) intenta evaluar (p) antes de entrar en test,
; por lo que entra en un bucle infinito (no termina).

; Con evaluación por orden normal (teórica, no la de Racket), sustituye sin evaluar los argumentos y solo evalúa lo necesario:
; (test 0 (p)) => (if (= 0 0) 0 (p)) => (if #t 0 (p)) => 0
