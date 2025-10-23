#lang racket

;; Procedimiento fringe:
;; Recorre un árbol (listas anidadas) y devuelve todas sus hojas
;; en orden de izquierda a derecha.

(define (fringe tree)
  (cond
    ;; Caso 1: si el árbol está vacío → lista vacía
    [(null? tree) '()]
    ;; Caso 2: si es un átomo (no es una lista) → lo envolvemos en lista
    [(not (pair? tree)) (list tree)]
    ;; Caso 3: si es una lista → concatenamos fringe de car y fringe de cdr
    [else (append (fringe (car tree))
                  (fringe (cdr tree)))]))

;; Ejemplo de árbol
(define x (list (list 1 2) (list 3 4)))

;; Pruebas
(fringe x)
; => '(1 2 3 4)

(fringe (list x x))
; => '(1 2 3 4 1 2 3 4)
