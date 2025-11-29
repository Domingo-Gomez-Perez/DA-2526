#lang racket
;;**Exercise 3.16:** Ben Bitdiddle decides to write a
;;procedure to count the number of pairs in any list structure.  "It's easy,"
;;he reasons.  "The number of pairs in any structure is the number in the
;;`car` plus the number in the `cdr` plus one more to count the current
;;pair."  So Ben writes the following procedure (modified for Racket):

(define (count-pairs x)
  (if (not (mpair? x))
      0
      (+ (count-pairs (mcar x))
         (count-pairs (mcdr x))
         1)))
;; Ejemplo de uso



;;Show that this procedure is not correct.  In particular, draw box-and-pointer
;;diagrams representing list structures made up of exactly three pairs for which
;;Ben's procedure would return 3; return 4; return 7; never return at all.  Encode
;;these diagrams as data structures using Racket `mcons`

;;El codigo no esta correcto porque hace cada para aparece una solo vez en el recorrido,
;;también la estructura de datos es un arbol,cuando deberia ser un grafo,
;;y tambien no existen comparticion ni ciclos.

;;Lo qe quiero decir es que cuenta el mismo par varias veces cuando esta compartido, por lo que puede devolver 4 o 7 a partir de estructuras quesolo tienen 3 pares.
;;En un ciclo, la recursión nunca acaba  porque baja por el cdr sin que acabe.

;;(a b c)
;; 1: a | o --> b | o --> c| ()
;;En listas simples sin ciclos  ni comparticion podemos usar esto 
(define lst (mcons 1 (mcons 2 (mcons 3 '()))))
(count-pairs lst) ; Esto devuelve 3
;;Para 4 
(define x (mcons 'a '()));1 par
(define y (mcons x x));2 par comparte x por car y cdr
(define z (mcons y '()));3 par lista que contiene y

(count-pairs z) ;Nos devuelve 4

;;Redirijimos el car del segundo para que apunte al tecero
(define x2 (mcons 'a '()));1 par
(define y2 (mcons x x));2 par, comparte x
(define z2 (mcons y y));3 par, comparte y

(count-pairs z2) ;Nos devuelve 7