;;;; convertify.asd

(defsystem #:convertify
  :description "Converty common types to other common types"
  :author "Kamy Sheblid <kamysheblid@gmail.com>"
  :license  "GPLv3"
  :version "0.0.1"
  :components ((:file "package")
	       (:file "string" :depends-on ("package"))
	       (:file "list" :depends-on ("package"))
	       (:file "character" :depends-on ("package"))
	       (:file "number" :depends-on ("package"))
	       (:file "array" :depends-on ("package"))
               (:file "convertify"
		      :depends-on ("string"
				   "character"
				   "array"
				   "list"
				   "number"))))

(asdf:defsystem #:convertify-tests
  :description "Convertify tests"
  :author "Kamy Sheblid <kamysheblid@gmail.com>"
  :license  "GPLv3"
  :version "0.0.1"
  :depends-on (#:convertify #:clunit)
  :components ((:file "convertify-tests")))
