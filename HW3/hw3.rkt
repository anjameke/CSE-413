(define (get-op E) (car E))

(define (diff-sum x E)
    (list '+ (diff x (cadr E)) (diff x (caddr E))))

(define diff-dispatch
   (list (list '+ diff-sum)))

(define (get-op-lst-from-table op table)
  (cadr (assoc op table)))

(define (diff v E)
  (cond ((number? E) 0)
        ((symbol? E)
         (if (eq? v E) 1 0))
        (else ((get-op-lst-from-table (get-op E) diff-dispatch) v E))))