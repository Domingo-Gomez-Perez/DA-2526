#lang racket

(eq? 'a 'a) ;#t
(eq? 'a 'b) ;#f

(define (equal? a b)
  (if (and (null? a) (null? b))
      #t
      (if (and (symbol? a) (symbol? b))
          (if (eq? a b) #t #f)
          (if (and (number? a) (number? b))  ;Funciona con números
              (if (= a b) #t #f)
              (if (and (list? a) (list? b))
                  (if (and
                       (equal? (car a) (car b))
                       (equal? (cdr a) (cdr b)))
                      #t
                      #f
                      )
                  #f
                  )
              )
          )
      )
  )

;Pruebas
(equal? '(this is a list) '(this is a list))   ;#t
(equal? '(this is a list) '(this (is a) list)) ;#f
(equal? 1 1)                                   ;#t
(equal? 1 (- 2 1))                             ;#t
(equal? 1 5)                                   ;#f
(equal? 1 (- 1 2))                             ;#f
(equal? (list 1 4 9 16 25) (list 1 4 9 16 25)) ;#t
(equal? (list 1 4 9 16 25) (list 9 16 25))     ;#f
(equal? (list 1 4 9 16 25) (list 1 4 9 25 16)) ;#f
(equal? 'a 'b)                                 ;#f
(equal? 'b 'b)                                 ;#t

