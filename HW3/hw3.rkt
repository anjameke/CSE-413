(define (get-op E) (car E))

(define (diff-constant x E)
    0)
(define (same-wrt-var v1 v2)
    (if (eq? v1 v2) 1 0))

(define (diff-sum x E)
    (make-lst (diff x (cadr E)) (diff x (caddr E))))

(define (make-lst lst1 lst2)
    (list '+ lst1 lst2))

(define diff-dispatch
   (list (list '+ diff-sum)))

(define (get-op-lst-from-table op table)
  (cadr (assoc op table)))

(define (diff v E)
  (cond ((number? E) (diff-constant v E))
        ((symbol? E) (same-wrt-var v E))
        (else ((get-op-lst-from-table (get-op E) diff-dispatch) v E))))