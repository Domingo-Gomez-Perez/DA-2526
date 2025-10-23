#lang racket
(define (p) (p))

(define (test x y) 
  (if (= x 0) 
      0 
      y))

(test 0 (p))


; 1. Applicative-order evaluation:
; En la evaluación por orden aplicativo, los argumentos de una función se evalúan antes de que la función sea llamada. Al evaluar (test 0 (p)):

; x = 0 se evalúa normalmente.
; y = (p) intenta evaluar la expresión (p), pero (p) esta definida como (p), lo que causa una recursión infinita.

; CONCLUSION: El programa entra en un bucle infinito.

; 2. Normal-order evaluation:
; En la evaluación por orden normal, los argumentos de una función no se evalúan hasta que son necesarios. Al evaluar (test 0 (p)):

; x = 0 es evaluado.
; La expresión if (= x 0) es verdadera, por lo que el if retorna 0 sin evaluar y = (p).

; CONCLUSION: Se retorna 0 inmediatamente, ya que no se necesita evaluar (p), evitando asi la recursión infinita.
