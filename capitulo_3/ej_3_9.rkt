#lang racket

;; Factorial recursivo con impresión de entorno
(define (factorial n)
  (display (string-append "Entrando en entorno factorial con n = " (number->string n) "\n"))
  (if (= n 1)
      (begin (display "Caso base, retorno 1\n") 1)
      (let ((result (* n (factorial (- n 1)))))
        (display (string-append "Saliendo del entorno factorial con n = " (number->string n) ", resultado = " (number->string result) "\n"))
        result)))

;; Factorial iterativo con impresión de entorno
(define (factorial-iter product counter max-count)
  (display (string-append "Entorno fact-iter: product=" (number->string product)
                          ", counter=" (number->string counter)
                          ", max-count=" (number->string max-count) "\n"))
  (if (> counter max-count)
      (begin (display (string-append "Condición fin alcanzada: resultado = " (number->string product) "\n"))
             product)
      (factorial-iter (* counter product)
                      (+ counter 1)
                      max-count)))

(define (factorial2 n)
  (factorial-iter 1 1 n))

;; Ejecutamos las funciones para ver la traza
(display "Factorial recursivo con n=6:\n")
(factorial 6)

(newline)
(display "\nFactorial iterativo con n=6:\n")
(factorial2 6)
