#lang racket

(struct mcons (car cdr) #:mutable)

(define (mcar p) (mcons-car p))
(define (mcdr p) (mcons-cdr p))
(define (set-mcar! p v) (set-mcons-car! p v))
(define (set-mcdr! p v) (set-mcons-cdr! p v))

(define (append x y)
  (if (or (null? x) (eq? x '()))
      y
      (mcons (mcar x) (append (mcdr x) y))))

(define (last-pair x)
  (if (or (null? (mcdr x)) (eq? (mcdr x) '()))
      x
      (last-pair (mcdr x))))

(define (append! x y)
  (set-mcdr! (last-pair x) y)
  x)

;; Función para convertir lista mcons a lista normal de Racket para imprimir
(define (mcons->list m)
  (if (or (null? m) (eq? m '()))
      '()
      (cons (mcar m) (mcons->list (mcdr m)))))

;; Listas de prueba
(define x (mcons 'a (mcons 'b '())))
(define y (mcons 'c (mcons 'd '())))

(define z (append x y))

(displayln "Después de append:")
(displayln (mcons->list z))
(displayln "mcdr de x:")
(displayln (mcons->list (mcdr x)))

(define w (append! x y))

(displayln "\nDespués de append! (mutable):")
(displayln (mcons->list w))
(displayln "mcdr de x (después de append!):")
(displayln (mcons->list (mcdr x)))
