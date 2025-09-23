#lang racket
;1. The `sum` procedure is only the simplest of a vast number of similar
;abstractions that can be captured as higher-order procedures. Write an analogous
;procedure called `product` that returns the product of the values of a
;function at points over a given range.  Show how to define `factorial` in
;terms of `product`.  Also use `product` to compute approximations to
;`pi` using the formula

;```
;pi   2 * 4 * 4 * 6 * 6 * 8 ...
;-- = -------------------------
; 4   3 * 3 * 5 * 5 * 7 * 7 ...
;```

;Procedimiento RECURSIVO de multiplicación en un rango de valores
(define (product-range-rec a b)
  (if (> a b)
      1
      (* a (product-range-rec (+ a 1) b))))

;Voy a definir un procedimiento que permita hacer productorios con saltos de más de uno en cada multiplicación
;Este es el que utilizaré para el ejercicio de aproximar pi.
(define (product-range-step a b step)
  (if (> a b)
      1
      (* a (product-range-step (+ a step) b step))))

;El procedimento de factorial se puede definir fácilmente de esta forma
(define (factorial n)
  (product-range-rec 1 n))

;Procedimiento para la aproximación de pi siguiendo la fórmula
(define (pi-aprox n)
  (/ (* 8 (* (product-range-step 4 (* 2 n) 2) (product-range-step 4 (* 2 n) 2)))
     (* (product-range-step 1 (- (* 2 n) 1) 2) (product-range-step 3 (+ (* 2 n) 1) 2)))) 
        

;2. If your `product` procedure generates a recursive process, write one that
;generates an iterative process.  If it generates an iterative process, write
;one that generates a recursive process.

;Procedimiento ITERATIVO de multiplicación en un rango de valores
;Añado el argumento result encapsulado en iter para acumular los resultados de las
;multiplicaciones. Ese argumento debe empezar a 1 y lo encapsulo para no tener que
;añadir el argumento result a la llamada del producto.
(define (product-range-iter a b)
  (define (iter x result)
    (if (> x b)
        result
        (iter (+ x 1) (* x result))))
  (iter a 1))
      