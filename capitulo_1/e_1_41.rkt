#lang racket
(define (double f)                   ; defining a function f that returns a function g that applies f two times
  (lambda (x) (f (f x))))

(define inc (lambda (x) (+ x 1)))    ; defining function inc that increas a number by 1

(define D (double double))           ; D applies double 2 times 
(define DD (double D))               ; DD applies D 2 times
((DD inc) 5)                         ; Function applied inc 16 times, the result is 21

(((double (double double)) inc) 5)   ; Compact version of the process above