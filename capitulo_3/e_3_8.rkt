#lang racket

; Hay dos casos posibles, que se evalúe de izquierda a derecha o que se evalúe de derecha a izquierda.
; Para estos casos hacemos lo siguiente, si se evalúa de izquierda a derecha queremos la operación (+ 0 0).
; Si se evalúa de derecha a izquierda queremos la operación (+ 0 1). Para esto lo que podemos hacer es llevar
; una cuenta global de las llamadas. Si es la primera llamada a la funcion, retornamos el argumento. Es decir,
; tendríamos para el primer caso (+ 0 ?) y en el segundo (+ ? 1). Vemos que el ? es un cero para ambos casos,
; luego en la segunda llamada se retorna cero.

; Variable global para llevar el contador
(define contador 0)

(define (f argumento)
  (if (= contador 0) ; Si es la primera llamada.
      (begin
        (set! contador 1) ; Contador a uno
        argumento ; Retornamos 0 si izq a dcha o 1 si dcha a izq
        )
      (begin
        (set! contador 0) ; Si es la segunda llamada, reiniciamos el contador y siempre cero.
        0
        )
      )
  )
      
(+ (f 0) (f 1))
; Como se retorna cero, se evalúan de izquierda a derecha.
; Para probar que funciona la implementación si se cambian de orden: (+ (f 1) (f 0)) --> 1.
