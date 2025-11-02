#lang racket

; cons es comun a ambas versiones
(define (cons a b)
  ((lambda (x y) (* (expt 2 x) (expt 3 y))) a b))

; Version recursiva
(define (car-rec c)
  (if (= (remainder c 2) 0)
      (+ (car-rec (/ c 2) 1))
      0)
  )

(define (cdr-rec c)
  (if (= (remainder c 3) 0)
      (+ (car-rec (/ c 3) 1))
      0)
  )

; Version iterativa
(define (car-iter c)
  (car-alt c 0))

(define (car-alt c res)
  (if (= (remainder c 2) 0)
      (car-alt (/ c 2) (+ res 1))
      res)
  )

(define (cdr-iter c)
  (cdr-alt c 0))

(define (cdr-alt c res)
  (if (= (remainder c 3) 0)
      (cdr-alt (/ c 3) (+ res 1))
      res)
  )
