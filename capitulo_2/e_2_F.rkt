#lang racket


;; Bob's box (x, y, width, height)

(define (make-bob-box x y w h)
  (lambda (msg)
    (cond [(eq? msg 'width)  w]
          [(eq? msg 'height) h]
          [(eq? msg 'area)   (* w h)]
          [else (error "Bob-box: unknown message" msg)])))

;; Alice's box (x1, y1, x2, y2)

(define (make-alice-box x1 y1 x2 y2)
  (lambda (msg)
    (cond [(eq? msg 'width)  (abs (- x2 x1))]
          [(eq? msg 'height) (abs (- y2 y1))]
          [(eq? msg 'area)   (* (abs (- x2 x1)) (abs (- y2 y1)))]
          [else (error "Alice-box: unknown message" msg)])))

;; Generic operations

(define (width box)
  (box 'width))

(define (height box)
  (box 'height))

(define (area box)
  (box 'area))


;; Examples

(define b (make-bob-box 10 20 5 3))     ; Bob’s box → width=5, height=3
(define a (make-alice-box 2 3 8 7))     ; Alice’s box → width=6, height=4

(displayln (string-append "Bob width: "   (number->string (width b))))   ; → 5
(displayln (string-append "Bob height: "  (number->string (height b))))  ; → 3
(displayln (string-append "Bob area: "    (number->string (area b))))    ; → 15

(displayln (string-append "Alice width: " (number->string (width a))))   ; → 6
(displayln (string-append "Alice height: "(number->string (height a))))  ; → 4
(displayln (string-append "Alice area: "  (number->string (area a))))    ; → 24
