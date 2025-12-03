#lang racket
(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    
    ; verificar si esta vacia
    (define (empty-queue?)
      (null? front-ptr))
    
    ; Obtener el primer elemento
    (define (front-queue)
      (if (empty-queue?)
          (print "FRONT llamada en una cola vacía")
          (mcar front-ptr)))
    
    ; Insertar un elemento
    (define (insert-queue! item)
      (let ((new-pair (mcons item '())))
        (cond ((empty-queue?)
               (set! front-ptr new-pair)
               (set! rear-ptr new-pair)
               front-ptr) ; Vemos con la lista actual lo que hay
              (else
               (set-mcdr! rear-ptr new-pair)
               (set! rear-ptr new-pair)
               front-ptr))))
    
    ;Eliminar el primer elemento
    (define (delete-queue!)
      (cond ((empty-queue?)
             (print "DELETE! llamada en una cola vacía"))
            (else
             (set! front-ptr (mcdr front-ptr))
             front-ptr)))
    
    ;Procedimiento dispatch
    (define (dispatch m)
      (cond ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'delete-queue!) delete-queue!)
            ((eq? m 'front-queue) front-queue)
            ((eq? m 'empty-queue?) empty-queue?)
            (else (print "No existe esa solicitud" m))))
    
    dispatch))

(define q (make-queue))
((q 'front-queue))
((q 'insert-queue!)'a)
((q 'insert-queue!)'b)
((q 'delete-queue!))
((q 'front-queue))


