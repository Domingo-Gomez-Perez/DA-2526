#lang racket
(require racket/mpair) ;; Necesitamos pares mutables para Racket

;; =============================================================================
;; EJERCICIO 3.22: COLAS COMO PROCEDIMIENTOS (MESSAGE PASSING)
;; =============================================================================

(define (make-queue)
  ;; ESTADO LOCAL:
  ;; 'front-ptr' y 'rear-ptr' están ocultos dentro del closure.
  (let ((front-ptr '())
        (rear-ptr  '()))

    ;; -------------------------------------------------------------------------
    ;; PROCEDIMIENTOS INTERNOS
    ;; -------------------------------------------------------------------------

    ;; Verifica si la cola está vacía
    (define (empty-queue?)
      (null? front-ptr))

    ;; Devuelve el primer elemento (sin borrarlo)
    (define (front-queue)
      (if (empty-queue?)
          (error "FRONT called on empty queue")
          (mcar front-ptr)))

    ;; Inserta un nuevo elemento al final
    (define (insert-queue! item)
      (let ((new-pair (mcons item '())))
        (cond ((empty-queue?)
               ;; Si estaba vacía, el nuevo par es tanto el frente como el final
               (set! front-ptr new-pair)
               (set! rear-ptr new-pair)
               front-ptr)
              (else
               ;; Si ya tenía datos, lo pegamos al final y actualizamos rear-ptr
               (set-mcdr! rear-ptr new-pair)
               (set! rear-ptr new-pair)
               front-ptr))))

    ;; Elimina el elemento del frente
    (define (delete-queue!)
      (cond ((empty-queue?)
             (error "DELETE! called on empty queue"))
            (else
             (set! front-ptr (mcdr front-ptr))
             ;; Si después de borrar la cola queda vacía, es buena práctica 
             ;; limpiar rear-ptr, aunque la lógica depende de front-ptr.
             (if (null? front-ptr)
                 (set! rear-ptr '())
                 'void) 
             front-ptr)))

    ;; -------------------------------------------------------------------------
    ;; DISPATCH (Paso de Mensajes)
    ;; -------------------------------------------------------------------------
    (define (dispatch m)
      (cond ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'delete-queue!) delete-queue!)
            ((eq? m 'front-queue)   front-queue)
            ((eq? m 'empty-queue?)  empty-queue?)
            (else (error "Unknown request -- MAKE-QUEUE" m))))

    dispatch))

;; =============================================================================
;; PRUEBAS DE FUNCIONAMIENTO
;; =============================================================================

(display "--- Creando cola q1 ---\n")
(define q1 (make-queue))

(display "¿Está vacía? ") 
(display ((q1 'empty-queue?))) (newline)
;; -> #t

(display "Insertando 'a'...\n")
((q1 'insert-queue!) 'a)

(display "Insertando 'b'...\n")
((q1 'insert-queue!) 'b)

(display "Frente actual: ") 
(display ((q1 'front-queue))) (newline)
;; -> 'a

(display "Borrando elemento del frente...\n")
((q1 'delete-queue!))

(display "Frente nuevo: ") 
(display ((q1 'front-queue))) (newline)
;; -> 'b
