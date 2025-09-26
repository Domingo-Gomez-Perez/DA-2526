#lang racket
(define (fast-mul-iter a b)
  ;; Función auxiliar con acumulador 'result'
  (define (iter a b result)
    (cond
      ;; Si b es 0, devolvemos el acumulador
      ((= b 0) result)
      
      ;; Si b es par, doblamos 'a' y dividimos 'b' entre 2
      ((even? b) (iter (* 2 a) (/ b 2) result))
      
      ;; Si b es impar, sumamos 'a' al acumulador y restamos 1 a 'b'
      (else (iter a (- b 1) (+ result a)))))
  ;; Llamamos a la función iterativa con acumulador inicial en 0
  (iter a b 0))