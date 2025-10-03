#lang racket
Exercise 2.53: What would the interpreter print in response to evaluating each of the following expressions?

(list 'a 'b 'c)
;;Imprimiría una nueva lista compuesta por a b y c
(list (list 'george))
;;Imprimiría una lsta de chars 'george'
(cdr '((x1 x2) (y1 y2)))
;;Imprime la parte final de esta lista, es decir: (y1 y2))
(cadr '((x1 x2) (y1 y2)))
;; equivalente a car(cdr ((x1 x2) (y1 y2))) imprimiria y1 y2
(pair? (car '(a short list)))
;;Imprimira false ya que car devolvera un unico simbolo, no un par
(memq 'red '((red shoes) (blue socks)))
;; Busca exclusivamente 'red' entre la lista de listas pero como no existe unicamente red sino listas me imprime false
(memq 'red '(red shoes blue socks))
;;Me busca en la lista plana 'red' como red esta el primero me imprime red en adelante 'red shoes blue socks