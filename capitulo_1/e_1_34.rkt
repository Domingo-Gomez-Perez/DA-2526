#lang racket

(define (f g) (g 2))

(define (square x) (* x x))
(f square) ; -> 4
(f (lambda (z) (* z (+ z 1)))) ; -> 6

(f f)

; 1. Cuando llamamos a (f f), el procedimiento f es pasado como argumento g 
;    en la primera instancia de f.

;    Por lo tanto, la expresión (f f) se convierte en:

;    (f 2)

; 2. Ahora evaluamos (f 2), pero f espera un procedimiento como argumento,
;    y aqui le estamos pasando el numero 2.

;    (f 2) -> (2 2)

;    El problema es que al evaluar (2 2) el interprete lanzara un error al intentar
;    aplicar el numero 2 como si fuera una funcion.

;    application: not a procedure;
;    expected a procedure that can be applied to arguments
;    given: 2
