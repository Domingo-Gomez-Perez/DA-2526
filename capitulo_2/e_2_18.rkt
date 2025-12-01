#lang racket


;; Ejercicio 2.18

;; ============================================
;; Definir un procedimiento inverso que toma una lista como argumento  y retorna la lista con los mismo elementos en orden inverso
(define (reverse lst)
  ;;
  (if (null? lst)
      '()
      (append (reverse (cdr lst)) (list (car lst)))))



;; Prueba
;; =========================================
(displayln (reverse (list 1 4 9 16 25))) ; Salida esperada (25 16 9 4 1)
