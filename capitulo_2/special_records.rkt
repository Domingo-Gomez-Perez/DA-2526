#lang racket
(define record '((x 1) (y 2) (z 3)))

(define (assoc key record)
  (if (null? record)
      null
      (if (symbol=? (car (car record)) key)
          (car record)
          (assoc key (cdr record))
          )
      )
  )

(assoc 'y record) ; -> '(y 2)

(define (add-entry key value record)
  (define (add-entry-aux key value record new-record added)
    (if (and (null? record) (not added)) ;Si se llega al final y no se ha encontrado se anhade
        (append new-record (list (list key value)))
        (if (null? record) ;Si se llega al final y se ha anhadido se retorna
            new-record
            ;Si no se ha llegado al final
            (if (symbol=? (car (car record)) key) ;Si se encuentra el simbolo
                (add-entry-aux key value (cdr record) (append new-record (list (list key value))) #t) ;Se sustituye su valor
                (add-entry-aux key value (cdr record) (append new-record (list (car record))) added)
                )
        ))
    )
  (add-entry-aux key value record '() #f)
  )

(add-entry 'w 4 record)  ; -> ((x 1) (y 2) (z 3) (w 4))
(add-entry 'x 10 record) ; -> ((x 10) (y 2) (z 3))

(define (del-entry key record)
  (define (del-entry-aux key record new-record)
    (if (null? record)
        new-record
        (if (symbol=? (car (car record)) key)
            (del-entry-aux key (cdr record) new-record)
            (del-entry-aux key (cdr record) (append new-record (list (car record))))
            )
        )
    )
  (del-entry-aux key record '())
  )

(del-entry 'x record)   ; -> ((y 2) (z 3))


