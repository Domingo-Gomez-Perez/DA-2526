#lang racket
; Ejercicio 27 del capitulo 2
;
; Se pide implementar un algoritmo que devuelva una lista inversa a la dada por argumento (ej 18). Pero, que si algún elemento de la
; lista es una lista, se invierta también el contenido de esa lista

(define (deep-reverse list)
  (deep-reverse-aux list null))

; En esta función auxiliar rellenamos la nueva lista
(define (deep-reverse-aux list new-list)
  (if (null? list)
      new-list
      (deep-reverse-aux (cdr list)
                        (if (list? (car list)) ; Si es una lista el elemento, debo invertirla
                            (cons (deep-reverse-aux (car list) null) new-list) ; invierto la lista de dentro de la lista. Paso null porque cuando se invoque esto la nueva lista invertida empieza vacía.
                            (cons (car list) new-list))))) ; No es una lista, sigo con el reverse normal
                        


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
  (list (list 1 2) (list 3 (list 5 6 7) 4)))
x
(reverse x)
(deep-reverse x)
