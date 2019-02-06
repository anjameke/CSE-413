Welcome to DrRacket, version 7.1 [3m].
Language: racket, with debugging; memory limit: 512 MB.
> (red-blue)
'("red" . #<procedure>)
> ((cdr (red-blue)))
'("blue" . #<procedure>)
> ((cdr ((cdr (red-blue)))))
'("red" . #<procedure>)
> ((cdr ((cdr ((cdr (red-blue)))))))
'("blue" . #<procedure>)
> (take red-blue 0)
'()
> (take nats 0)
'()
> (take red-blue 1)
'("red")
> (take red-blue 2)
'("red" "blue")
> (take red-blue 4)
'("red" "blue" "red" "blue")
> (take nats 1)
'(1)
> (take nats 5)
'(1 2 3 4 5)
> (combm 0 0)
1
> (combm 2 0)
1
> (combm 10 2)
45
> (combm 5 3)
10
> 