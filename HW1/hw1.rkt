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

;; Problem 3
(define (everyotherIndex l)
    (if (null? l)
        '()
        (cons (car l)
              (if (null? (cdr l))
                  '()
                  (everyotherIndex (cddr l))))))

(define (unzip l)
    (list (everyotherIndex l) (everyotherIndex (cdr l))))






;; Problem 5a
(define (value l)
    (car l))

(define (left l)
    (cadr l))

(define (right l)
    (caddr l))

;; Problem 5b
(define (size tree)
    (if (null? tree)
        0
        (+ 1 (size (left tree)) (size (right tree)))))

;; Problem 5c
(define (contains item tree)
    (cond ((null? tree) #f)
          ((equal? item (value tree)) #t)
          (else (or (contains item (left tree)) (contains item (right tree))))))