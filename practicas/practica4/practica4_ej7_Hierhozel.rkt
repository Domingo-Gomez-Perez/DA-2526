#lang racket
;Algoritmo de Hierhozel
;Este algoritmo solo se cumple si el grafo es conexo y todos sus vertices tienen rango 2,
;o si solo 2 vértices tienen un rango impar. En este caso se cumple el segundo caso, asique
;solo encontrará un camino si parte de un vértice con rango impar.
;El grafo utilizado es el siguiente:
;    3O     3E
;    ||     ||
;    2O     2E
;     \\   //
;        1
;     |||||||
;        0
;1. Como estamos en el segundo caso, cubrimos el caso en el que haya 2 vertices con número impar
;2. Elegimos un nodo, si es el caso de grado impar, seleccionamos uno de esos, nosotros para evitar confusion escogemos el cero
;3. Obtenemos un ciclo que parte del nodo y termina en el
;4. Añadimos eso a una lista C, que lleva el camino recorrido
;5. Eliminamos de las aristas iniciales las que hemos utilizado en el ciclo
;6. Elegimos un vertice que se encuentra en C y que no ha quedado aislado
;7. Repetimos el proceso anterior, sustituyendo el nuevo ciclo en la parte de la cadena que le corresponde
;8. Si tenemos el caso impar, eliminamos la arista que habiamos añadido, eliminando ese vertice de la cadena
(define (arista-impar-rec nodo aristas num)
  (if (null? aristas)
   num
   (let* ((arista (car aristas))
         (nodo1 (car arista))
         (nodo2 (cadr arista)))
        (if (or (equal? nodo1 nodo) (equal? nodo2 nodo))
              (arista-impar-rec nodo (cdr aristas) (+ num 1))
              (arista-impar-rec nodo (cdr aristas) num)))))

(define (nodo-impar-rec nodos aristas arista)
  (if (null? nodos)
      (reverse arista)
      (let* ((nodo (car nodos))
             (num (arista-impar-rec nodo aristas 0))) 
             (if (odd? num)
                 (nodo-impar-rec (cdr nodos) aristas (cons nodo arista))
                 (nodo-impar-rec (cdr nodos) aristas arista)))))

;; vecinos de un nodo (no dirigido)
(define (vecinos-de nodo aristas)
  (filter (lambda (v) v)
          (map (lambda (e)
                 (let ((a (car e))
                       (b (cadr e)))
                   (cond [(= nodo a) b]
                         [(= nodo b) a]
                         [else #f])))
               aristas)))

;; DFS para ciclo: origen fijo, actual es el nodo en el que estamos
;; camino: lista de nodos desde origen hasta actual (incluido)
(define (buscar-ciclo-desde origen actual aristas visitados camino)
  (let ((vecs (vecinos-de actual aristas)))
    (let loop ((vs vecs))
      (if (null? vs)
          #f
          (let ((v (car vs)))
            (cond
              ;; Si el vecino es el origen y el camino tiene ≥ 2 aristas (≥3 nodos),
              ;; hemos encontrado un ciclo no trivial.
              [(and (= v origen)
                    (>= (length camino) 2))
               (append camino (list origen))]

              ;; Si ya visitado, probamos otro vecino.
              [(member v visitados)
               (loop (cdr vs))]

              ;; Exploramos recursivamente desde v
              [else
               (let ((cam (buscar-ciclo-desde
                           origen v aristas
                           (cons v visitados)
                           (append camino (list v)))))
                 (if cam
                     cam
                     (loop (cdr vs))))]))))))

;; Función de entrada
(define (ciclo-desde origen aristas)
  (buscar-ciclo-desde origen origen aristas (list origen) (list origen)))

(define (obten-aristas ciclo aristas)
  (if (or (= (length ciclo) 1) (null? ciclo))
      aristas
      (let ((arista (list (car ciclo) (cadr ciclo))))
        (obten-aristas (cdr ciclo) (cons arista aristas)))))

(define (delete-aristas-ciclo aristas ciclo)
  (if (null? ciclo)
      aristas
      (let ((new-aristas (delete-aristas aristas (car ciclo))))
        (delete-aristas-ciclo new-aristas (cdr ciclo)))))

(define (delete-aristas aristas ciclo)
  (if (null? ciclo)
      aristas
        (cond
          [(equal-aristas? (car aristas) ciclo) (delete-aristas (cdr aristas) '())]
          [else
           (cons (car aristas) (delete-aristas (cdr aristas) ciclo))])))

(define (equal-aristas? elem1 elem2)
  (if (or (equal? elem1 elem2) (and (= (car elem1) (cadr elem2)) (= (cadr elem1) (car elem2))))
      #t
      #f))

(define (hierhozel nodos aristas)
  (let ((arista (nodo-impar-rec nodos aristas '())))
    (cond
      [(= (length arista) 0) (hierhozel-pre nodos aristas (car nodos) '())]
      [(= (length arista) 2) (hierhozel-impar nodos (cons arista aristas) (car arista) '() arista)]
      [else (printf "No se puede conseguir ciclo euleriano")])))

(define (hierhozel-impar nodos aristas arista C arista-elim)
  (let ((res (hierhozel-pre nodos aristas arista C)))
    (cons (car res) (eliminar-arista (cdr res) arista-elim))))

(define (eliminar-arista res arista)
  (if (and (null? (cdr res)) (or (= (car res) (car arista)) (= (car res) (cadr arista))))
      (cdr res)
      (cons (car res) (eliminar-arista (cdr res) arista))))

;Recibimos una cadena C donde almacenamos el camino y elegimos 
(define (hierhozel-pre nodos aristas nodo C)
  (let* ((ciclo (ciclo-desde (car nodos) aristas))
         (aristas-ciclo (obten-aristas ciclo '()))
         (new-aristas (delete-aristas-ciclo aristas aristas-ciclo)))
    (hierhozel-rec new-aristas ciclo)))

(define (nodo-en-aristas? nodo aristas)
  (cond [(null? aristas) #f]
        [else
         (let* ((e (car aristas))
                (u (car e))
                (v (cadr e)))
           (if (or (= nodo u) (= nodo v))
               #t
               (nodo-en-aristas? nodo (cdr aristas))))]))


(define (elige-nodo C aristas)
  (cond [(null? C) #f]
        [(nodo-en-aristas? (car C) aristas) (car C)]
        [else (elige-nodo (cdr C) aristas)]))

(define (actualiza-c C ciclo)
  (cond
   [(null? C) C]
   [(= (car ciclo) (car C)) (append ciclo (cdr C))]
   [else
    (cons (car C) (actualiza-c (cdr C) ciclo))]))

    
(define (hierhozel-rec aristas C)
  (if (null? aristas)
      C
      ;Elegimos un nodo
      (let* ((nodo (elige-nodo C aristas))
             ;Escogemos un ciclo
             (ciclo (ciclo-desde nodo aristas))
             ;Obtenemos las aristas sin las utilizadas en el ciclo
             (aristas-ciclo (obten-aristas ciclo '()))
             (new-aristas (delete-aristas-ciclo aristas aristas-ciclo))
             ;Obtenemos C actualizado
             (new-C (actualiza-c C ciclo)))
        ;Lo hacemos de forma recursiva
        (hierhozel-rec new-aristas new-C))))

(define nodos '(0 1 20 21 30 31))
(define aristas '((0 1) (0 1) (0 1) (0 1) (0 1) (0 1) (0 1) (1 20) (1 20) (1 21) (1 21) (20 30) (20 30) (21 31) (21 31)))

(hierhozel nodos aristas)
        
        
    
  