#lang racket

(define (deriv exp var) ; La definición de deriva es una expresión con una variable
  (cond ((number? exp) 0) ; la derivada de un número es siempre cero
        ((variable? exp) ; Si es una variable
         (if (same-variable? exp var) 1 0)) ; La derivada es 1 si es la variable por la que derivadas y cero en otro caso
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var))) ; Si es una suma, la derivada es la suma de las derivadas
        ((product? exp)
         (make-sum
          (make-product 
           (multiplier exp)
           (deriv (multiplicand exp) var)); Si es un producto es la derivada del primero por el segundo sin derivar mas la derivada del segundo por el primero.
          (make-product 
           (deriv (multiplier exp) var)
           (multiplicand exp))))

        ((exponentiation? exp)
         (make-product
          (make-product
           (exponent exp)
           (make-exponentiation
            (base exp)
            (- (exponent exp) 1)))
          (deriv (base exp) var)))
        (else (error "unknown expression 
                      type: ???" exp))))




(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (make-sum a1 a2) (list '+ a1 a2))
(define (make-product m1 m2) (list '* m1 m2))
(define (make-exponentiation base exponent) (list '** base exponent))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))


(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**) (number? (car (cdr (cdr x))))))

(define base (lambda (e) (cadr e)))
(define exponent (lambda (e) (caddr e)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

; Ejemplo de uso

(define x (make-exponentiation  'x 3))
(deriv x 'x) ; Resultado esperado: 3 * x^2

(define y (make-exponentiation  'y 5))
(deriv y 'y) ; Resultado esperado: 5 * y^4