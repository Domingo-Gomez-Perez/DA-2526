#lang racket

(define (attach-tag tag contents) (cons tag contents))
(define (type-tag datum) (car datum))
(define (contents datum) (cdr datum))

(define registry (make-hash))

(define (register name tag proc)
   (hash-set! registry (list name tag) proc))

(define (lookup name tag)
   (hash-ref registry (list name tag)))

; Generic procedures
(define (width box)
    ((lookup 'width (type-tag box)) box))

(define (height box)
    ((lookup 'height (type-tag box)) box))

(define (area box)
    (* (width box) (height box)))


; Bob's box namespace
(define (import-bob-box)
  (define (make-box x y w h)
    (attach-tag 'bob-box (cons (cons x y) (cons w h))))
  (define (box? b)
    (eq? (type-tag b) 'bob-box))
  (define (width box)
    (car (cdr (contents box))))
  (define (height box)
    (cdr (cdr (contents box))))
  (register 'width 'bob-box width)
  (register 'height 'bob-box height)
  (set! bob-make-box make-box)
  (set! bob-box? box?))


; Alice's box namespace
(define (import-alice-box)
  (define (make-box x1 y1 x2 y2)
    (attach-tag 'alice-box (cons (cons x1 y1) (cons x2 y2))))
  (define (box? b)
    (eq? (type-tag b) 'alice-box))
  (define (width box)
    (abs (- (car (cdr (contents box))) (car (car (contents box))))))
  (define (height box)
    (abs (- (cdr (cdr (contents box)))
            (cdr (car (contents box))))))
  (register 'width 'alice-box width)
  (register 'height 'alice-box height)
  (set! alice-make-box make-box)
  (set! alice-box? box?))


; Explicit imports (in code that wants to use them)
(define bob-make-box #f)
(define bob-box? #f)
(define alice-make-box #f)
(define alice-box? #f)

(import-bob-box)
(import-alice-box)


;Examples
(define a (alice-make-box 1 2 3 4))
(define b (bob-make-box 1 2 3 4))
a ;'(alice-box (1 . 2) 3 . 4)
b ;'(bob-box (1 . 2) 3 . 4)
(width a) ;2
(width b) ;3
(height a) ;2
(height b) ;4
(area a) ;4
(area b) ;12
