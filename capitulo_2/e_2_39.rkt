#lang racket

;; Definiciones de fold-right y fold-left (de los ejercicios previos)
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest)) (cdr rest))))
  (iter initial sequence))

;; Ejercicio 2.39 - Definir reverse con fold-right y fold-left

;; Versión con fold-right
;; La idea: recorrer la lista de izquierda a derecha,
;; y para cada x, añadirlo al final de la acumulación.
(define (reverse-r sequence)
  (fold-right (lambda (x y) (append y (list x)))
              '()
              sequence))

;; Versión con fold-left
;; La idea: recorrer de izquierda a derecha,
;; e ir construyendo la lista en orden inverso
;; insertando cada elemento al frente.
(define (reverse-l sequence)
  (fold-left (lambda (x y) (cons y x))
             '()
             sequence))

;; Pruebas
(reverse-r (list 1 2 3 4))
; => '(4 3 2 1)

(reverse-l (list 1 2 3 4))
; => '(4 3 2 1)
