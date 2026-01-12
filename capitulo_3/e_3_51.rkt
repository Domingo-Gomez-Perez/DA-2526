#lang racket

; Ejercicio 51 del capítulo 3

; Función que printea x y retorna x
;(define (show x)
; (display-line x)
;  x)


; LO QUE HAY QUE EVALUAR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(define x 
;  (stream-map 
;   show 
;  (stream-enumerate-interval 0 10)))

;(stream-ref x 5)
;(stream-ref x 7)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;RESPUESTA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Primero la definición de x:
; se valúa el enumerate-interval, que crea un stream cuyo primer elemento es el 0 y el resto una promesa 1,2,3,4...,10.
; Se evalúa el stream-map de show y del stream 0, [1,2,3...10], que hace el cons-stream de show y del cdr del stream, por lo que se imprime 0 y se almacena en x un stream que
; comienza con un 0 y el resto es una promesa que no se calcula todavía.

; Ahora (stream-ref x 5) busca el elemento en la sexta posición del stream x, porque la primera sería la 0. Para sacar el sexto elemento del stream hay que ir evaluando
; cdr stream, y, por tanto, evaluando el show de la posición que toque. 0 ya se ha evaluado así que seguimos con 1, 2, 3, 4 hasta 5 que se imprime. Además, el stream-ref devuelve ese
; elemento, por lo que se printea otra vez 5.

; Por último, con (stream-ref x 7) ya se ha calculado hasta el 5, no se vuelven a calcular ni ejecutar show para [0,...,5]. Se evalúa show con el 6, con el 7 y se retorna el 7 con el
; stream-ref.

; Total impreso
; 0
; 1
; 2
; 3
; 4
; 5
; 5
; 6
; 7


