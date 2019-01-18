;; Andrew Lee
;; netID: adlee96

#lang racket

(provide (all-defined-out))

;; Problem 1
(define (lengtht lst)
    (lengthtaux lst 0))

(define (lengthtaux lst cnt)
    (if (null? lst)
        cnt
        (lengthtaux (cdr lst) (+ 1 cnt))))

(define (lengtht2 lst)
  (letrec ([aux (lambda (lst acc)
                  (if (null? lst)
                      acc
                      (aux (cdr lst) (+ 1 acc))))])
    (aux lst 0)))

;; Problem 2
(define (poly x coeff)
    (polyaux x coeff 0 0))

(define (polyaux x coeff acc cnt)
    (if (null? coeff)
        acc
        (polyaux x (cdr coeff) (+ acc (* (car coeff) (expt x cnt))) (+ 1 cnt))))

;; Problem 3
(define (apply-all arglst num)
    (cond ((null? arglst) '())
          (else (append (map (car arglst) (list num)) (apply-all (cdr arglst) num)))))

;; Problem 4
(define (all-are condition)
    (lambda (lst)
      (let ([filt (filter condition lst)])
      (cond ((null? filt) #f)
            ((not (eq? (length lst) (length filt))) #f)
            (else #t)))))