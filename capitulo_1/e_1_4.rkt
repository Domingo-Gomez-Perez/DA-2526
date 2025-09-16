#lang racket
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

#|Esto lo que hace es que si b es mayor que 0, te devuelve
una suma y si es menor una resta, y luego realiza a + b o
 a - b según dicho resultado.

PARA EL CASO a = 3 y b = 2 el resultado debería ser 5.|#

(if (> 3 0) + -); + tras comparar que 3 es mayor que 0.

(+ 2 3); 5 tras realizar la operación suma después de que esta sea determinada en el paso anterior.

(a-plus-abs-b 2 3); 5 al realizar la función comprobándose de esta manera que da el mismo resultado que paso a paso.