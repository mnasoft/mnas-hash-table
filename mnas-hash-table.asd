;;;; mnas-hash-table.asd

(defsystem "mnas-hash-table"
  :description
  " System @b(mnas-hash-table) defines some functions for working with
  hash tables."
  :author "Mykola Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"
  :version "0.1.0"
  :serial nil
  :in-order-to ((test-op (test-op "mnas-hash-table/tests")))
  ;; :depends-on ()  
  :components ((:module "src"
		:serial nil
                :components ((:file "mnas-hash-table")))))

(defsystem "mnas-hash-table/tests"
  :description "Тестирование систем, входящих  в проект mnas-package"
  :author "Mykola Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :depends-on ("mnas-hash-table" "fiveam")
  :perform (test-op (o s)
		    (uiop:symbol-call :mnas-hash-table/tests :run-tests))
  :components ((:module "src/tests"
		:serial nil
                :components ((:file "package")
                             (:file "all"  :depends-on ("package"))
                             (:file "main" :depends-on ("all"))
                             (:file "run"  :depends-on ("main"))
                             ))))

(defsystem "mnas-hash-table/docs"
  :description "Зависимости для сборки документации"
  :author "Mykola Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :depends-on ("mnas-hash-table"
               ;; "mnas-package"
               "codex"))
