#lang racket

;; Ejercicio 2.38
;; ==============================================================================================================================================
;
;; fold-left 
;; Es función de orden superior que recibe otra función op con un valor inicial initial, y una lista sequence.
;;Su tarea es recorrer la lista de izquierda a derecha e ir acumulando los resultados aplicando op.
(define (fold-left op initial sequence)
  (define (iter result rest)
    ;;result es el acumulador (donde guardamos el resultado parcial).
    ;;rest es la parte de la lista que queda por procesar.
    (if (null? rest) ;; nuestro caso base
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


;; fold-right
;; 
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))


(fold-left / 1 (list 1 2 3))    ; → 1/6
(fold-right / 1 (list 1 2 3))   ; → 3/2

(fold-left + 0 (list 1 2 3))    ; → 6
(fold-right + 0 (list 1 2 3))   ; → 6



; fold-right builds like this:
(+ 1 (+ 2 (+ 3 0)))

; fold-left builds like this:
(+ (+ (+ 0 1) 2) 3)
