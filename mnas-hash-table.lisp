;;;; mnas-hash-table.lisp

(in-package #:mnas-hash-table)

;;; "mnas-hash-table" goes here. Hacks and glory await!

(defun add-items(hash-table table-items key-index value-index)
  "Добавляет в hash-table элементы, находящиеся в таблице table-items
в качестве ключей используются элементы, находящиеся в позиции key-index
в качестве значений испоользуются элементы, находящиеся в позиции value-index
;;;;
Пример использования:
(print-items
 (add-items (make-hash-table :test #'equal)
	    '((\"key_1\" \"val_1\" \"Vval_1\")
	      (\"key_2\" \"val_2\" \"Vval_2\")
	      (\"key_3\" \"val_3\" \"Vval_3\")
	      (\"key_4\" \"val_4\" \"Vval_4\"))
	    0 2))
"
  (mapc #'(lambda (el)
	    (setf
	     (gethash (nth key-index el) hash-table)
	     (nth value-index el)))
	table-items)
  hash-table)

(defun print-items(hash-table
		   &key
		     (out t)
		     (field-format "~S")
		     (field-separator " ")
		     (line-separator "~%") )
  ""
  (maphash #'(lambda (k v)
	       (format out
		       (concatenate 'string
				    field-format
				    field-separator
				    field-format
				    line-separator) k v))
	   hash-table))

(defun to-list(hash-table)
  "Выполняет преобразование hash-table в список
;;;;
Пример использования:
(to-list (add-items (make-hash-table) '((1 2 3)(4 5 6)(7 8 9)) 1 2))
"
  (let ((rez nil))
    (maphash
     #'(lambda (k v)
	 (setf rez (append rez (list(list k v)))))
     hash-table)
    rez))

(defun hash-table-copy (table)
  "Создает копию хеш-таблицы"
  (let ((new-table (make-hash-table
                    :test (hash-table-test table)
                    :size (hash-table-size table))))
    (maphash #'(lambda(key value)
                 (setf (gethash key new-table) value))
             table)
    new-table)) 

