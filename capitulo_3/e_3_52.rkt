#lang racket

(define sum 0)

;Suma x a la variable global y lo guarda
(define (accum x)
  (set! sum (+ x sum))
  sum)

; Va aplicando accum, para 1 sera 1, para 2 sera 3, para 3 sera 6...
; Es decir hace el sumatorio en un intervalo del 1 al 20 para un stream.
(define seq 
  (stream-map 
   accum 
   (stream-enumerate-interval 1 20))) 

;Filtra por los valores pares de seq
(define y (stream-filter even? seq))

;Filtra por los multiplos de 5 de seq
(define z 
  (stream-filter 
   (lambda (x) 
     (= (remainder x 5) 0)) seq))

(stream-ref y 7) ; Devolvera el 8 valor par de seq que es 136
(display-stream z) ; Devolvera todos los multiplos de 5 de seq, 10 15 45 55 105 120 190 210


; Para obtener (stream-ref y 7) se va calculando uno a uno el siguiente elemento de seq,
; y se va aplicando el filtro. Cuando se encuentra el 8 elemento que pase el filtro se para.
; En este caso sera el elemento 16 de seq por lo que sum se queda en 136 tras la llamada, 
; esas 16 primeras posiciones de seq se guardan en memoria. Despues (display-stream z)
; va aplicando el filtro secuencialmente a los 16 primeros elementos que ya estan en memoria
; cuando llega a el 17 lo calcula y aplica el filtro, y asi hasta el 20. Cuando acaba estan
; operación sum se queda como 210.
; Si se usa la implementacion (lambda () ⟨exp⟩), la primera llamada a (stream-ref y 7) devolveria
; lo mismo, pero cuando se llama a (display-stream z) se vuelve a calcular seq desde el principio
; y como el valor de sum es 136 en vez de 0 el resultado sera erroneo. 




