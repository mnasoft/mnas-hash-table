;;;; mnas-hash-table.lisp

(in-package #:cl-user)

(defpackage #:mnas-hash-table
  (:use #:cl) 
  (:export print-items
           hash-table-copy
           populate
           to-list)
  (:documentation
  " @b(Описание:) пакет @b(mnas-hash-table) определяет некоторые
  функции для работы с хеш-таблицами.

 Пакет содержит следующие применимые к хеш-таблицам функции:
@begin(list)
 @item(populate - наполнения элементами;)
 @item(to-list - преобразования в список;)
 @item(print-items - вывода элементов в поток;)
 @item(hash-table-copy - копирования.)
@end(list)"))

(in-package #:mnas-hash-table)

(defun populate (hash-table 2d-list key-index value-index)
  " @b(Описание:) функция @b(populate) добавляет в хеш-таблицу
 @b(hash-table) элементы, находящиеся в таблице @b(2d-list) в
 качестве ключей используются элементы, находящиеся в позиции
 @b(key-index) в качестве значений используются элементы, находящиеся в
 позиции @b(value-index).

 @b(Пример использования:)
@begin[lang=lisp](code)
 (print-items
 (populate (make-hash-table :test #'equal)
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
  (mapc #'(lambda (el)
	    (setf
	     (gethash (nth key-index el) hash-table)
	     (nth value-index el)))
	2d-list)
  hash-table)

(defun to-list (hash-table)
  " @b(Описание:) функция @b(to-list) возвращает 2d-список, каждый
 элемент которо содержажит ключ и значение, соответствующих элементов,
 содержащихся в хеш-таблице @b(hash-table).

 @b(Пример использования:) @begin[lang=lisp](code)
  (to-list (populate (make-hash-table) '((1 2 3)(4 5 6)(7 8 9)) 1 2))
@end(code)
"
  (let ((rez nil))
    (maphash
     #'(lambda (k v)
	 (setf rez (append rez (list(list k v)))))
     hash-table)
    rez))

(defun print-items (hash-table
		    &key
		      (stream t)
		      (field-format "~S")
		      (field-separator " ")
		      (line-separator "~%") )
  " @b(Описание:) функция @b(print-items) выводит содержимое
 хеш-таблицы @b(hash-table) в поток @b(stream).

 @b(Пример использования:)
@begin[lang=lisp](code)
 (print-items
 (populate (make-hash-table :test #'equal)
	    '((\"key_1\" \"val_1\" \"Vval_1\")
	      (\"key_2\" \"val_2\" \"Vval_2\")
	      (\"key_3\" \"val_3\" \"Vval_3\")
	      (\"key_4\" \"val_4\" \"Vval_4\"))
	    0 2))
@end(code)
"
  (format stream
          (concatenate 'string
                       "~{~{" 
		       field-format
		       field-separator
		       field-format
                       "~}"
		       line-separator
                       "~}")
	  (to-list hash-table)))

(defun hash-table-copy (hash-table)
  " @b(Описание:) функция @b(hash-table-copy) возвращает копию
 хеш-таблицы @b(hash-table).

 @b(Пример использования:)
@begin[lang=lisp](code)
  (let* ((ht-1 (populate (make-hash-table) '((1 2 3)(4 5 6)(7 8 9)) 1 2))
         (ht-2 (hash-table-copy ht-1)))
    (list (eq ht-1 ht-2)
          (equal ht-1 ht-2)
          (equalp ht-1 ht-2)
          (to-list ht-1)
          (to-list ht-2)))
@end(code)
"
  (let ((new-table (make-hash-table
                    :test (hash-table-test hash-table)
                    :size (hash-table-size hash-table))))
    (maphash #'(lambda(key value)
                 (setf (gethash key new-table) value))
             hash-table)
    new-table))

