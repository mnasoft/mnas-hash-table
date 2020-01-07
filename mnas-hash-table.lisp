;;;; mnas-hash-table.lisp

(in-package #:cl-user)

(defpackage #:mnas-hash-table
  (:use #:cl ))

;;;;(declaim (optimize (compilation-speed 0) (debug 3) (safety 0) (space 0) (speed 0)))

(in-package #:mnas-hash-table)

(annot:enable-annot-syntax)

@export
@annot.doc:doc
"@b(Описание:) add-items добавляет в hash-table элементы, находящиеся в таблице table-items
в качестве ключей используются элементы, находящиеся в позиции key-index
в качестве значений испоользуются элементы, находящиеся в позиции value-index.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (print-items
 (add-items (make-hash-table :test #'equal)
	    '((\"key_1\" \"val_1\" \"Vval_1\")
	      (\"key_2\" \"val_2\" \"Vval_2\")
	      (\"key_3\" \"val_3\" \"Vval_3\")
	      (\"key_4\" \"val_4\" \"Vval_4\"))
	    0 2)) => 
 \"key_1\" \"Vval_1\"
 \"key_2\" \"Vval_2\"
 \"key_3\" \"Vval_3\"
 \"key_4\" \"Vval_4\"
@end(code)
"
(defun add-items (hash-table table-items key-index value-index)
  
  (mapc #'(lambda (el)
	    (setf
	     (gethash (nth key-index el) hash-table)
	     (nth value-index el)))
	table-items)
  hash-table)

@export
@annot.doc:doc
"@b(Описание:) print-items выводит содержимое хеш-таблицы hash-table
в поток out.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (print-items
 (add-items (make-hash-table :test #'equal)
	    '((\"key_1\" \"val_1\" \"Vval_1\")
	      (\"key_2\" \"val_2\" \"Vval_2\")
	      (\"key_3\" \"val_3\" \"Vval_3\")
	      (\"key_4\" \"val_4\" \"Vval_4\"))
	    0 2))
@end(code)
"
(defun print-items (hash-table
		    &key
		      (out t)
		      (field-format "~S")
		      (field-separator " ")
		      (line-separator "~%") )

  (maphash
   #'(lambda (k v)
       (format out
	       (concatenate 'string
			    field-format
			    field-separator
			    field-format
			    line-separator)
	       k v))
   hash-table))

@export
@annot.doc:doc
"@b(Описание:) to-list преобразует hash-table в список.

 @b(Пример использования:)
@begin[lang=lisp](code)
  (to-list 
   (add-items (make-hash-table)
	      '((1 2 3)(4 5 6)(7 8 9)) 1 2))
@end(code)
"
(defun to-list (hash-table)

  (let ((rez nil))
    (maphash
     #'(lambda (k v)
	 (setf rez (append rez (list(list k v)))))
     hash-table)
    rez))

@export
@annot.doc:doc
"@b(Описание:) Создает копию хеш-таблицы."
(defun hash-table-copy (table)
  
  (let ((new-table (make-hash-table
                    :test (hash-table-test table)
                    :size (hash-table-size table))))
    (maphash #'(lambda(key value)
                 (setf (gethash key new-table) value))
             table)
    new-table))
