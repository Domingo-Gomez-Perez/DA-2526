#lang racket

(define s (stream-cons 1 (add-streams s s)))

; La funcion te va devolviendo las potencias de dos.
; Si llamas directamente al cdr-stream de s te devuelve 2^0.
; Cada vez que se llama a car-stream se calcula el siguiente elemento
; que equivale al doble del anterior y se situa este en la cabeza de la lista. 
; Si la head se llega a inicializar en 5, cada elemento de la lista equivaldria a 
;  5 * 2^i siendo i el indice del elemento en la lista empezando en 0.