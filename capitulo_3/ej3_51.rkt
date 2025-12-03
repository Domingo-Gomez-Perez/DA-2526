#lang racket
(require racket/stream)

;; =============================================================================
;; DEFINICIONES PREVIAS NECESARIAS
;; =============================================================================

;; Esta es la función que faltaba. Racket no la trae por defecto.
;; Genera un stream de números enteros desde 'low' hasta 'high'.
(define (stream-enumerate-interval low high)
  (if (> low high)
      empty-stream
      (stream-cons low
                   (stream-enumerate-interval (+ low 1) high))))

;; Función auxiliar del ejercicio 3.51
(define (show x)
  (displayln x)
  x)

;; =============================================================================
;; EJECUCIÓN DEL EJERCICIO 3.51
;; =============================================================================

(display "--- 1. Definiendo x ---\n")
;; Al definir x, se evalúa el primer elemento (0).
;; stream-map aplica 'show' al 0 inmediatamente.
(define x 
  (stream-map 
   show 
   (stream-enumerate-interval 0 10)))
;; Salida esperada: 0

(display "\n--- 2. Evaluando (stream-ref x 5) ---\n")
;; Accedemos al elemento 5. Se calculan e imprimen del 1 al 5.
(stream-ref x 5)
;; Salida esperada:
;; 1
;; 2
;; 3
;; 4
;; 5
;; 5 (valor de retorno)

(display "\n--- 3. Evaluando (stream-ref x 7) ---\n")
;; Accedemos al 7. Del 0 al 5 ya están memoizados (no se imprimen).
;; Solo se calculan e imprimen el 6 y el 7.
(stream-ref x 7)
;; Salida esperada:
;; 6
;; 7
;; 7 (valor de retorno)