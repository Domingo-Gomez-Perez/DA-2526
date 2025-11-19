#lang racket

; PROBLLEM: THE BOX

; Bob's box
#|

ENUNCIADO

(define (bob-make-box x y w h)
  (cons (cons x y) (cons w h)))

(define (bob-width box)
   (car (cdr box)))

(define (bob-height box)
   (cdr (cdr box)))

(define (bob-area box)
    (* (bob-width box) (bob-height box)))

; Alice's box
(define (alice-make-box x1 y1 x2 y2)
 (cons (cons x1 y1) (cons x2 y2)))

(define (alice-width box)
   (abs (- (car (cdr box))
           (car (car box)))))

(define (alice-height box)
   (abs (- (cdr (cdr box))
           (cdr (car box)))))

(define (alice-area box)
    (* (alice-width box) (alice-height box)))

(define a (alice-make-box 1 2 3 4))
(define b (bob-make-box 1 2 3 4))
(alice-area a)
;4
(bob-area b)
;12

|#


;2A)
; Para que el código funcione hemos tenido que modificar alice-area y bob-area para usar sus respectivos métodos que calculan el ancho y el alto (estaba puesto de manera genérica).
; Las estructuras de datos son idénticas pero representan cosas diferentes.


;2B)



; Métodos para definir tipos
(define (attach-tag tag contents) (cons tag contents))
(define (type-tag datum) (car datum))
(define (contents datum) (cdr datum))

; MÉTODOS PARA CALCULAR ÁREA
(define (bob-area box)
    (* (bob-width box) (bob-height box)))

(define (alice-area box)
    (* (alice-width box) (alice-height box)))

; MÉTODOS PARA LA REPRESENTACIÓN DE BOB
(define (bob-make-box x y w h)
    (attach-tag 'bob-box
         (cons (cons x y) (cons w h))))

; type-check procedure
(define (bob-box? b)
  (eq? (type-tag b) 'bob-box))


(define (bob-width box) (car (cdr (contents box))))
(define (bob-height box) (cdr (cdr (contents box))))


; MÉTODOS PARA LA REPRESENTACIÓN DE ALICE
(define (alice-make-box x y w h)
    (attach-tag 'alice-box
         (cons (cons x y) (cons w h))))

; type-check
(define (alice-box? b)
  (eq? (type-tag b) 'alice-box))

(define (alice-width box)
   (abs (- (cdr (cdr (contents box)))
           (cdr (car (contents box))))))

(define (alice-height box)
   (abs (- (cdr (cdr (contents box)))
           (cdr (car (contents box))))))



; COMPROBAMOS QUE OBTENEMOS LOS MISMOS RESULTADOS QUE ANTES

(define b (bob-make-box 1 2 3 4))
;(bob-area b) ; Debería dar 12


(define a (alice-make-box 1 2 3 4))
;(alice-area a) ;Debería dar 4




;2C)

; CREAMOS MÉTODOS GENÉRICOS

#|
(define (width box)
  (cond ((bob-box? box) (bob-width box))
        ((alice-box? box) (alice-width box))))

(define (height box)
  (cond ((bob-box? box) (bob-height box))
        ((alice-box? box) (alice-height box))))


(define (area box)
  (cond ((bob-box? box) (bob-area box))
        ((alice-box? box) (alice-area box))))

|#

;2D)

; VOLEMOS A CREAR MÉTODOS GENÉRICOS PERO ESTA VEZ UTILIZANDO UNA TABLA PARA PODER TRABAJAR CON CUALQUIER TIPO DE REPRESENTACIÓN (LOS ANTERIORES MÉTODOS GENÉRICOS SOLO SIRVEN PARA
; BOB Y ALICE)

(define table (make-hash))

(define (register name tag proc)
   (hash-set! table (list name tag) proc))  ; La llave es una lista formada por width o height seguido de el tipo de representación. El valor es el método que habría que aplicar

(define (lookup name tag)
   (hash-ref table (list name tag)))   ; Damos la llave y nos devuelve el método adecuado

; MÉTODOS GENÉRICOS
(define (width box)
    ((lookup 'width (type-tag box)) box))

(define (height box)
    ((lookup 'height (type-tag box)) box))

(define (area box)
    (* ((lookup 'height (type-tag box)) box)  ; obtenemos la altura correspondiente a nuestra representación
       ((lookup 'width (type-tag box)) box))) ; obtenemos la base correspondiente a nuestra representación


; COMPROBAMOS QUE SALE LO DE ANTES
(register 'width 'bob-box bob-width)
(register 'width 'alice-box alice-width)

(register 'height 'bob-box bob-height)
(register 'height 'alice-box alice-height)


;(area a) ; Da 4
;(area b) ; Da 12


;2E)

; EN ESTE EJERCICIO AGRUPAMOS LOS MÉTODOS DE CADA REPRESENTACIÓN BAJO UN MISMO NAMESPACE (import-bob-box y import-alice-box)
; De esta manera ejecutando estos dos métodos, tendríamos asignados fácilmente cada método a su tipo en la tabla.

(define (import-bob-box)
  
  
   (define (width box)
       (car (cdr (contents box))))
  
   (define (height box)
       (cdr (cdr (contents box))))

  (define (area box)
    (* (width box) (height box)))
  
   (register 'width 'bob-box width)
   (register 'height 'bob-box height)
   (register 'area 'bob-box area)
)


(define (import-alice-box)
  
  (define (width box)
   (abs (- (car (cdr box))
           (car (car box)))))

  (define (height box)
   (abs (- (cdr (cdr box))
           (cdr (car box)))))

  (define (area box)
    (* (width box) (height box)))
  
   (register 'width 'alice-box width)
   (register 'height 'alice-box height)
   (register 'area 'alice-box area)
)


; Respecto a la reflexión, si podríamos añadir los métodos de make-alice-box y make-bob-box en sus respectivos imports(de manera prácticamente idéntica
; a como lo hemos hecho con area, por ejemplo). Podría ser útil si tuviéramos representaciones con diferente número de argumentos. Luego, podríamos crear una
; función make-box genérica que coja el tipo y el número de argumentos y cree los cuadrados de manera simple, sin necesidad de conocer detalles de implementación.



;2F)

(define (make-bob-box x y width height)
  (define (dispatch message)
    (cond ((eq? message 'width) width)
          ((eq? message 'height) height)
          ((eq? message 'area) (* width height))
          ((eq? message 'type) 'bob-box)
          )
    )
  dispatch
)

(define (make-alice-box x1 y1 x2 y2)
  (define (dispatch message)
    (let ((width (abs (- x2 x1)))
          (height (abs (- y2 y1))))
      (cond ((eq? message 'width) width)
            ((eq? message 'height) height)
            ((eq? message 'area) (* width height))
            ((eq? message 'type) 'alice-box))))
  dispatch)


(define alice (make-alice-box 1 2 3 4))
(define bob (make-bob-box 1 2 3 4))

#|
(alice 'type)
(alice 'area)
(bob 'type)
(bob 'area)
|#
