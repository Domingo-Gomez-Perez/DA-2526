#lang racket
(list 'a 'b 'c) ; the output is (a b c), beacuse it will returns a list with inside the 3 elements "a" "b" "c" 
(list (list 'george)) ; the output is ((george)), beacuse it will returns the elements of a list with inside another list where the only element is "george"
(cdr '((x1 x2) (y1 y2))) ; the output is ((y1 y2)), beacuse cdr returns the tail of the list
(cadr '((x1 x2) (y1 y2))) ; the output is (y1 y2), because cadr returns the second element of the list
(pair? (car '(a short list))) ; the output is #f, because car returns the first element of the list, which is 'a, and 'a is not a pair
(memq 'red '((red shoes) (blue socks))) ; the output is #f, because memq looks for the exact element in the list, and 'red is not equal to '(red shoes)
(memq 'red '(red shoes blue socks)) ; the output is (red shoes blue socks), because memq finds 'red in the list