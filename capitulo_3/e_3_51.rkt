#lang racket
(require racket/stream)

;; Procedimiento show del ejercicio
(define (show x)
  (displayln x)   ;; imprimo primero el valor
  x)              ;; devuelvo luego el mismo valor

;; Definición del stream x
;; stream-map aplica 'show' a cada elemento del stream
;; stream-enumerate comienza desde 0 y genera infinitos números
(define x
  (stream-map
   show
   (in-naturals 0)))   ;; equivalente a stream-enumerate-interval en SICP

;; ¿Qué imprime el intérprete?

;; (stream-ref x 5)
;; --- Mis comentarios ---
;; Para obtener el elemento 5, el stream se evalúa de forma perezosa,
;; así que se generan los valores desde 0 hasta 5.
;; Cada vez que se genera un valor, 'show' lo imprime inmediatamente.
;;
;; Por tanto, en pantalla aparece:
;;
;; 0
;; 1
;; 2
;; 3
;; 4
;; 5
;;
;; Después de imprimirlos, stream-ref devuelve el valor 5,
;; pero ese valor NO vuelve a imprimirse automáticamente.
(stream-ref x 5)

;; (stream-ref x 7)
;; --- Mis comentarios ---
;; Como los valores 0–5 ya se generaron y quedaron memorizados,
;; no se vuelven a imprimir.
;; El stream continúa desde el 6 hasta llegar al 7.
;; Por lo tanto, ahora solo se imprimen:
;;
;; 6
;; 7
(stream-ref x 7)
;; En DrRacket, solo se imprime 5 5 7 7, ya que DrRacket no muestra los resultados del show. Sin embargo en un SICP si que se mostraria la cadena 0 1 2 3 4 5 5 6 7 7