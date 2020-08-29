;;;; conversions.lisp

(in-package #:conversions)

(defgeneric string (arg))

(defmethod string ((
(defun array-to-string (arr)
  (declare (array arr))
  (let ((lst (coerce arr 'list)))
    (apply #'concatenate
	   (mapcar
	    (lambda (num)
	      (format nil "~A" num))))))

