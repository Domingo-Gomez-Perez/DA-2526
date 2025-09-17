#lang racket
;recursion lineal
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;recursion iterativa
(define (sumiter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))


(sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)
;Realizo el calculo primero con la recursion lineal para comprobar posteriormente que da el mismo resultado la iterativa.
(sumiter (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)
;Aqui hago la suma de enteros del 1 al 5
;Utilizo Lambda (x) ya que así me ahorro el tener que definir directamente la funcion.
;Basicamente, lambda (x) x no realiza nada, es la funcion identidad, solo guarda el valor de "a".
;1 seria el valor inicial, se corresponde con la entrada "a".
;(lambda (x) (+ x 1)) significa que toma un numero x y le suma uno.
;Finalmente 5 seria el limite de la suma, se detiene cuando "a" pasa de 5.



