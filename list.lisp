;;;; list.lisp

(in-package #:convertify)

(defgeneric listify (arg)
  (:documentation
   "Turn LIST CHARACTER STRING SYMBOL NUMBER or ARRAY into a list.
A LIST returns itself.
A CHARACTER will return character in a list.
A STRING will return a list of character.
A SYMBOL will return a list of characters, unless symbol is made of numbers in which case it returns a list of numbers.
A NUMBER will return a list of the digits of the numbers.
An ARRAY will return a list of the array elements as list."))

(defmethod listify ((lst list))
  lst)

(defmethod listify ((char character))
  (list char))

(defmethod listify ((str string))
  (coerce str 'list))

(defmethod listify ((sym symbol))
  (listify (format nil "~A" sym)))

(defmethod listify ((num number))
  (mapcar #'numberify (listify (format nil "~A" num))))

(defmethod listify ((arr array))
  (coerce arr 'list))
