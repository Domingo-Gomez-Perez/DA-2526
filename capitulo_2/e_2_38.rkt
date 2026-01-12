#lang racket

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op 
                      initial 
                      (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3))
(fold-left  / 1 (list 1 2 3))
(fold-right list null (list 1 2 3))
(fold-left  list null (list 1 2 3))

; Comprobamos mediante la sustitucion como se comporta en cada caso cada uno

; (fold-right / 1 (list 1 2 3))
; (/ 1 (fold-right / 1 (list 2 3)))
; (/ 1 (/ 2 (fold-right / 1 (list 3))))
; (/ 1 (/ 2 (/ 3 (fold-right / 1 '()))))
; (/ 1 (/ 2 (/ 3 1)))
; (/ 1 (/ 2 3))
; (/ 1 2/3)
; 3/2

; (fold-left  / 1 (list 1 2 3))
; (iter 1 (list 1 2 3))
; (iter (/ 1 1) (list 2 3))
; (iter 1 (list 2 3))
; (iter (/ 1 2) (list 3))
; (iter 1/2 (list 3))
; (iter (/ 1/2 3) '())
; 1/6

; La propiedad que op debe cumplir para que produzcan el mismo valor para cualquier
; secuencia es que el orden de los factores no altere el resultado.
; (/ 1 (/ 2 3)) != (/ (/ 1 2) 3)
; (/ 1 2/3) != (/ 1/2 3)
; 3/2 != 1/6
; Por ejemplo para la suma y la multiplicacion se cumple.
; (+ 1 (+ 2 3)) = (+ (+ 1 2) 3)
; (+ 1 5) = (+ 3 3)
; 6 = 6
; (* 1 (* 2 3)) = (* (* 1 2) 3)
; (* 1 6) = (* 2 3)
; 6 = 6
(fold-right + 1 (list 1 2 3))
(fold-left  + 1 (list 1 2 3))
(fold-right * 3 (list 1 2 3))
(fold-left  * 3 (list 1 2 3))

