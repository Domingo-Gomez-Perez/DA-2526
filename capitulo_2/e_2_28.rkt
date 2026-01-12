#lang racket

(define (fringe tree)
  (cond
    ((null? tree) '())                      ;arbol vacio              
    ((not (pair? tree)) (list tree))        ;Si son dos valores, devuelve esos dos valores    
    (else (append (fringe (car tree))           
                  (fringe (cdr tree))))))       

(define x 
  (list (list 1 2) (list 3 4)))

(define y 
  (list (list (list 1 2 3) 4) (list 5 (list 6 7))))

(displayln (fringe x))          ; devuelve (1 2 3 4)
(displayln (fringe (list x x))) ; devuelve (1 2 3 4 1 2 3 4)
(displayln (fringe y))          ; devuelve (1 2 3 4 5 6 7)
(displayln (fringe (list x y))) ; devuelve (1 2 3 4 1 2 3 4 5 6 7)
(displayln (fringe '()))        ;devuelve lista vacía
(displayln (fringe (list 1 2))) ;devuelve la lista