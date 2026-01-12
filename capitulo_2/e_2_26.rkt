#lang racket

;Ejercicio 2.26

(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y)
'(1 2 3 4 5 6) ; Une las dos listas en una sola
(cons x y)
'((1 2 3) 4 5 6) ; Agrega la lista x como el primer elemento de la lista y
(list x y)
'((1 2 3) (4 5 6)) ; Crea una nueva lista con x e y como elementos  