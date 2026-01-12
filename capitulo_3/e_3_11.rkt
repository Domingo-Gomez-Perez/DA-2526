#lang Racket

(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance 
                     (- balance 
                        amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request: 
                        MAKE-ACCOUNT" 
                       m))))
  dispatch)

(define acc (make-account 50))

((acc 'deposit) 40)

((acc 'withdraw) 60)

(define acc2 (make-account 100))

((acc2 'deposit) 40)

((acc2 'withdraw) 60)


;; Cada llamada a make-account crea un entorno local nuevo que contiene
;; la variable 'balance'. Los procedimientos internos withdraw, deposit
;; y dispatch quedan cerrados (clausurados) sobre ese entorno, así que
;; pueden leer y modificar su propio 'balance'.

;; En (define acc (make-account 50)) se crea un entorno donde
;; balance = 50. Después de ((acc 'deposit) 40), balance pasa a 90,
;; y tras ((acc 'withdraw) 60), queda en 30.

;; Cuando definimos (define acc2 (make-account 100)), se crea otro
;; entorno independiente con balance = 100. Así, cada cuenta mantiene
;; su propio estado sin interferir con otras.

;; Lo único que se comparte entre acc y acc2 es el código de los
;; procedimientos; los entornos con sus respectivos balances son
;; completamente independientes.
