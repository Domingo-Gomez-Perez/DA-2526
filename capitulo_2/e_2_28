#lang racket


; Ejercicio 2.25 – 
;; ==============================================
;;Realizamos combinaciones de car y cdr para obtener 7


; 1) Lista: (1 3 (5 7) 9)
(define lista1 '(1 3 (5 7) 9))

;; Prueba 1
;; ============
(displayln (cadr (caddr lista1))) ; → 7

; 2) Lista: ((7))
(define lista2 '((7)))

;; Prueba 2
;; =====================================
(displayln (caar lista2)) ; → 7



; 3) Lista: (1 (2 (3 (4 (5 (6 7))))))
(define lista3 '(1 (2 (3 (4 (5 (6 7)))))))

;; Prueba 3
;; =========================
(displayln (cadr (cadr (cadr (cadr (cadr (cadr lista3))))))) ; → 7
