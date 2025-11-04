#lang racket

(define (my-equal? a b)
  (cond 

    ((and (pair? a) (pair? b)); if both are pairs    
     (and (my-equal? (car a) (car b)) 
          (my-equal? (cdr a) (cdr b))))
    
    ((and (symbol? a) (symbol? b)); if both are symbols
     (eq? a b))
    ((and (number? a) (number? b)); if both are numbers
     (= a b))
    ((and (null? a) (null? b)); if both are the empty list
     #t)
    (else 
     #f)))

(my-equal? '(1 2 3) '(1 2 3))         ; #t
(my-equal? '(1 2 (a 3)) '(1 2 (a 3))) ; #t
(my-equal? '(1 2 3) '(1 2 4))         ; #f
(my-equal? '(a 1) '(a 1.0))           ; #t (since (= 1 1.0) is true)
(my-equal? 'a 'a)                     ; #t