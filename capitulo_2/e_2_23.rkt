#lang racket

;Se aplica la funcion a cada cabeza de la lista recibida, excepto si la lista esta vacia, 
;y se vuelve a llamar con la cola de la lista para la recursion.


(define (for-each funcion lista)
    (unless (null? lista)
        (funcion (car lista))
        (for-each funcion (cdr lista))
    )
)



