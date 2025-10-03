#lang racket

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;El procedimiento suma "a" mas el valor absoluto de "b". En el if se ve si b es positivo 
;o negativo para elegir si se va a sumar o restar. El procedimiento tiene las siguientes partes:

;1.Se llama a el procedimiento
(a-plus-abs-b 4 -7) 

;2.Se sustituyen los valores por los argumentos
((if (> -7 0) + -) 4 -7)

;3.Se realiza el valor booleano
((if #f + -) 4 -7)

;4.Se elige la operacion
(- 4 -7)

;5. Se da el resultado
11

