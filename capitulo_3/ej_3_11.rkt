#lang racket

(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request: MAKE-ACCOUNT" m))))
  dispatch)


(define acc (make-account 50))

((acc 'deposit) 40)   
((acc 'withdraw) 60)  

(define acc2 (make-account 100))


; Where is the local state for acc kept? Suppose we define another account

;;El estado local balance se guarda en el entorno cerrado (closure) creado por la llamada a make-account.
;;Cada cuenta devuelve la función dispatch que tiene acceso a este balance en su entorno para realizar depósitos y retiros.
;;El entorno local con balance es único e independiente para cada cuenta.


; How are the local states for the two accounts kept distinct? Which parts of the environment structure are shared between acc and acc2?

;;Cada invocación a make-account crea una nueva estructura de entorno con su propio balance.
;;Tanto acc como acc2 tienen diferentes cierres sobre sus respectivos entornos.
;;Comparten el código de las funciones withdraw, deposit y dispatch, pero apuntan a diferentes entornos para el estado.