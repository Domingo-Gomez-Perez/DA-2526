#lang racket
;; Ej. 1.16 — fast-expt iterativo
;;
;; Normalmente, calcular b^n recursivamente acumula llamadas pendientes.
;; Aquí usamos un acumulador (a) para guardar el resultado parcial,
;; de forma que el proceso sea iterativo (tail recursion).
;;
;; Invariante: a * b^n se mantiene constante en cada paso.
;;
;; - Caso base: si n = 0, el resultado es a.
;; - Si n es par: b^n = (b^2)^(n/2).  Entonces actualizamos b := b*b y n := n/2.
;;   El acumulador a no cambia.
;; - Si n es impar: b^n = b * b^(n-1).  Entonces actualizamos a := a*b y n := n-1.
;;   El invariante sigue siendo válido.
;;
;; Así reducimos n rápidamente (mitad cada vez que es par),
;; Así reducimos n rápidamente (mitad cada vez que es par),
;; logrando un proceso iterativo con complejidad O(log n).

(define (fast-expt b n)
  (define (iter a b n)
    (cond [(= n 0) a]  ; caso base: cuando n es 0, el resultado acumulado es a
          ;; (even? n) → predicado que devuelve #t si n es par, #f si es impar
          ;; (quotient n 2) → devuelve el cociente entero de dividir n entre 2
          [(even? n) (iter a (* b b) (quotient n 2))]
          ;; (else ...) → caso contrario: n impar
          ;; (* a b) → multiplica el acumulador por la base
          ;; (- n 1) → resta 1 al exponente
          [else (iter (* a b) b (- n 1))]))
  ;; iniciamos con a = 1 (neutro multiplicativo)
  (iter 1 b n))

;; Pruebas
(fast-expt 2 16)  ; => 65536
(fast-expt 3 5)   ; => 243
(fast-expt 5 0)   ; => 1
