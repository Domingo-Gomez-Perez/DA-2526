#lang racket


(define (square number)
    (* number number))
 
(define (square-list1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '() ))

; En el cons se enlaza el cuadrado actual en la cabeza y la respuesta que se lleva en la cola. 
; Por eso se invierte el orden.


(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items '()))

;No funciona pues cons se llama con la cabeza como primer argumento y la cola como segundo.
;Por eso esta manera te forma la lista con un formato incorrecto
;El resultado de (square-list2 '(1 2 3 4)) sera
; '((((() . 1) . 4) . 9) . 16)
