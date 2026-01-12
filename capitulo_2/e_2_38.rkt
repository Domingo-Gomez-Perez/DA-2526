#lang racket
(define (map p sequence)
  (fold-right (lambda (x y) (cons (p x) y))
              null sequence))

(define (append seq1 seq2)
  (fold-right cons seq2 seq1))

(define (length sequence)
  (fold-right (lambda (x y) (if (null? y) 0 (+ y 1))) 0 sequence))

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

(fold-right / 1 (list 1 2 3))        ;1/2
(fold-left  / 1 (list 1 2 3))        ;1/6
(fold-right list null (list 1 2 3))  ;'(1 (2 (3 ())))
(fold-left  list null (list 1 2 3))  ;'(((() 1) 2) 3)

; fold-left and fold-right will return the same values for the same input sequences
; only if op is a commutative operation in the set we are working on. For example,
; the multiplication would be a commutative operation in the set of natural numbers,
; but it might not be if we are working with matrixes or vectors. For the list of
; naturals '(1 2 3) the addition and the multiplication fulfill this property:

(fold-right + 1 (list 1 2 3))        ;V
(fold-left  + 1 (list 1 2 3))        
(fold-right * 1 (list 1 2 3))        ;V
(fold-left  * 1 (list 1 2 3))        
(fold-right - 1 (list 1 2 3))        ;F
(fold-left  - 1 (list 1 2 3))        