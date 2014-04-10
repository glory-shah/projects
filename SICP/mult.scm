(define (double a) (* a 2))
(define (halve a)  (/ a 2))
(define (even? a) (= (remainder a 2) 0))

(define (fast* a b)
  (cond ((or (= a 0) (= b 0)) 0)
        ((even? a) (fast* (halve a) (double b)))
        (else (+ b (fast* (- a 1) b))))) 

(define (fast-iter-* a b)
  (define (iter a b state)
    (cond ((or (= a 0) (= b 0)) state)
          ((even? a) (iter (halve a) (double b) state))
          (else (iter (- a 1) b (+ b state)))))
  (iter a b 0))