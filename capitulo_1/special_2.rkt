#lang racket
(define x 5)
(+ (let ((x 3))
        (+ x (* x 10)))
   x)

; (+ (let ((x 3)) (+ x (* x 10))) x)
; We must notice that (define x 5) is global while the argument (let ((x 3)) (+ x (* x 10)))
; redefines the parameter x inside the let. Therefore, x in (let ((x 3)) (+ x (* x 10)))
; is redefined to 3, resulting in the operation (+ 3 ( * 3 10)) = 33.

; Once that has been done, we have (+ 33 x) left, but x isn't 3 anymore because that was defined
; inside the let. Now it adquires the global value 5 which results in (+ 33 5) = 38.