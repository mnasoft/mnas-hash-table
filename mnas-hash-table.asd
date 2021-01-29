;;;; mnas-hash-table.asd

(defsystem #:mnas-hash-table
  :description "System @b(mnas-hash-table) defines some functions for working with hash tables."
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :serial nil
  :in-order-to ((test-op (test-op "math/core/tests")))
;;;;  :depends-on ()  
  :components ((:module "src"
		:serial nil
                :components ((:file "mnas-hash-table")))))

(defsystem #:mnas-hash-table/docs
  :description "Зависимости для сборки документации"
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :depends-on ("mnas-hash-table"
               "mnas-package"
               "codex"
               ))
