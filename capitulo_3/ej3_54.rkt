#lang racket
(require racket/stream)

;; =============================================================================
;; EJERCICIO 3.54
;; =============================================================================

;; PRE-REQUISITO: Stream de enteros
(define (integers-starting-from n)
  (stream-cons n (integers-starting-from (+ n 1))))
(define integers (integers-starting-from 1))

;; -----------------------------------------------------------------------------
;; 1. mul-streams (IMPLEMENTACIÓN MANUAL)
;; -----------------------------------------------------------------------------
;; Corregimos esto para no depender de un stream-map avanzado.
;; Hacemos la multiplicación elemento a elemento explícitamente.

(define (mul-streams s1 s2)
  (if (stream-empty? s1)
      empty-stream
      (stream-cons (* (stream-first s1) (stream-first s2))
                   (mul-streams (stream-rest s1) (stream-rest s2)))))

;; -----------------------------------------------------------------------------
;; 2. Definición de factorials
;; -----------------------------------------------------------------------------
(define factorials
  (stream-cons 1 
               (mul-streams factorials (stream-rest integers))))

;; =============================================================================
;; PRUEBAS
;; =============================================================================

(displayln "--- Primeros 6 elementos de factorials (CORREGIDO) ---")

(define (print-n-elements s n)
  (if (= n 0)
      (void)
      (begin
        (displayln (stream-first s))
        (print-n-elements (stream-rest s) (- n 1)))))

(print-n-elements factorials 6)