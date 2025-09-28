#lang racket

; Eva's new-if definition
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

 (new-if (= 2 3) 0 5)   ; → should return 5
 (new-if (= 1 1) 0 5)   ; → should return 0

(define (square x) (* x x))

(define (average x y) 
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; Original sqrt-iter with special form 'if' (this works)
(define (sqrt-iter-original guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter-original (improve guess x) x)))

; Alyssa's version using new-if 
(define (sqrt-iter-new-if guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter-new-if (improve guess x) x)))

;; Wrapper function to catch the infinite recursion
(define (safe-sqrt-iter-new-if guess x)
  (with-handlers ([exn:fail? (lambda (exn) 'infinite-recursion)])
    (sqrt-iter-new-if guess x)))

;; Let's test both versions
(sqrt-iter-original 1.0 2)        ; → works, returns approx sqrt(2)
(safe-sqrt-iter-new-if 1.0 2)     ; → infinite recursion (caught)

; Explanation:
; The original 'if' is a special form that only evaluates
; the branch that is needed based on the predicate.
; But 'new-if' is a procedure, so all arguments are evaluated
; before the procedure is called, including the recursive call.
; This causes infinite recursion because the base case is never reached.
