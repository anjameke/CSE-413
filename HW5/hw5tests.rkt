#lang racket
;; CSE413 19wi, Programming Languages, Homework 5

(require "hw5.rkt")

; This file uses Racket's unit-testing framework.

; Note we have provided [only] 3 tests, but you can't run them until do some of the assignment.
; You will want to add more tests.

(require rackunit)

(define tests
  (test-suite
   "Homework 5 Tests"

   (check-equal? (eval-exp (add (int 2) (int 2))) (int 4) "add simple test")

   (check-exn (lambda (x) (string=? (exn-message x) "MUPL addition applied to non-number"))
              (lambda () (eval-exp (add (int 2) (munit))))
              "add bad argument")

   (check-equal? (eval-exp (isgreater (int 1) (int 0))) (int 1) "isgreater e1 > e2 => int 1 test")

   (check-equal? (eval-exp (isgreater (int 2) (int 10))) (int 0) "isgreater e1 < e2 => int 0 test")

   (check-equal? (eval-exp (ifnz (int 0) (int 1) (int 2))) (int 2) "ifnz e1 is 0 test")
   (check-equal? (eval-exp (ifnz (int 1) (int 2) (int 3))) (int 2) "ifnz e1 is 0 test")

   (check-equal? (eval-exp (mlet "x" (int 1) (add (int 2) (var "x")))) (int 3) "mlet test")

   (check-equal? (eval-exp (call (closure '() (fun #f "x" (add (var "x") (int 1)))) (int 2))) (int 3) "call test")

   (check-equal? (eval-exp (first (apair (int 0) (int 1)))) (int 0) "first test")
   (check-equal? (eval-exp (second (apair (int 0) (int 1)))) (int 1) "second test")

   (check-equal? (eval-exp (ismunit (munit))) (int 1) "ismunit test")

   (check-equal? (racketlist->mupllist (list (int 0) (int 1))) (apair (int 0) (apair (int 1) (munit))) "racketlist->mupllist test")
    (check-equal? (mupllist->racketlist (apair (int 0) (apair (int 1) (munit)))) (list (int 0) (int 1)) "racketlist->mupllist test")

   (check-equal? (mupllist->racketlist
                  (eval-exp (call (call mupl-all-gt (int 9))
                                  (racketlist->mupllist 
                                   (list (int 10) (int 9) (int 15))))))
                 (list (int 10) (int 15))
                 "provided combined test using problems 1, 2, and 4")
   ))

(require rackunit/text-ui)
;; runs the test
(run-tests tests)