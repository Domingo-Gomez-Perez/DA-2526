#lang racket

(define (f x) 
   (let ((a (+ x 10))
         (b (* a 5)))
         (+ a b))
)
(f 2)      ; Fails.  Why?

; El problema viene en la forma en que let funciona en Scheme:
; Al usar let todas las variables son ligadas simultaneamente. Esto significa que, al evaluar las expresiones iniciales, ninguna de
; las variables definidas dentro del let esta disponible aun.
; Por lo tanto:
; a se evalua bien como (+ x 10)
; al intentar calcular b (* a 5) , la a de dentro todavia no existe

(define x 5)
(+ (let ((x 3))
        (+ x (* x 10)))
   x) 

; 1. Se define x = 5 en el entorno global
; 2. Dentro del let, x se liga a 3
; (+ x (* x 10))
; (+ 3 (* 3 10))
; (+ 3 30)
; 33
; 3. Ahora tenemos lo siguiente:
; (+ 33 x)
; 4. Aqui la x es global, por lo que vale 5
; (+ 33 5)
; 38
