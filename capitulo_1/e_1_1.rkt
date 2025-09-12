#lang racket
10 ; sale 10, es un objeto primitivo

(+ 5 3 4) ; Se evalúa la función suma con 3 argumentos y se aplica la suma a todos a la vez 5+3+4 = 12

(- 9 1) ; Se evalúa la función de resta con dos argumentos 9-1 = 8

(/ 6 2) ; Se evalúa la función de división 6/2 = 3

(+ (* 2 4) (- 4 6)) ; Se evalúa la función de suma con dos argumentos. El primer argumento es una multiplicación 2*4 = 8, el segundo argumento 4-6 = -2, 8 + (-2) = 6

(define a 3) ; Se asigna a "a" el valor 3

(define b (+ a 1)); Se asigna a "b" el valor de la suma de a + 1 = 4

(+ a b (* a b)) ; Se evalúa una suma con 3 argumentos, a, b y a*b = 12. Por tanto, sale 3+4+12 = 19 

(= a b) ; Se evalúa si a y b son iguales, Sale #f (false) porque 3 y 4 no son lo mismo

(if (and (> b a) (< b (* a b)))
    b
    a) ; Se evalúa la función and con dos argumentos, el primer argumento es si b es mayor a a (true). El segundo argumento es si b es menor que la multiplicación de a y b = 12, 4<12 (true)
; Por lo tanto, el and de los argumentos (true, true) es true. Y con el operador ternario, aparece b en el if, ya que es true la condición. Sale b = 4.
    
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25)) ; A no es igual a 4 por lo que no aparece 6, b si que es igual a 4 luego sale por pantalla la suma de 6+7+a = 16
      
(+ 2 (if (> b a) b a)) ; Se hace la suma de dos argumentos, 2 y el resultado de un if. B es mayor que a por lo que el resultado del if será b = 4 y la suma será 2+4 = 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1)) ; Se hace la multiplicación de dos argumentos, el primero dado por un condicional y el segundo por una suma. El condicional, dado que a no es mayor que b no resulta en a. Dado
; que a es menor que b, resulta en b = 4 (primer argumento). El segundo argumento es la suma de a + 1 = 4. Luego la multiplicación es 4*4 = 16 que sale por pantalla