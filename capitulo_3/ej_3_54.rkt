#lang racket

; Definir mul-streams, análogo a add-streams, que procesa el producto de sus dos
; streams de entrada. Usar esto con un stream de enteros para completar la definición
; del stream cuyo n-ésimo elemento (contando desde cero) es n + 1 factorial
(define factorials 
  (cons-stream 1 (mul-streams ⟨??⟩ ⟨??⟩)))

; Funciones pedidas
(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(define factorials
  (cons-stream 1
    (mul-streams factorials (stream-cdr integers))))