#lang racket

(define (fringe tree)
  (cond
    ((null? tree) '())                      ;arbol vacio              
    ((not (pair? tree)) (list tree))        ;Si son dos valores, devuelve esos dos valores    
    (else (append (fringe (car tree))           
                  (fringe (cdr tree))))))       

(define x 
  (list (list 1 2) (list 3 4)))

(displayln (fringe x))          ; devuelve (1 2 3 4)
(displayln (fringe (list x x))) ; devuelve (1 2 3 4 1 2 3 4)
(displayln (fringe '()))        ;devuelve lista vacía
(displayln (fringe (list 1 2))) ;devuelve la lista