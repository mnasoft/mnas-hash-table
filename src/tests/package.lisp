;;;; tests/package.lisp

(defpackage #:mnas-hash-table/tests
  (:use #:cl #:fiveam)
  (:export #:run-tests))

(in-package :mnas-hash-table/tests)

(defun run-tests () (run! 'all))

;;;;(run-tests)
