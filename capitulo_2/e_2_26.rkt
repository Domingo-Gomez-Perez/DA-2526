#lang racket
(define x (list 1 2 3))
(define y (list 4 5 6))
; What result is printed by the interpreter in response to evaluating each of the following expressions:

(append x y)
; te retorna la lista conjunta de x e y, es decir une las listas en una : (1 2 3 4 5 6)

(cons x y)
; en este caso, utiliza x como un único elemento de la lista final que define y lo coloca al principio de la misma,
; es decir, la lista final queda así: (x 4 5 6) -> ((1 2 3) 4 5 6) siendo (1 2 3) un único elemento de la lista

(list x y)
; esta función constituye una lista de los elementos x e y tal que: (x y), dado este ejemplo la lista quedaría tal que
; ((1 2 3) (4 5 6)) con tan solo 2 elementos en ella (2 listas en este caso)