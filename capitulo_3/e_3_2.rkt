#lang racket

;; make-monitored: devuelve un procedimiento que monitoriza llamadas a f
(define (make-monitored f)
    (define mf 0) ; contador de llamadas
    (define (monitor . args )
        (cond
            ;revisa si es un comando especial
            [(and (pair? args)(null? (cdr args)) (symbol? (car args)))
             (case (car args)
                 [(how-many-calls?) mf]
                 [(reset-count) (set! mf 0) 'reset]
                 [else 
                    (apply f args)
                    (set! mf (+ mf 1))])] ; puede ser otro símbolo, se trata como llamada normal
            ; llamada normal: incrementar contador y reenviar a f
            [else
             (set! mf (+ mf 1))
             (apply f args)]))
    monitor)

(define s (make-monitored *))

(s 16 5) ; devuelve 21
(s 25) ; devuelve 25
(s 'how-many-calls?) ; devuelve 2
(s 'reset-count) ; devuelve 'reset
(s)
(s 'how-many-calls?) ; devuelve 1
