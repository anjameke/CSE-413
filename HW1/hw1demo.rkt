Welcome to DrRacket, version 7.0 [3m].
Language: racket, with debugging; memory limit: 128 MB.
> (comb 0 0)
1
> (comb 1 0)
1
> (comb 2 1)
2
> (comb 5 2)
10
> (comb 10 3)
120
> (zip '() '())
'()
> (zip '(a) '())
'(a)
> (zip '() '(a))
'(a)
> (zip '(a b c) '())
'(a b c)
> (zip '() '(x y z))
'(x y z)
> (zip '(a b c) '(x y z))
'(a x b y c z)
> (zip '(1 2) '(w x y z))
'(1 w 2 x y z)
> (unzip '())
'()
> (unzip '(a))
'((a) ())
> (unzip '(a b))
'((a) (b))
> (unzip '(a b c))
'((a c) (b))
> (unzip '(a b c d e f))
'((a c e) (b d f))
> (unzip '(()))
'((()) ())
> (unzip '((a)))
'(((a)) ())
> (zip '(()) '())
'(())
> (expand '())
'()
> (expand '(a))
'(a)
> (expand '(a (3 b)))
'(a b b b)
> (expand '(a (3 b) (3 a) b (2 c) (3 a)))
'(a b b b a a a b c c a a a)
> (value '(1 (2 () ()) (3 () ())))
1
> (left '(1 (2 () ()) (3 () ())))
'(2 () ())
> (right '(1 (2 () ()) (3 () ())))
'(3 () ())
> (size '())
0
> (size '(1 (2 () ()) (3 () ())))
3
> (contains 1 '(1 (2 () ()) (3 () ())))
#t
> (contains 2 '(1 (2 () ()) (3 () ())))
#t
> (contains 3 '(1 (2 () ()) (3 () ())))
#t
> (contains 4 '(1 (2 () ()) (3 () ())))
#f
> (contains 2 '(1 (2 (3 () ()) (4 () ())) (5 () ())))
#t
> (contains 3 '(1 (2 (3 () ()) (4 () ())) (5 () ())))
#t
> (contains 5 '(1 (2 (3 () ()) (4 () ())) (5 () ())))
#t
> (leaves '())
'()
> (leaves '(1 (2 () ()) (3 () ())))
'(2 3)
> (leaves '(1 (2 (3 () ()) (4 () ())) (5 () ())))
'(3 4 5)
> (isBST '(1 (2 () ()) (3 () ())))
#f
> (isBST '(1 (2 (3 () ()) (4 () ())) (5 () ())))
#f
> (isBST '(2 (1 () ()) (3 () ())))
#t
> 