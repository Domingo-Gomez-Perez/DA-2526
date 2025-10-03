#lang racket

(define (oldmul a b)
  (if (= b 0)
      0
      (+ a (oldmul a (- b 1)))))

(define (double x)
  (* x 2)
  )

(define (halve x)
  (/ x 2)
  )

(define (mul a b)
  (cond
    ((= a 0) 0) ; a = 0 ? -> a*b = 0
    ((= b 0) 0) ; b = 0 ? -> a*b = 0
    ((= (remainder b 2) 0) (double (mul a (halve b)))) ; b es par distinto de 0 -> a*b = a * ((2b)/2) = a * 2 * (b/2) = 2 * (a * b/2)
    (else (+ a (mul a (- b 1)))) ; b impar -> a*b = a + (a * (b - 1)), es decir
    ; mantenemos la forma anterior de multiplicar, de forma que en la siguiente iteracion b sera par
    )
  ) ; A lo máximo, en la mitad de las iteraciones, b sera impar;
  ; por lo que si antes se realizaban b iteraciones, ahora
  ; se realizan log(b) iteraciones pares + log(b)/2 iteraciones impares
  ; siendo la complejidad por tanto log(b)
      