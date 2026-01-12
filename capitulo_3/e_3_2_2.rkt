#lang racket

;; make-monitored: devuelve un procedimiento que monitoriza llamadas a f tomando un solo argumento
(define (make-monitored f)
    (define mf 0) ; contador de llamadas
    (lambda (x) 
        (cond
         [(eq? x 'how-many-calls?) mf] ; comando especial
         [(eq? x 'reset-count) (begin (set! mf 0) 'reset)] ; comando especial
         [else (begin
                 (set! mf (+ mf 1)) ; incrementar contador
                 (f x))])) ; reenviar a f
        
        )

(define s (make-monitored *))

(s 16) ; devuelve 21
(s 25) ; devuelve 25
(s 'how-many-calls?) ; devuelve 2
(s 'reset-count) ; devuelve 'reset
(s 'how-many-calls?) ; devuelve 0
