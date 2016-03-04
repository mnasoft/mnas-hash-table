;;;; package.lisp

(defpackage #:mnas-hash-table
  (:use #:cl)
  (:export
   add-items
   to-list
   print-items
   hash-table-copy))

;;;;(declaim (optimize (space 0) (compilation-speed 0)  (speed 0) (safety 3) (debug 3)))
