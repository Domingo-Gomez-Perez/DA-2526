#lang racket
(require racket/mpair) ;; Importante: Racket usa cons inmutables por defecto, necesitamos mpair

;; =============================================================================
;; EJERCICIO 3.16: EL CONTADOR DE PARES DE BEN BITDIDDLE
;; =============================================================================

;; La función propuesta por Ben.
;; ERROR: Cuenta cuántas veces "visita" un nodo, no cuántos nodos únicos existen.
(define (count-pairs x)
  (if (not (mpair? x))
      0
      (+ (count-pairs (mcar x))
         (count-pairs (mcdr x))
         1)))

;; -----------------------------------------------------------------------------
;; CASO 1: RETORNA 3 (Correcto)
;; -----------------------------------------------------------------------------
;; Estructura: Una lista normal de 3 elementos.
;; Pares físicos: 3 (A, B, C).
;; Visitas: A, luego B, luego C. Ninguno se repite.

(define str3 (mcons 'a (mcons 'b (mcons 'c '()))))
;; Diagrama: [A]->[B]->[C]->/

;; -----------------------------------------------------------------------------
;; CASO 2: RETORNA 4 (Compartiendo estructura)
;; -----------------------------------------------------------------------------
;; Estructura: 3 pares físicos, pero uno se comparte.
;;
;; Configuración:
;; 1. Par 'z' (el final).
;; 2. Par 'y' (el medio): Su car apunta a 'z' y su cdr TAMBIÉN apunta a 'z'.
;; 3. Par 'x' (el inicio): Apunta a 'y'.
;;
;; Conteo:
;; - count(z) = 1
;; - count(y) = count(z) + count(z) + 1 = 1 + 1 + 1 = 3
;; - count(x) = count(car x) + count(y) + 1 = 0 + 3 + 1 = 4

(define z (mcons 'c '()))
(define y (mcons z z))      ;; y comparte a z
(define str4 (mcons 'a y))  ;; str4 apunta a y

;; -----------------------------------------------------------------------------
;; CASO 3: RETORNA 7 (Máxima recursión)
;; -----------------------------------------------------------------------------
;; Estructura: 3 pares físicos en estructura piramidal.
;;
;; Configuración:
;; 1. Par 'z'.
;; 2. Par 'y': Comparte a 'z' en car y cdr. (Vale 3 puntos).
;; 3. Par 'x': Comparte a 'y' en car y cdr.
;;
;; Conteo:
;; - count(z) = 1
;; - count(y) = 3 (como vimos arriba)
;; - count(x) = count(y) + count(y) + 1 = 3 + 3 + 1 = 7

(define pairs-z (mcons 'c '()))
(define pairs-y (mcons pairs-z pairs-z))
(define str7    (mcons pairs-y pairs-y))

;; -----------------------------------------------------------------------------
;; CASO 4: NUNCA RETORNA (Ciclo infinito)
;; -----------------------------------------------------------------------------
;; Estructura: Un bucle. x -> y -> z -> x ...
;; Ben no verifica si ya visitó un par, así que la recursión nunca toca el caso base.

(define loop-x (mcons 'a '()))
(define loop-y (mcons 'b '()))
(define loop-z (mcons 'c '()))

(set-mcdr! loop-x loop-y)
(set-mcdr! loop-y loop-z)
(set-mcdr! loop-z loop-x) ;; Vuelta al principio

;; -----------------------------------------------------------------------------
;; EJECUCIÓN
;; -----------------------------------------------------------------------------
(display "Retorna 3: ") (display (count-pairs str3)) (newline)
(display "Retorna 4: ") (display (count-pairs str4)) (newline)
(display "Retorna 7: ") (display (count-pairs str7)) (newline)
;; (count-pairs loop-x) ;; Esto colgaría el programa