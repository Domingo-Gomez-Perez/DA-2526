#lang racket

(define (fact n) (if (= n 0) 1 (* n (fact (- n 1)))))

(fact 5)


; Basicamente la funcion lambda se tiene como argumento a si misma para poder hacer la recursion.
(((lambda (factorial)
    (lambda (n)
      (if (< n 1) 1 (* n ((factorial factorial) (- n 1))))))
  (lambda (factorial)
    (lambda (n)
      (if (< n 1) 1 (* n ((factorial factorial) (- n 1)))))))
 -5)

