#lang racket

;Exercise 1.31

;QUESTION 1

;The `sum` procedure is only the simplest of a vast number of similar
;abstractions that can be captured as higher-order procedures. Write an analogous
;procedure called `product` that returns the product of the values of a
;function at points over a given range.  Show how to define `factorial` in
;terms of `product`.  Also use `product` to compute approximations to
;`pi` using the formula

;```
;pi   2 * 4 * 4 * 6 * 6 * 8 ...
;-- = -------------------------
; 4   3 * 3 * 5 * 5 * 7 * 7 ...
;```

;ANSWER

;This is the general recursive procedure for a product in a range of numbers
(define (product-rec term a  next b)
  (if (> a b)
      1
      (* (term a) (product-rec term (next a) next b))))

;Factorial can be easily defined using the procedure we have just created
(define (factorial n)
  (product-rec (lambda(x) x) 1 (lambda(x) (+ x 1)) n))

;Now using the product procedure and the formula given for the exercise, we can approximate pi like this
;I did not use the an exp procedure because I was not told to do so but it could be used
(define (pi-aprox n)
  (/ (* 8 (* (product-rec (lambda(x) x) 4 (lambda(x) (+ x 2)) (* 2 n)) (product-rec (lambda(x) x) 4 (lambda(x) (+ x 2)) (* 2 n))))
     (* (product-rec (lambda(x) x) 1 (lambda(x) (+ x 2)) (- (* 2 n) 1)) (product-rec (lambda(x) x) 3 (lambda(x) (+ x 2)) (+ (* 2 n) 1))))) 
        
;QUESTION 2

;If your `product` procedure generates a recursive process, write one that
;generates an iterative process.  If it generates an iterative process, write
;one that generates a recursive process.

;ANSWER

;This is the iterative procedure
(define (product-iter term a next b)
  (define (iter x result)
    (if (> x b)
        result
        (iter (next x) (* (term x) result))))
  (iter a 1))
      