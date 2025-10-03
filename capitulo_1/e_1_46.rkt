#lang racket

; First, we define some auxiliar procedures (used for the sqrt procedure)

(define (square x) (* x x))

(define (sqrt-good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (average x y) 
  (/ (+ x y) 2))



; Definition of the main method
(define (iterative-improve good-enough? improve-guess)
  (lambda (guess)
    (if (good-enough? guess)   ; if the guess is good enough, we return guess
        guess
        ((iterative-improve good-enough? improve-guess)  ; we repeat the process but with a better guess
         (improve-guess guess)))))


; Redefinition of sqrt-iter
(define (sqrt-iter x)
  ((iterative-improve 
     (lambda (guess) (sqrt-good-enough? guess x)) 
     (lambda (guess) (sqrt-improve guess x)))
   1.0))



(define tolerance 0.00001)
; Redefinition of the fixed-point procedure
(define (fixed-point-iter f ini-guess)
  ((iterative-improve 
     (lambda (guess) (< (abs (- (f guess) guess)) tolerance))  ; first argument is the good-enough?
     (lambda (guess) (f guess)))  ; we improve the guess by doing f(guess)
   ini-guess))


(sqrt-iter 4.0)

(fixed-point-iter cos 1)