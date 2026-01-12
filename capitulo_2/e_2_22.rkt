#lang racket
;;En la primera versión, la lista queda invertida porque cada nuevo elemento se añade al frente con cons, produciendo el orden inverso.
;En el intento de corrección, Louis intercambia los argumentos de cons, pero esto es incorrecto porque el primer argumento debe ser un elemento y el segundo una lista;
;así genera una estructura no válida.
;Para arreglarlo, se puede invertir la lista al final, usar append (menos eficiente) o escribir la función de forma recursiva directa.