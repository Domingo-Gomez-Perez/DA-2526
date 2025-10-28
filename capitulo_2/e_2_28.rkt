#lang racket
; Ejercicio 28 del capítulo 2
;
; Se pide crear una función fringe que cree una lista con todos los elementos de las listas que se le pase por parámetro en orden de izquierda a derecha
; FUNCIÓN FRINGE MALA, (PEOR QUE LA OTRA). Sigue la idea del deep reverse del ejercicio 27
(define (fringe2 list)
  (reverse (fringe-aux list null)))

(define (fringe-aux list new-list)
  (if (null? list)
      new-list
      (if (list? (car list))
          (fringe-aux (cdr list) (fringe-aux (car list) new-list))
          (fringe-aux (cdr list) (cons (car list) new-list)))))

; FUNCIÓN FRINGE MEJORADA (SIMPLIFICADA)
(define (fringe list)
  (cond
    ((null? list) null)
    ((list? (car list))
     (append (fringe (car list)) (fringe (cdr list))))
    (else
     (cons (car list) (fringe (cdr list))))))

; FUNCIÓN REVERSE DEL EJERCICIO 18
; Defino una función principal que llama a la función auxiliar con la lista (reverse) vacía inicialmente
(define (reverse list)
  (reverse-aux list null))

; En esta función auxiliar rellenamos la nueva lista
(define (reverse-aux list new-list)
  (if (null? list)
      new-list
      (reverse-aux (cdr list) (cons (car list) new-list))))
 
; PRUEBAS    
(define x 
  (list (list 1 2) (list 3 4)))

(fringe x)
;(1 2 3 4)

(fringe (list x x))
;(1 2 3 4 1 2 3 4)