#lang racket

(define (make-sum lst)
    (cons '+ lst))

(define (get-op E) (car E))

(define (diff-constant x E)
    0)
(define (same-wrt-var v1 v2)
    (if (eq? v1 v2) 1 0))

(define (diff-sum x E)
    (make-sum (map diff (make-list (length (cdr E)) x) (cdr E))))

(define (make-product lst)
  (cons '* lst))

(define (make-expt lst)
  (cons 'expt lst))

(define (get-base E)
  (cadr E))

(define (get-power E)
  (caddr E))

(define (diff-product x E)
  (make-sum (make-product (diff x (cadr E)) (caddr E))
            (make-product (cadr E) (diff x (caddr E)))))

(define (diff-expt x E)
    (make-product (get-power E)
                  (make-product (make-expt (get-base E)
                                           (- (get-power E) 1))
                                (diff x (get-base E)))))

(define diff-dispatch
   (list (list '+ diff-sum)
         (list '* diff-product)
         (list 'expt diff-expt)))

(define (get-op-lst-from-table op table)
  (cadr (assoc op table)))

(define (diff v E)
  (cond ((number? E) (diff-constant v E))
        ((symbol? E) (same-wrt-var v E))
        (else ((get-op-lst-from-table (get-op E) diff-dispatch) v E))))