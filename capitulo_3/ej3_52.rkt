#lang racket
(require racket/stream)

;; =============================================================================
;; EJERCICIO 3.52: EFECTOS SECUNDARIOS Y MEMOIZACIÓN
;; =============================================================================

;; DEFINICIONES PREVIAS (Necesarias porque Racket no las trae por defecto)
(define (stream-enumerate-interval low high)
  (if (> low high)
      empty-stream
      (stream-cons low
                   (stream-enumerate-interval (+ low 1) high))))

(define (display-stream s)
  (stream-for-each displayln s))

;; -----------------------------------------------------------------------------
;; 1. DEFINICIÓN DEL ACUMULADOR
;; -----------------------------------------------------------------------------
(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

;; -----------------------------------------------------------------------------
;; 2. DEFINICIÓN DE SEQ
;; -----------------------------------------------------------------------------
(display "--- 1. Definiendo seq ---\n")
(define seq 
  (stream-map 
   accum 
   (stream-enumerate-interval 1 20)))

;; ANÁLISIS:
;; Racket (y Scheme estándar) evalúa el PRIMER elemento de un stream inmediatamente.
;; 1. stream-enumerate-interval produce el 1.
;; 2. stream-map aplica (accum 1).
;; 3. sum cambia de 0 a 1.
(display "Valor de sum: ") (displayln sum) 
;; -> sum es 1

;; -----------------------------------------------------------------------------
;; 3. DEFINICIÓN DE Y (Filtro de pares)
;; -----------------------------------------------------------------------------
(display "\n--- 2. Definiendo y (filtro even?) ---\n")
(define y (stream-filter even? seq))

;; ANÁLISIS:
;; stream-filter busca el PRIMER elemento que cumpla la condición.
;; - Examina el 1er elemento de seq (que es 1, ya calculado/memoizado). ¿Es par? No.
;; - Fuerza el 2do elemento: (accum 2) -> sum = 1 + 2 = 3. ¿Es par? No.
;; - Fuerza el 3er elemento: (accum 3) -> sum = 3 + 3 = 6. ¿Es par? SÍ.
;; 'y' se detiene aquí porque encontró su primer elemento (6).
(display "Valor de sum: ") (displayln sum)
;; -> sum es 6

;; -----------------------------------------------------------------------------
;; 4. DEFINICIÓN DE Z (Filtro múltiplos de 5)
;; -----------------------------------------------------------------------------
(display "\n--- 3. Definiendo z (filtro % 5 == 0) ---\n")
(define z 
  (stream-filter 
   (lambda (x) (= (remainder x 5) 0)) seq))

;; ANÁLISIS:
;; stream-filter empieza a buscar desde el principio de 'seq'.
;; - Elemento 1 (valor 1): Ya calculado. ¿Div 5? No.
;; - Elemento 2 (valor 3): Ya calculado. ¿Div 5? No.
;; - Elemento 3 (valor 6): Ya calculado. ¿Div 5? No.
;; NOTA: Como estos valores ya estaban memoizados, 'accum' NO se ejecutó. sum no cambió.
;; - Fuerza el 4to elemento: (accum 4) -> sum = 6 + 4 = 10. ¿Div 5? SÍ.
;; 'z' se detiene aquí.
(display "Valor de sum: ") (displayln sum)
;; -> sum es 10

;; -----------------------------------------------------------------------------
;; 5. EVALUANDO (stream-ref y 7)
;; -----------------------------------------------------------------------------
(display "\n--- 4. Evaluando (stream-ref y 7) ---\n")
(display "Resultado: ") 
(displayln (stream-ref y 7))

;; ANÁLISIS:
;; Queremos el 8vo número par de la secuencia (índice 7).
;; 'seq' genera números triangulares: 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66...
;; Pares encontrados hasta ahora: 6, 10.
;; El sistema sigue generando elementos de 'seq' hasta encontrar suficientes pares.
;; Generará hasta el input 16 -> sum = 136.
;; Pares en 'y': 6, 10, 28, 36, 66, 78, 120, 136. (El octavo es 136).
(display "Valor de sum: ") (displayln sum)
;; -> sum es 136

;; -----------------------------------------------------------------------------
;; 6. EVALUANDO (display-stream z)
;; -----------------------------------------------------------------------------
(display "\n--- 5. Evaluando (display-stream z) ---\n")
(display-stream z)

;; ANÁLISIS:
;; 'z' son los múltiplos de 5.
;; Recorre 'seq' desde el principio.
;; Del 1 al 136 (inputs 1 a 16), los valores YA ESTÁN CALCULADOS.
;; 'accum' NO se ejecuta para ellos. Solo se imprimen los que cumplen la condición.
;; Múltiplos encontrados en cache: 10, 15, 45, 55, 105, 120.
;;
;; Luego, fuerza los elementos restantes (inputs 17 a 20):
;; 17 -> 153
;; 18 -> 171
;; 19 -> 190 (Imprime)
;; 20 -> 210 (Imprime)
;; Fin del stream.
(display "Valor final de sum: ") (displayln sum)
;; -> sum es 210