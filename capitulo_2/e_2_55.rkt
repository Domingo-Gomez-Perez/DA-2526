#lang racket 
(car ''abracadabra) 
; the output is 'abracadabra, because ''abracadabra is equivalent to (quote (quote abracadabra)), 
; and car returns the first element, which is (quote abracadabra)