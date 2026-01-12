#lang racket

(define (display-stream s)
     (if (null? s) null
         (begin (display (stream-car s))
                (newline)
                (display-stream (stream-cdr s)))))

(define (stream-car stream) (if(stream-empty? stream)
                               empty-stream
                               (stream-first stream)
                               ))
(define (stream-cdr stream) (if(stream-empty? stream)
                               null
                               (stream-rest stream)
                               ))

;--------------------------------------------------
(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)


(define (stream-enumerate-interval i j)
  (if (eq? i j)
      j
      (cons i (stream-enumerate-interval (+ 1 i) j))
  ))

(define seq 
  (stream-map 
   accum 
   (flatten (stream-enumerate-interval 1 20))))

(define y (stream-filter even? seq))

(define z 
  (stream-filter 
   (lambda (x) 
     (= (remainder x 5) 0)) seq))

sum ;=0
(stream-ref y 7) ;displays the 8th (position 7) element of the stream
sum ;=136
(display-stream z) ; displays the elements of the stream starting from position 0
sum ;=210

;The results wouldn't change if the delay operation was implemented as
; (lambda <exp>) without the 'memo-proc' optimization, mainly because
; the code does not use delay.
