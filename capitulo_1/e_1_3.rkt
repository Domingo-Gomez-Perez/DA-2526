#lang racket
(define (suma_de_cuadrados_de_los_2_mas_grandes a b c)
 (define (cuadrado x) (* x x)) ;Definimos la operación cuadrado
 (define (suma_cuadrados x y) (+ (cuadrado x) (cuadrado y))) ;Definimos la operación suma de cuadrados.
 (cond ((and (<= a b) (<= a c)) (suma_cuadrados b c)) ;Si a es el menor, tomamos b y c
       ((and (<= b a) (<= b c)) (suma_cuadrados a c)) ;Si b es el menor, tomamos a y c
       (else (suma_cuadrados a b)))) ;Sino, tomamos a y b

;Algunos ejemplos para comprobar el funcionamiento.
(suma_de_cuadrados_de_los_2_mas_grandes 1 2 3) ; 3^2 + 2^2 = 13
(suma_de_cuadrados_de_los_2_mas_grandes 4 5 6) ; 5^2 + 6^2 = 61
(suma_de_cuadrados_de_los_2_mas_grandes 9 3 1) ; 9^2 + 3^2 = 90