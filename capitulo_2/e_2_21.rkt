#lang racket

(define (square x)
  (* x x))

;; Versión 1: usando recursión con cons
(define (square-list-rec items)
  (if (null? items)
      '()
      (cons (square (car items))
            (square-list-rec (cdr items)))))

;; Versión 2: usando map
(define (square-list-map items)
  (map square items))

;; Ejemplos
(display "Versión recursiva: ")
(display (square-list-rec (list 1 2 3 4)))
(newline)

(display "Versión con map: ")
(display (square-list-map (list 1 2 3 4)))
(newline)
