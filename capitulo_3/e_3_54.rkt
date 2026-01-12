#lang racket


(define (cons-stream head tail-thunk)
  (cons head tail-thunk))

(define (stream-car s)
  (car s))

(define (stream-cdr s)
  ((cdr s)))

(define (stream-map f s1 s2)
  (cons-stream (f (stream-car s1)
                  (stream-car s2))
               (lambda ()
                 (stream-map f
                             (stream-cdr s1)
                             (stream-cdr s2)))))

;; Stream de enteros: 1, 2, 3, 4, ...
(define integers
  (letrec ([ints (cons-stream 1
                              (lambda ()
                                (stream-map (lambda (x y) (+ y 1))
                                            ints ints)))])
    ints))

;; mul-streams: producto elemento a elemento
(define (mul-streams s1 s2)
  (stream-map * s1 s2))

;; Stream de factoriales
(define factorials
  (letrec ([facts
            (cons-stream 1
                         (lambda ()
                           (mul-streams facts integers)))])
    facts))

;; Obtener el n-ésimo elemento del stream
(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))


(stream-ref factorials 0) ; 1
(stream-ref factorials 1) ; 1
(stream-ref factorials 2) ; 2
(stream-ref factorials 3) ; 6
(stream-ref factorials 4) ; 24
(stream-ref factorials 5) ; 120

