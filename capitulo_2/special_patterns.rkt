#lang racket

(define record '(job (Hacker Alyssa P) (computer programmer)))

(define (match pattern data)
  (if (and (null? pattern) (null? data))
      #t ;Se ha llegado al final de ambas listas
      (if (or (null? pattern) (null? data)) ;Se ha llegado al final de solo una lista
          #f ;Entonces no coinciden en formato
          (if (and (list? (car pattern)) (list? (car data)))
              ;Listas ambas, hay que hacer recursion de su primer elemento y del resto de la lista
              (and (match (car pattern) (car data)) (match (cdr pattern) (cdr data)))
              ;Si era el simbolo '? en pattern se descarta lo que se esta leyendo
              (if (symbol=? (car pattern) '?)
                  (match (cdr pattern) (cdr data)) ; Se continua
                  (if (equal? (car pattern) (car data)) ;Si son el mismo simbolo
                      (match (cdr pattern) (cdr data)) ;Se continua
                      #f ;Si no eran el mismo simbolo no son iguales el pattern y data
                      )
                  )
              )
          )
      )
  )

(match '(job ? ?) record)           ; --> true
(match '(job ? (? coder)) record)   ; --> false
(match '(? ? (computer ?)) record)  ; --> true