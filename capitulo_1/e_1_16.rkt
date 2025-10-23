#lang racket

;; La función fast-expt-iter calcula b^n de manera iterativa.

(define (fast-expt-iter b n)
  ;; iter es una función auxiliar con un acumulador 'result'
  ;; que guarda el valor parcial de la exponenciación.
  (define (iter b n result)
    (cond
      ;; Caso base: cualquier número elevado a 0 es 1,
      ;; por lo tanto devolvemos el acumulador result.
      ((= n 0) result)

      ;; Caso par: b^n = (b*b)^(n/2).
      ;; Aquí transformamos el problema y no tocamos el acumulador todavía.
      ((even? n)
       (iter (* b b) (/ n 2) result))

      ;; Caso impar: b^n = b * b^(n-1).
      ;; Aquí multiplicamos 'result' por b y reducimos el exponente.
      (else
       (iter b (- n 1) (* result b)))))
  
  ;; Llamada inicial: acumulador empieza en 1
  (iter b n 1))

;; Prueba
(fast-expt-iter 2 0)   ; => 1   (caso base)
(fast-expt-iter 2 1)   ; => 2   (2^1)
(fast-expt-iter 2 10)  ; => 1024 (2^10)
(fast-expt-iter 3 5)   ; => 243  (3^5)
(fast-expt-iter 5 3)   ; => 125  (5^3)