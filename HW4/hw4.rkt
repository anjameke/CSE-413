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