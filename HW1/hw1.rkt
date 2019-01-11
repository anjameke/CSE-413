;; Andrew Lee
;; NetID: adlee96

#lang racket

(provide (all-defined-out))

;; Problem 1
(define (fact n)
  (if (< n 2)
      1
      (* n (fact (- n 1)))))

(define (comb n k)
  (/ (fact n) (* (fact k) (fact (- n k)))))

;; Problem 2
(define (zip l1 l2)
  (if (null? l1) l2
      (if (null? l2) l1
      (cons (car l1) (cons (car l2) (zip (cdr l1) (cdr l2)))))))
