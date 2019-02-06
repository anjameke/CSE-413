;; Andrew Lee
;; adlee96

#lang racket
(provide (all-defined-out))

;; problem 1
(define red-blue
    (letrec ([f (lambda(x) (cons x (lambda () (f (if (equal? x "red")
                                                     "blue"
                                                     "red")))))])
      (lambda() (f "red"))))

;; problem 2
(define (take st n)
  (if (= n 0)
      '()
      (cons (car (st)) (take (cdr (st)) (- n 1)))))

;; problem 3
(define (combm x y)
    (letrec ((memo null)
             (fact (lambda (n)
                     (if (< n 2)
                         1
                         (* n (fact (- n 1))))))
             (new-ans (lambda (x y) (/ (fact x) (* (fact y) (fact (- x y))))))
             (f (lambda (x y)
                (let ((ans (assoc (list x y) memo)))
                    (if ans
                        (cdr ans)
                        (begin
                            (set! memo (cons (cons (list x y) (cons (new-ans x y) '())) memo))
                            (new-ans x y)))))))
     (f x y)))