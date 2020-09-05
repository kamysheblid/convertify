;;;; string.lisp

(in-package #:convertify)

(defgeneric stringify (arg))

(defmethod stringify ((str string))
  str)

(defmethod stringify ((char character))
  (format nil "~A" char))

(defmethod stringify ((lst list))
  (concatenate 'string (mapcar #'characterify lst)))

(defmethod stringify ((num number))
  (format nil "~A" num))

(defmethod stringify ((sym symbol))
  (format nil "~A" sym))

(defmethod stringify ((arr array))
  (let* ((coerced-lst (coerce arr 'list))
	 (strings-lst
	  (mapcar (lambda (elt)
		    (format nil "~A" elt)) coerced-lst)))
    (eval (array-to-stringify strings-lst))))

(defun array-to-stringify (lst)
  `(concatenate 'string ,@lst))
