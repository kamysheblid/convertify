;;;; string.lisp

(in-package #:convertify)

(defgeneric stringify (arg)
  (:documentation
   "Turn LIST CHARACTER STRING SYMBOL NUMBER OR ARRAY into an STRING.
STRING returns itself.
CHARACTER returns STRING containing of the character.
ARRAY returns STRING containing the leaves as a STRING.
SYMBOL returns STRING containing the characters that make up SYMBOL.
NUMBER returns STRING containing the digits as a STRING.
LIST returns STRING containing the leaves as a STRING.

For LIST/ARRAY the flattened string is returned:
(stringify '(1 (23 (4)) 5)) => \"12345\""))

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
