#lang racket

(define (make-queue)
  (let ((front-ptr '()) ; Puntero al frente de la cola
        (rear-ptr '())) ; Puntero al final de la cola
    
    ; Selectores
    (define (empty-queue?)
      (null? front-ptr))
    
    ; Obtener el elemento al frente de la cola
    (define (front-queue)
      (if (empty-queue?)
          (error "FRONT called with an empty queue")
          (mcar front-ptr)))
    
    ; Agregar un elemento al final de la cola
    (define (insert-queue! item)
      (let ((new-pair (mcons item '()))) 
        (cond ((empty-queue?)
               (set! front-ptr new-pair)
               (set! rear-ptr new-pair))
              (else
               (set-mcdr! rear-ptr new-pair)
               (set! rear-ptr new-pair)))))
    
    (define (delete-queue!)
      (cond ((empty-queue?)
             (error "Cola vacia"))
            (else
             (set! front-ptr (mcdr front-ptr))
             (when (null? front-ptr)
               (set! rear-ptr '())))))
    
    ; Imprimir el contenido de la cola
    (define (print-queue)
      (let loop ((p front-ptr))
        (if (null? p)
            '()
            (cons (mcar p)
                  (loop (mcdr p))))))
    
    ; Dispatcher para las operaciones
    (define (dispatch m)
      (cond ((eq? m 'empty-queue?) (empty-queue?))
            ((eq? m 'front-queue) (front-queue))
            ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'delete-queue!) (delete-queue!))
            ((eq? m 'print-queue) (print-queue))
            (else (error "Not implemented" m))))
    
    dispatch))

; 
(define (empty-queue? queue)
  (queue 'empty-queue?))

(define (front-queue queue)
  (queue 'front-queue))

(define (insert-queue! queue item)
  ((queue 'insert-queue!) item))

(define (delete-queue! queue)
  (queue 'delete-queue!))

(define (print-queue queue)
  (queue 'print-queue))

;Ejemplo de uso:
(define q1 (make-queue))
(insert-queue! q1 'a)
(insert-queue! q1 'b)
(print-queue q1)        ; => (a b)
(front-queue q1)        ; => a
(delete-queue! q1)
(print-queue q1)        ; => (b)
(insert-queue! q1 'c)
(insert-queue! q1 'd)
(print-queue q1)        ; => (b c d)
(delete-queue! q1)
(delete-queue! q1)
(print-queue q1)        ; => (d)
(empty-queue? q1)       ; => #f
(delete-queue! q1)
(empty-queue? q1)       ; => #t