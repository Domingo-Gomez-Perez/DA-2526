#lang racket
;;**Exercise 3.22:** Instead of representing a queue
;;as a pair of pointers, we can build a queue as a procedure with local state.
;;The local state will consist of pointers to the beginning and the end of an
;;ordinary list.  Thus, the `make-queue` procedure will have the form


;;(define (make-queue)
  ;;(let ((front-ptr ... )
    ;;    (rear-ptr ... ))
    ;;⟨ definitions of internal procedures ⟩
    ;;(define (dispatch m) ...)
    ;;dispatch))


;;Complete the definition of `make-queue` and provide implementations of the
;;queue operations using this representation.

(require rnrs/mutable-pairs-6)

(define (make-queue)
  (let ((front-ptr '()) ;Esta vacio
        (rear-ptr '()))
    
    ;;Se pone en cola un objeto en la parte de atras
    (define (enqueue item)
      (if (null? front-ptr)
          (begin
            (set! front-ptr (mcons item '()))
            (set! rear-ptr front-ptr))
          (begin
            (set-mcdr! rear-ptr (mcons item '()))
            (set! rear-ptr (mcdr rear-ptr)))))
    
    ;;Se hace pop a un elemento de la cabeza 
    (define (dequeue)
      (if (null? front-ptr)
          (error "La cola esta vacia")
          (let ((item (mcar front-ptr)))
            (set! front-ptr (mcdr front-ptr))
            (when (null? front-ptr)
              (set! rear-ptr '()))
            item)))
    
    ;;Se observa el primer elemento
    (define (front)
      (if (null? front-ptr)
          (error "La cola esta vacia")
          (mcar front-ptr)))
    
    ;; Dispatch procedure to handle operations
    (define (dispatch m . args)
      (cond
        ((eq? m 'enqueue) (enqueue (car args)))
        ((eq? m 'dequeue) (dequeue))
        ((eq? m 'front) (front))
        (else (error "error" m))))
    
    dispatch))


(define q (make-queue))
(q 'enqueue 10)
(q 'enqueue 20)
(q 'front)  ;debe ser mayoir o igual que 10
(q 'dequeue);debe ser mayoir o igual que 10
(q 'front) ;debe ser mayoir o igual que 20

