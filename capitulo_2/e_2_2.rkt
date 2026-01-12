#lang racket
;; Constructor y selectores de los puntos
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))


;; Constructor y selectores de los segmentos
(define (make-segment start end)
  (cons start end))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))


;; Punto medio de un segmento
(define (midpoint-segment s)
  (let ((start (start-segment s))
        (end (end-segment s)))
    (make-point
     (/ (+ (x-point start) (x-point end)) 2)
     (/ (+ (y-point start) (y-point end)) 2))))


;; Imprimir punto
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;Ejemplo 1
(define p1 (make-point 0 0))
(define p2 (make-point 4 4))
(define s1 (make-segment p1 p2))

;Ejemplo 2
(define p3 (make-point 2 5))
(define p4 (make-point 8 5))
(define s2 (make-segment p3 p4))

;Ejemplo 3
(define p5 (make-point 3 1))
(define p6 (make-point 3 9))
(define s3 (make-segment p5 p6))

(print-point (midpoint-segment s1))
(print-point (midpoint-segment s2))
(print-point (midpoint-segment s3))

