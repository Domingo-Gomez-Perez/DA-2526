#lang racket
(define (f g) (g 2)) ;f toma como argumento una función g. Luego aplica g al número 2.

(f square) ;Aquí g = square. Entonces hace (square 2) = 4.

(f (lambda (z) (* z (+ z 1)))) ;Aquí g = (lambda (z) (* z (+ z 1))). Y se evalua (g 2) = (* 2 (+ 2 1)) = (* 2 3) = 6.

(f f) ;En este caso, g = f. Entonces el cuerpo de f intenta evaluar (g 2) = (f 2), pero f espera una funcion como argumento, no un numero.
      ;Por tanto, la evaluación de (f f) provoca un error de tipo en el intérprete, porque se intenta aplicar un número como si fuera una función.