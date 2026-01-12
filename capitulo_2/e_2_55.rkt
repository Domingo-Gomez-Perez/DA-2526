#lang racket

(car ''abracadabra)
; it is because a list is detailed by ' 
; and a single string is a ' so a double '' list with a string inside
; giving the first element of the quote type denominator and the rest the contents of it
;like when we create function with a first element and then the rest ex.( a . z).

(cdr ''abracadabra)
; it gives the contents of the quote

; Record exercise
(define (assoc key record)
  (cond ((null? record) #f)
        ((eq? key (car (car record))) (car record)) 
        (else (assoc key (cdr record)))))
        
(define (add-entry key value record)
  (cons (list key value) record )) ; Adds the new entry at the beginning of the record

(define (del-entry key record)
    (cond ((null? record) '()) 
            ((eq? key (car (car record))) (cdr record)) 
            (else (cons (car record) (del-entry key (cdr record)))))) 


(define record '((x 1) (y 2) (z 3)))

(assoc 'y record)      ; -> (y 2)

(add-entry 'w 4 record)  ; -> ((x 1) (y 2) (z 3) (w 4))
(add-entry 'x 10 record) ; -> ((x 10) (y 2) (z 3))

(del-entry 'x record)   ; -> ((y 2) (z 3))