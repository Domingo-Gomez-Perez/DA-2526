#lang racket

;; Implementación mínima de streams para Racket
(define-syntax-rule (delay expr)
  (lambda () expr))

(define force (lambda (th) (th)))

(define (cons-stream a b)
  (cons a (delay b)))

(define (stream-car s) (car s))
(define (stream-cdr s) (force (cdr s)))

(define stream-null '())
(define (stream-null? s) (null? s))

(define (stream-enumerate-interval low high)
  (if (> low high)
      stream-null
      (cons-stream low
                   (stream-enumerate-interval (+ low 1) high))))

(define (stream-map proc s)
  (if (stream-null? s)
      stream-null
      (cons-stream (proc (stream-car s))
                   (stream-map proc (stream-cdr s)))))

(define (stream-filter pred s)
  (cond [(stream-null? s) stream-null]
        [(pred (stream-car s))
         (cons-stream (stream-car s)
                      (stream-filter pred (stream-cdr s)))]
        [else (stream-filter pred (stream-cdr s))]))

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (display-stream s)
  (unless (stream-null? s)
    (display (stream-car s))
    (newline)
    (display-stream (stream-cdr s))))

;; Ejercicio 3.52

;; sum inicia en 0
(define sum 0)

;; acum recibe un número, lo suma y devuelve el nuevo valor
(define (accum x)
  (set! sum (+ x sum))
  sum)

;; seq es un stream del 1 al 20, al que le aplico accum
(define seq
  (stream-map
   accum
   (stream-enumerate-interval 1 20)))

;; y es un filtro que deja los pares de seq
(define y (stream-filter even? seq))

;; z deja solo los múltiplos de 5 de seq
(define z
  (stream-filter
   (lambda (x) (= (remainder x 5) 0))
   seq))

;; Pregunta 1:
;; ¿Cuál es el valor final de sum después de (stream-ref y 7)?
;; Comentario:
;; Para obtener y7, el stream seq debe generar los primeros 8 valores pares.
;; seq produce acumulaciones:
;;   valores: 1 2 3 4 5 6 7 8 9 10 ...
;;   sum evoluciona así: 1 3 6 10 15 21 28 36 45 ...
;; Los pares generados por seq (stream y):
;;   2, 4, 6, 8, 10, 12, 14, 16  → pero sus valores acumulados reales son:
;;   3, 10, 21, 36, 55, 78, 105, 136 ...
;; El elemento 7 de y es 136.
;; Por tanto, después de evaluar (stream-ref y 7),
;; sum = 136

(stream-ref y 7)

;; Pregunta 2:
;; ¿Qué imprime display-stream aplicado a z?
;; z contiene los valores de seq que son múltiplos de 5.
;; seq acumulado produce: 1 3 6 10 15 21 28 36 45 55 66 78 91 105 ...
;; Los múltiplos de 5 son:
;;   10, 15, 45, 55, 105, ...
;; Por tanto display-stream imprime:
;; 10
;; 15
;; 45
;; 55
;; 105
;; ...

(display-stream z)

;; ---------------------------------------------------------
;; PREGUNTA 3:
;; ¿Cambiarían los resultados si delay fuese simplemente un (lambda () expr)
;; sin la optimización que recuerda valores ya evaluados?
;;
;; Sí cambiarían.
;;
;; Sin memoización:
;;   Cada vez que stream-ref solicitara un elemento,
;;   el stream volvería a evaluar desde el inicio todas las expansiones previas.
;;
;; Como seq usa accum y modifica sum,
;; al reevaluarse volvería a cambiar sum múltiples veces,
;; dando valores distintos y creciendo mucho más de lo debido.
;;
;; Con memo-proc (la implementación real de delay en SICP):
;;   El stream recuerda los valores ya calculados,
;;   así que accum se ejecuta una sola vez por cada elemento del stream.
;;
;; ➜ Con memoización: sum termina en 55.
;; ➜ Sin memoización: sum sería mucho mayor y los resultados serían incorrectos.
