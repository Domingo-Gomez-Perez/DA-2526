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

(define (append seq1 seq2)
  (fold-right cons seq2 seq1))

(define (reverse-right sequence)
  (fold-right 
   (lambda (x y) (append y (list x))) null sequence))

(define (reverse-left sequence)
  (fold-left 
   (lambda (x y) (cons y x)) null sequence))

; (reverse-right (list 1 2 3))
; (append 1 (append (list 2 3))
; (append 1 (append 2 (append (list 3)))
; (append 1 (append 2 (append 3 ()')))
; (append 1 (append 2 '(3))
; (append 1 '(3 2))
; '(3 2 1)

; (reverse-left (list 1 2 3))
; (cons 1 (cons (list 2 3))
; (cons 1 (cons 2 (cons (list 3)))
; (cons 1 (cons 2 (cons 3 ()')))
; (cons 1 (cons 2 '(3))
; (cons 1 '(2 3))
; '(1 2 3)

(reverse-right (list 1 2 3))
(reverse-left (list 1 2 3))