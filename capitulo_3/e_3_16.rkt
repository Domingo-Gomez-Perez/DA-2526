#lang racket

(define (count-pairs x)
  (if (not (mpair? x))
      0
      (+ (count-pairs (mcar x))
         (count-pairs (mcdr x))
         1)))


(define p1 (mcons 1 (mcons 2 (mcons 3 4)))) ; tres pares lineales
(count-pairs p1) ; should print 3

; 2) Estructura con 3 pares pero devuelve 4 (compartición que cuenta C dos veces)
; Construcción:
; C es alcanzable desde A en dos rutas diferentes -> se cuenta dos veces
(define C (mcons 3 4))
(define B (mcons C 5))
(define p2 (mcons B C)) ; A = p2
(count-pairs p2); should print 4

; 3) Estructura con 3 pares pero devuelve 7 (compartición multiplicada)
; Construcción:
; Recursión cuenta: count(A)=1 + count(B) + count(B)
; count(B)=1 + count(C) + count(C) = 3  => count(A)=1+3+3=7
(define C2 (mcons 3 5))
(define B2 (mcons C2 C2))
(define p3 (mcons B2 B2))
(count-pairs p3) ; should print 7

; 4) Estructura con 3 pares que provoca recursión infinita (no retorna)
; Creamos un ciclo A -> B -> C -> A usando set-mcdr! (tres mpairs)
; Diagrama (mcdr links): A --cdr--> B --cdr--> C --cdr--> A
; Si llamamos (count-pairs A) la función nunca termina porque sigue
; recorriendo el ciclo indefinidamente.
; nombres con sufijo 'cy' para evitar colisiones con anteriores
(define Acy (mcons 'a 1))
(define Bcy (mcons 'b 2))
(define Ccy (mcons 'c 3))
(set-mcdr! Acy Bcy)
(set-mcdr! Bcy Ccy)
(set-mcdr! Ccy Acy)

; (displayln (count-pairs Acy)) ; esto no terminaría

; Resumen: p1, p2, p3 son tres pares distintos cada uno; p4 (A/B/C) forma un ciclo.