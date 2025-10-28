#lang racket
; (p x) transforma el elemento.
; cons lo pone en la nueva lista acumulada (y).
; El resultado queda como una lista con (p elem1) (p elem2)
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
              nil
              sequence))

; cons va construyendo la lista desde los elementos de seq1, acumulándolos sobre seq2.
; Es igual a cómo append concatena.
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

; Calcula la cantidad de elementos de la lista
; Ignoramos x (el valor real), solo sumamos 1 por cada elemento.
; Acumulamos sobre 0.
(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
