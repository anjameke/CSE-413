Welcome to DrRacket, version 7.0 [3m].
Language: racket, with debugging; memory limit: 128 MB.
> (lengtht '(a b c))
3
> (lengtht '())
0
> (lengtht '(a))
1
> (lengtht '((a) (b)))
2
> (lengtht2 '(a b c))
3
> (lengtht2 '())
0
> (lengtht2 '((a) (b)))
2
> (poly 0 '(1))
1
> (poly 0 '(1 2))
1
> (poly 1 '(1 2))
3
> (define (square (x))
    (* x x))
. define: not an identifier, identifier with default, or keyword for procedure argument in: (x)
> (define (square x)
    (* x x))
> (define (cube x)
    (* x x x))
> (apply-all (list sqrt square cube) 1)
'(1 1 1)
> (apply-all (list sqrt square cube) 2)
'(1.4142135623730951 4 8)
> (apply-all (list sqrt square cube) 3)
'(1.7320508075688772 9 27)
> (apply-all (list sqrt square cube) 4)
'(2 16 64)
> ((all-are positive?) '(1 2 3 4))
#t
> ((all-are positive?) '())
#f
> ((all-are even?) '())
#f
> ((all-are even?) '(1 2 3 4))
#f
> (make-expr 4 '+ 5)
'(4 + 5)
> (operator '(4 + 5))
'+
> (left-op '(4 + 5))
4
> (right-op '(4 + 5))
5
> (left-op '((6 * 3) + (5 - 2)))
'(6 * 3)
> (operator '((6 * 3) + (5 - 2)))
'+
> (right-op '((6 * 3) + (5 - 2)))
'(5 - 2)
> (preorder '(4 + 5))
'(+ 4 5)
> (preorder '((6 * 3) + (5 - 2)))
'(+ * 6 3 - 5 2)
> (inorder '(4 + 5))
'(4 + 5)
> (inorder '((6 * 3) + (5 - 2)))
'(6 * 3 + 5 - 2)
> (postorder '(4 + 5))
'(4 5 +)
> (postorder '((6 * 3) + (5 - 2)))
'(6 3 * 5 2 - +)
> (eval-tree '())
. . cadr: contract violation
  expected: (cons/c any/c pair?)
  given: '()
> (eval-tree '(4 + 5))
9
> (eval-tree '((6 * 3) + (5 - 2)))
21
> (define (plus-one)
    (lambda (num)
      (+ 1 num)))
> (define (times-three)
    (lambda (num)
      (* 3 num)))
> (eval-tree '())
0
> (map-leaves (plus-one) '(4 + 5))
'(5 + 6)
> (map-leaves (plus-one) '((6 * 3) + (5 - 2)))
'((7 * 4) + (6 - 3))
> (map-leaves (times-three) '(4 + 5))
'(12 + 15)
> (map-leaves (times-three) '((6 * 3) + (5 - 2)))
'((18 * 9) + (15 - 6))
> 