#lang racket

; Bob's box
(define (bob-make-box x y w h)
    (attach-tag 'bob-box
         (cons (cons x y) (cons w h))))

; type-check procedure
(define (bob-box? b) (eq? (type-tag b) 'bob-box))

; Other methods (note: must extract the contents from the tagged value)
(define (bob-width b) (car (cdr (contents b))))
(define (bob-height b) (cdr (cdr (contents b))))

(define (bob-area box)
    (* (bob-width box) (bob-height box)))

; Alice's box
(define (alice-make-box x1 y1 x2 y2)
  (attach-tag 'alice-box
          (cons (cons x1 y1) (cons x2 y2))))

; type-check procedure
(define (alice-box? b) (eq? (type-tag b) 'alice-box))

(define (alice-width a)
   (abs (- (car (cdr (contents a)))
           (car (car (contents a))))))

(define (alice-height a)
   (abs (- (cdr (cdr (contents a)))
           (cdr (car (contents a))))))

(define (alice-area box)
    (* (alice-width box) (alice-height box)))

(define (attach-tag tag contents) (cons tag contents))
(define (type-tag datum) (car datum))
(define (contents datum) (cdr datum))

; Generic procedure
(define (width b)
    (cond ((bob-box? b) (bob-width b))
          ((alice-box? b) (alice-width b)))
    )

; The code works properly, there was only a typo in the exercise which would
; mix the outputs of the width procedure for a and b.
