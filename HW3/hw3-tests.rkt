#lang racket
(require rackunit)
(require "hw3.rkt")

(check-equal? (diff 'x 4) 0 "testing diff-constant")

(check-equal? (diff 'x '(+ 1 2)) '(+ 0 0) "testing diff-sum with only constants")

(check-equal? (diff 'x '(+ x 1)) '(+ 1 0) "testing diff-sum with same variable")

(check-equal? (diff 'x '(+ y 2)) '(+ 0 0) "testing diff-sum with different variable")

(check-equal? (diff 'x '(+ x x x x)) '(+ 1 1 1 1) "testing diff-sum with same var but more than two entries")

(check-equal? (diff 'x '(* 2 1)) '(+ (* 0 1) (* 2 0)) "testing diff-product with constants")

(check-equal? (diff 'x '(* 2 x)) '(+ (* 0 x) (* 2 1)) "testing diff-product with same var")

(check-equal? (diff 'x '(* 2 y)) '(+ (* 0 y) (* 2 0)) "testing diff-product with different var")

(check-equal? (diff 'x '(+ x (* x x))) '(+ 1 (+ (* 1 x) (* x 1))) "testing nested diff-sum")

(check-equal? (diff 'x '(expt x 4)) '(* 4 (* (expt x 3) 1)) "testing diff-expt with same var")

(check-equal? (diff 'x '(expt y 4)) '(* 4 (* (expt y 3) 0)) "testing diff-expt with different var")