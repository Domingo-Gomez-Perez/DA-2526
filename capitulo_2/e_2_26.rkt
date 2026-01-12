#lang racket
; Ejercicio 26 del capitulo 2
;
; Tenemos los siguientes x e y
(define x (list 1 2 3))
(define y (list 4 5 6))

; Se pide explicar lo que se interpreta con estas operaciones
(append x y)
; Esto hará '(1 2 3 4 5 6)
; Esto se debe a que el append une listas transformando una nueva lista con todos los elementos de ambos argumentos que se les pasa

(cons x y)
; Esto hará '((1 2 3) 4 5 6)
; Esto se debe a que, como hemos visto, añade el primer argumento a la tupla del segundo argumento.

(list x y)
; Esto hará '((1 2 3) (4 5 6))
; Esto se debe a que, como hemos visto, el list simplemente crea una lista grande con los elementos que se le pasa. En este
; caso, se le pasan 2 listas, por lo que será una lista con 2 listas como elementos.