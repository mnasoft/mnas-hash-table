;;;; package.lisp

(defpackage #:mnas-hash-table
  (:use #:cl)
  (:export
   add-items
   to-list
   print-items
   hash-table-copy))

;;;;(declaim (optimize (space 0) (compilation-speed 0)  (speed 0) (safety 3) (debug 3)))

;;;; (declaim (optimize (compilation-speed 0) (debug 3) (safety 0) (space 0) (speed 0)))
