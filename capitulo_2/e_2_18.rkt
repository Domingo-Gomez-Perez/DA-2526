#lang racket
; Defino una función principal que llama a la función auxiliar con la lista (reverse) vacía inicialmente
(define (reverse list)
  (reverse-aux list null))

; En esta función auxiliar rellenamos la nueva lista
(define (reverse-aux list new-list)
  (if (null? list)
      new-list
      (reverse-aux (cdr list) (cons (car list) new-list))))