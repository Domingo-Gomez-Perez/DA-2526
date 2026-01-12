#lang racket
(require racket/stream)

;; =============================================================================
;; LECTURA 3.5.2: Implementar add-streams sin usar stream-map
;; =============================================================================

;; La función debe sumar elemento a elemento y retrasar el cálculo del resto.
(define (add-streams s1 s2)
  (if (stream-empty? s1)
      empty-stream
      (stream-cons (+ (stream-first s1) (stream-first s2))
                   (add-streams (stream-rest s1) (stream-rest s2)))))

;; =============================================================================
;; EJERCICIO 3.53: El stream 's'
;; =============================================================================

;; Definición dada en el ejercicio
(define s (stream-cons 1 (add-streams s s)))

;; =============================================================================
;; PRUEBAS PARA VERIFICAR
;; =============================================================================

;; Función auxiliar para imprimir los primeros N elementos
(define (print-first-n stream n)
  (if (= n 0)
      (void)
      (begin
        (displayln (stream-first stream))
        (print-first-n (stream-rest stream) (- n 1)))))

(displayln "--- Primeros 10 elementos del stream 's' (Ejercicio 3.53) ---")
(print-first-n s 10)

;; SALIDA ESPERADA:
;; 1
;; 2
;; 4
;; 8
;; 16
;; 32
;; 64
;; 128
;; 256
;; 512