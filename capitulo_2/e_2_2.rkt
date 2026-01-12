#lang racket

; Constructor punto
(define (make-point x y)
  (cons x y))
; Selectores punto
(define (x-point p) (car p))
(define (y-point p) (cdr p))

; Constructor segmento
(define (make-segment p1 p2)
  (cons p1 p2))
; Selectores segmento
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))

; Calcular el punto medio de un segmento
(define (midpoint-segment s)
  (let* ((p-ini (start-segment s))
         (p-end (end-segment s)))
    (cons (/ (+ (x-point p-ini) (x-point p-end)) 2)
          (/ (+ (y-point p-ini) (y-point p-end)) 2))))


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


(define p1 (make-point 4 3))
(define p2 (make-point 7 16))
(define s (make-segment p1 p2))
(print-point p1)
(print-point p2)
(print-point (midpoint-segment s))

