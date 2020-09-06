;;;; string.lisp

(in-package #:convertify)

(defgeneric stringify (arg))

(defmethod stringify ((str string)) str)

(defmethod stringify ((char character))
  (format nil "~A" char))

(defmethod stringify ((lst list))
  (if (null lst)
      ""
      (concatenate 'string
		   (stringify (car lst))
		   (stringify (cdr lst)))))

(defmethod stringify ((lst null)) "")

(defmethod stringify ((num number))
  (format nil "~A" num))

(defmethod stringify ((sym symbol))
  (format nil "~A" sym))

(defmethod stringify ((arr array))
  (stringify (listify arr)))
