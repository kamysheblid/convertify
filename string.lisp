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
  nil)

(defun array-to-stringify (arr)
  (declare (array arr))
  (let ((lst (coerce arr 'list)))
    (apply #'concatenate
	   (mapcar
	    (lambda (num)
	      (format nil "~A" num))))))
