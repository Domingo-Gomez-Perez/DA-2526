#lang racket
(define (p) (p))

(define (test x y) 
  (if (= x 0) 
      0 
      y))

(test 0 (p))

; QUESTION: What behavior will Ben observe with an interpreter that uses applicative-order evaluation?

; ANSWER: Ben observará que el programa no terminará de ejecutar, pues tiene que evaluar (p) antes
; de aplicar test. Esto resulta en un bucle infinito de evaluación de (p) por culpa de (define (p) (p)),
; que es recursivo.

; QUESTION: What behavior will he observe with an interpreter that uses normal-order evaluation?

; ANSWER: En un intérprete así se evaluará test con el argumento 0 antes de evaluar (p), luego nada más
; en el if (=x 0) observa que el 'x' que se pasa es cero y por tanto retorna 0, sin haber tenido que evaluar
; 'y' en ningún momento.