#lang racket

; Tanto sum como product siguen el mismo patrón:
; Un rango definido por a, next, y b.
; Una función term que transforma cada valor.
; Una operación de combinación: + en el caso de sum, * en el caso de product.
; Un valor nulo (identidad): 0 para la suma, 1 para el producto.
; Por eso podemos definir una función más general: accumulate.

; Version recursiva
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

; Version iterativa
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 5) ; -> 15  (1 + 2 + 3 + 4 + 5)

(product (lambda (x) x) 1 (lambda (x) (+ x 1)) 5) ; -> 120 (5!)

