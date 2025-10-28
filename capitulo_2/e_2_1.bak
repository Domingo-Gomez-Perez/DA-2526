#lang racket

;; Definimos el máximo común divisor para simplificar fracciones
(define (gcd a b)
  (if (= b 0)
      (abs a)                    ; si el divisor es 0, devolvemos el valor absoluto de a
      (gcd b (remainder a b))))  ; aplicamos el algoritmo de Euclides

;; Constructor de racionales "mejorado"
(define (make-rat n d)
  (if (= d 0)
      (error "El denominador no puede ser cero") ; control de error
      (let* ((g (gcd n d))       ; calculamos el MCD de numerador y denominador
             (n1 (/ n g))        ; reducimos el numerador
             (d1 (/ d g)))       ; reducimos el denominador
        (cond ((and (< n1 0) (< d1 0))        ; caso 1: ambos negativos
               (cons (/ n1 -1) (/ d1 -1)))    ; → los hacemos positivos
              ((< d1 0)                       ; caso 2: solo el denominador negativo
               (cons (/ n1 -1) (/ d1 -1)))    ; → movemos el signo al numerador
              (else                           ; caso 3: denominador ya positivo
               (cons n1 d1))))))              ; → dejamos tal cual

;; selectores de numerador y denominador
(define numerator car)
(define denominator cdr)


(make-rat 6 8)     
(make-rat -6 8)    
(make-rat 6 -8)    
(make-rat -6 -8)   