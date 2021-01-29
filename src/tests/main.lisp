;;;; ./src/tests/main.lisp

(in-package :mnas-hash-table/tests)

(def-suite main
  :description "Мастер-набор всех тестов проекта mnas-hash-table."
  :in all)

(in-suite main)

(def-test test ()
  (let* ((lst '(("key_1" "val_1" "Vval_1")
	        ("key_2" "val_2" "Vval_2")
	        ("key_3" "val_3" "Vval_3")
	        ("key_4" "val_4" "Vval_4")))
         (ht-1 (make-hash-table :test #'equal))
         (ht-2 (make-hash-table :test #'equal)))
    (mnas-hash-table:populate ht-1 lst 0 2)
    (mnas-hash-table:populate ht-2 lst 1 0)
    (is-true (= 4 (hash-table-count ht-1) (hash-table-count ht-2)))
    (is-true (equalp
              '(("key_1" "Vval_1") ("key_2" "Vval_2") ("key_3" "Vval_3") ("key_4" "Vval_4"))
              (mnas-hash-table:to-list ht-1)))
    (is-true (equalp
              '(("val_1" "key_1") ("val_2" "key_2") ("val_3" "key_3") ("val_4" "key_4"))
              (mnas-hash-table:to-list ht-2)))
    (is-true  (equalp ht-1 (mnas-hash-table:hash-table-copy ht-1)))
    (is-false (equalp ht-2 (mnas-hash-table:hash-table-copy ht-1)))
    (is-true  (string= (mnas-hash-table:print-items ht-1 :stream nil :field-format "~A")
"key_1 Vval_1
key_2 Vval_2
key_3 Vval_3
key_4 Vval_4
"))))
