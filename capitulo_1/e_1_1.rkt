#lang racket
10 ;10 is the result, it is a primitive object

(+ 5 3 4) ;The sum procedure is evaluated with 3 arguments, the result is 5+3+4=12

(- 9 1) ;The substraction procedure is evaluated with 2 arguments 9-1=8

(/ 6 2) ;The division procedure is evaluated 6/2=3

(+ (* 2 4) (- 4 6)) ;The sum procedure is evaluated with 2 arguments. This 2 arguments are evaluated as a multiplication 2*4=8 and a substraction 4-6=-2. The final result is the sum 8+(-2)=6

(define a 3) ;3 is the value asigned to a

(define b (+ a 1));The sum a + 1 is evaluated and asigned to b = 4

(+ a b (* a b)) ;The sum of 3 arguments is evaluated, a=3 b=4 and the multiplication of a*b=12. So the result is 3+4+12=19 

(= a b) ;It is evaluated whether a equals b, as 3!=4 the result is #f (false)

(if (and (> b a) (< b (* a b)))
    b
    a) ;An if conditional is evaluated here. The condition is an AND procedure. The AND evaluates the first argument b>a, as 4>3 this is #t, so the second argument is evaluated. a*b is evaluated as 12, with the < procedure, it is evaluated
;whether b<12 which is #t as well. So the result is b=4 as the condition of the if was true.
    
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25)) ;a is not equal to 4, so the result is not 6 and we move on to the next option. b is equal to 4 so the result is the sum of 6+7+a=16. The else is not evaluated
      
(+ 2 (if (> b a) b a)) ;There is a sum with 2 arguments, 2 and another evaluated with the if. As b>4 is #t, the result is b. So the sum is 2+b=6 which is displayed in the console

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1)) ;a>b is #f, a<b is #t so the result of the conditional is b. The multiplication is evaluated then between b=4 and the sum of a+1=4 as well. So the final result is 4*4=16