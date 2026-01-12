#lang racket
; Ejercicio challenge binding

; record que se utiliza para las pruebas
(define record '(job (Hacker Alyssa P) (computer programmer)))

; Función auxiliar para ver si se está preguntando o no
(define (empieza-con-? s)
  (if (symbol=? (string->symbol (substring s 0 1)) '?) ; primer carácter = ?
      #t
      #f))

; Funciones auxiliares para hacer el inverso de una lista
; Defino una función principal que llama a la función auxiliar con la lista (reverse) vacía inicialmente
(define (reverse list)
  (reverse-aux list null))

; En esta función auxiliar rellenamos la nueva lista
(define (reverse-aux list new-list)
  (if (null? list)
      new-list
      (reverse-aux (cdr list) (cons (car list) new-list))))

; Función auxiliar para devolver la pregunta que se hace, sin la interrogación (la etiqueta de la pregunta)
(define (devuelve-la-pregunta pregunta)
  (string->symbol (substring (symbol->string pregunta) 1 (string-length (symbol->string pregunta)))))
  
; Voy a devolver un auxiliar con el resultado acumulado de las cosas que voy añadiendo a la respuesta, el auxiliar da el resultado a la inversa.
(define (bind pattern data)
  (if (list? (bind-aux pattern data '()))
      (reverse (bind-aux pattern data '()))
      (bind-aux pattern data '())))
  
; Bind auxiliar para calcular todo, da el resultado inverso, hace falta aplicar un reverse para obtener el resultado esperado
(define (bind-aux pattern data result)
  (cond ((and (null? pattern) (null? data)) result) ; Ambos null, he acabado
        ((or (null? pattern) (null? data)) #f) ; Solo uno de ellos es null, no hay match
        ((and (list? (car pattern)) (empieza-con-? (symbol->string (car (car pattern))))) ; Es una lista el patron siguiente y además pregunta por algo
         (bind-aux (cdr pattern) (cdr data) (cons (list (devuelve-la-pregunta (car (car pattern))) (car (car data))) result))); Acumulo la respuesta en el result y sigo
        ((empieza-con-? (symbol->string (car pattern))); no es una lista y pregunta por algo, acumulo la respuesta y sigo
         (bind-aux (cdr pattern) (cdr data) (cons (list (devuelve-la-pregunta (car pattern)) (car data)) result)))
        (else (bind-aux (cdr pattern) (cdr data) result)))) ; No pregunta por nada, paso de esa información

; PRUEBAS
(bind '(job ?name ?job) record)
;  --> '((name (Hacker Alyssa P)) (job (computer programmer)))

(bind '(?type ?name (?what programmer)) record)
; -->  '((type job) (name (Hacker Alyssa P)) (what computer))

(bind '(job ?what) record)
; --> false (doesn't match)
  
  
