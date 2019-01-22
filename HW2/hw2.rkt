;; Andrew Lee
;; netID: adlee96

#lang racket

(provide (all-defined-out))

;; PART II

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

;; PART III

;; problem 1
(define (make-expr left-op operator right-op)
    (list left-op operator right-op))

(define (operator exprlst)
        (cadr exprlst))

(define (left-op exprlst)
      (car exprlst))

(define (right-op exprlst)
      (caddr exprlst))


(define (preorder expr-tree)
    (cond ((null? expr-tree) '())
          ((and (number? (left-op expr-tree)) (number? (right-op expr-tree)))
            (flatten (append (list (operator expr-tree)
                                   (left-op expr-tree)
                                   (right-op expr-tree)))))
           ((and (number? (left-op expr-tree)) (not (number? (right-op expr-tree))))
            (flatten (append (list (operator expr-tree)
                                   (left-op expr-tree)
                                   (preorder (right-op expr-tree))))))
           ((and (number? (right-op expr-tree)) (not (number? (right-op expr-tree))))
            (flatten (append (list (operator expr-tree)
                                   (preorder (left-op expr-tree))
                                   (right-op expr-tree)))))
           ((and (not (number? (left-op expr-tree))) (not (number? (right-op expr-tree))))
            (flatten (append (list (operator expr-tree)
                                   (preorder (left-op expr-tree))
                                   (preorder (right-op expr-tree))))))))

(define (inorder expr-tree)
    (cond ((null? expr-tree) '())
          ((and (number? (left-op expr-tree)) (number? (right-op expr-tree)))
            (flatten (append (list (left-op expr-tree))
                             (list (operator expr-tree))
                             (list (right-op expr-tree)))))
           ((and (number? (left-op expr-tree)) (not (number? (right-op expr-tree))))
            (flatten (append (list (left-op expr-tree))
                             (list (operator expr-tree))
                             (list (inorder (right-op expr-tree))))))
           ((and (number? (right-op expr-tree)) (not (number? (right-op expr-tree))))
            (flatten (append (list (inorder (left-op expr-tree)))
                             (list (operator expr-tree)
                             (list (right-op expr-tree))))))
           ((and (not (number? (left-op expr-tree))) (not (number? (right-op expr-tree))))
            (flatten (append (list (inorder (left-op expr-tree)))
                             (list (operator expr-tree)
                             (list (inorder (right-op expr-tree)))))))))

(define (postorder expr-tree)
    (cond ((null? expr-tree) '())
          ((and (number? (left-op expr-tree)) (number? (right-op expr-tree)))
            (flatten (append (list (left-op expr-tree)
                             (right-op expr-tree)
                             (operator expr-tree)))))
           ((and (number? (left-op expr-tree)) (not (number? (right-op expr-tree))))
            (flatten (append (list (left-op expr-tree)
                             (postorder (right-op expr-tree))
                             (operator expr-tree)))))
           ((and (number? (right-op expr-tree)) (not (number? (right-op expr-tree))))
            (flatten (append (list (postorder (left-op expr-tree))
                             (right-op expr-tree)
                             (operator expr-tree)))))
           ((and (not (number? (left-op expr-tree))) (not (number? (right-op expr-tree))))
            (flatten (append (list (postorder (left-op expr-tree))
                             (postorder (right-op expr-tree))
                             (operator expr-tree)))))))                                  