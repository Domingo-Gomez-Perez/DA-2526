#lang racket
;Primero aplicamos el algoritmo de Fleury, que permite encontrar un circuito de Euler.
;Como entrada se recibe un grafo, que representa el mapa con el que queremos trabajar.
;1. Verificar que es conexo con todos los vertices par:
;    3O     3E
;    ||     ||
;    2O     2E
;     \\   //
;        1
;     |||||||
;        0
;2. Seleccionamos un vértice aleatorio
;
;3. Eliminar una arista que parta de este vértice, que no desconecte el grafo, a menos que no haya opción
;
;4. Si todos los vertices estan desconectados se obtiene el circuito de euler
;                                                       ___________
;El grafo le voy a construir como como una lista cons: | car | cdr |, tal que car equivale a un nodo, y cdr a los nodos que apunta
;                                                      |_____|_____|
;Hay que tener en cuenta de que no se puede volver a pasar por la misma escalera 2 veces
;; helpers para igualdad de aristas no dirigidas (u v) == (v u)
(define (misma-arista? a1 a2)
  (cond
    [(or (null? a1) (null? a2)) #f]
    [else
  (or (and (equal? (car a1) (car a2)) (equal? (cadr a1) (cadr a2)))
      (and (equal? (car a1) (cadr a2)) (equal? (cadr a1) (car a2))))]))

;; elimina la primera ocurrencia de arista en la lista (por multiaristas)
(define (borrar-arista arista aristas)
  (cond 
    [(null? aristas) '()]
    [(misma-arista? arista (car aristas)) (cdr aristas)]
    [else (cons (car aristas) (borrar-arista arista (cdr aristas)))]))

;; devuelve las aristas disponibles desde el nodo actual
(define (aristas-desde nodo aristas)
  (filter (lambda (a) (or (equal? (car a) nodo) (equal? (cadr a) nodo))) aristas))

;; encuentra el otro extremo de la arista respecto a nodo
(define (otro-extremo nodo arista)
  (if (null? arista)
      '()
       (if (equal? nodo (car arista)) (cadr arista) (car arista))))

;; función DFS para saber si un nodo es alcanzable desde otro usando solo aristas no usadas
(define (alcanzable? desde hasta aristas)
  (let dfs ((actual desde) (visitados (list desde)))
    (or (equal? actual hasta)
        (let ((vecinos (map (lambda (a) (otro-extremo actual a))
                            (aristas-desde actual aristas))))
          (let loop ((v vecinos))
            (cond
              [(null? v) #f]
              [(not (memv (car v) visitados))
               (or (dfs (car v) (cons (car v) visitados))
                   (loop (cdr v)))]
              [else (loop (cdr v))]))))))

;; determina si una arista es un “puente” (si la quitas, no hay camino entre sus extremos)
(define (puente? actual arista aristas)
  (let* ((siguiente (otro-extremo actual arista))
         (aristas-restantes (borrar-arista arista aristas)))
    (not (alcanzable? siguiente actual aristas-restantes))))

;; selecciona la siguiente arista para el algoritmo de Fleury
(define (elige-siguiente-arista actual aristas)
  (let ((candidatas (aristas-desde actual aristas)))
    (cond
      [(= (length candidatas) 1) (car candidatas)]
      [else
        (let ((no-puentes (filter (lambda (a) (not (puente? actual a aristas))) candidatas)))
          (if (null? no-puentes)
              (if (null? candidatas)
                  '()
                  (car candidatas)) 
              (car no-puentes)))])))

;; función principal recursiva Fleury
(define (fleury-rec actual aristas recorrido)
  (if (or (null? aristas) (null? actual))
      (reverse (cons actual recorrido))
      (let* ((sig-arista (elige-siguiente-arista actual aristas))
             (sig-nodo (otro-extremo actual sig-arista))
             (aristas-restantes (borrar-arista sig-arista aristas)))
        (fleury-rec sig-nodo aristas-restantes (cons actual recorrido)))))

;; función de usuario: da el recorrido euleriano desde el nodo dado
(define (fleury grafo-nodos grafo-aristas inicio)
  (fleury-rec inicio grafo-aristas '()))

;; ejemplo de uso con tus datos:
(define nodos '(0 1 20 21 30 31))
(define aristas '((0 1) (0 1) (0 1) (0 1) (0 1) (0 1) (0 1) (1 20) (1 20) (1 21) (1 21) (20 30) (20 30) (21 31) (21 31)))
;(define aristas '((0 1) (1 20) (1 20) (20 30) (20 30)))

;; para ejecutarlo desde el nodo 0:
(fleury nodos aristas 0)

;
;    
