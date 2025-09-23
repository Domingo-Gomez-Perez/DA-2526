#lang racket
;; Parte 1
;; accumulate recursivo
(define (accumulate combiner null-value term a next b)
  (if (> a b)
  ;; Caso base: si ya pasamos del límite (a > b), 
  ;; devolvemos el valor neutro (0 para sum, 1 para product).
      null-value
      ;; Paso recursivo: combinamos el término actual (term a)
      ;; con la acumulación de los siguientes valores.
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

;; sum con accumulate
(define (sum term a next b)
  ;; usamos + como combinador y 0 como valor neutro
  (accumulate + 0 term a next b))

;; product con accumulate
(define (product term a next b)
  ;; usamos * como combinador y 1 como valor neutro
  (accumulate * 1 term a next b))


;; Ejemplo para suma de enteros de 1 a 5
(sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)  ; => 15

;; Ejemplo para producto de enteros de 1 a 5
(product (lambda (x) x) 1 (lambda (x) (+ x 1)) 5) ; => 120

;; Parte 2
;; accumulate iterativo
(define (accumulate-iter combiner null-value term a next b)
  ;; definimos una función auxiliar con acumulador
  (define (iter x result)
    ;; Si ya pasamos del límite devolvemos el acumulador final
    (if (> x b)
        result
        ;; Si no, actualizamos el acumulador con el término actual
        ;; y avanzamos al siguiente valor (next x)
        (iter (next x) (combiner result (term x)))))
  (iter a null-value))


(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))

(sum-iter (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)
;; Mismo ejemplo que para el recursivo => 15

(product-iter (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)
;; Mismo ejemplo que para el recursivo => 120
