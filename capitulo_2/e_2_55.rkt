#lang racket
(car ''abracadabra)

;'x es un quote, que devuelve el símbolo x tal cual.
;''x significa '('x) porque la segunda comilla hace un quote sobre un quote. Es decir, ''abracadabra es equivalente a (quote (quote abracadabra))
;Entonces la expresión original se convierte en (car '(quote abracadabra)).
;car toma el primer elemento de la lista '(quote abracadabra), que es quote.