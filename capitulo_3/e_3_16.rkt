#lang racket
(define (count-pairs x)
  (if (not (mpair? x))
      0
      (+ (count-pairs (mcar x))
         (count-pairs (mcdr x))
         1)))

(mcons (mcons (mcons "1" "1") (mcons "3" "4")) (mcons "5" "6"))
; Output: (mcons (mcons (mcons "1" "1") (mcons "3" "4")) (mcons "5" "6"))
(count-pairs (mcons (mcons (mcons "1" "1") (mcons "3" "4")) (mcons "5" "6")))
; Resultado 5
; El motivo por el que no es correcto es porque cuenta las parejas de mcons, es decir
; Pareja 1: (mcons (mcons "1" "1") (mcons "3" "4")) , (mcons "5" "6")
; Pareja 2: (mcons "1" "1") , (mcons "3" "4")
; Pareja 3: ("1" , "1")
; Pareja 4: ("3" , "4")
; Pareja 5: ("5" , "6")
; Ya que todas estas parejas se evaluan como cierto bajo (mpair? x) 