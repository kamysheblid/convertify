;;;; character.lisp

(in-package #:convertify)

(defgeneric characterify (arg)
  (:documentation
   "Turn LIST CHARACTER STRING SYMBOL NUMBER OR ARRAY into a character or characters.
CHARACTER returns itself.
ARRAY returns an array containing the characters. It is recursive, so if one element of ARRAY is 123, it will become a list of characters.
STRING returns a list containing the characters of STRING.
SYMBOL returns a list containing the characters of SYMBOL.
NUMBER returns a list containing the digits as characters.
LIST returns an array containing the elements as characters. It is recursive, so if one element of LIST is \"asd\" then it will become a list of characters."))

(defmethod characterify ((ch character))
  ch)

(defmethod characterify ((str string))
  (if (= (length str) 1)
      (character str)
      (coerce str 'list)))

(defmethod characterify ((sym symbol))
  (characterify (format nil "~A" sym)))

(defmethod characterify ((num number))
  (if (< (abs num) 10)
      (code-char (+ num (char-code #\0)))
      (coerce (format nil "~A" num) 'list)))

(defmethod characterify ((lst list))
  (mapcar #'characterify lst))

(defmethod characterify ((arr array))
  (do* ((tmp (list))
	(len (length arr))
	(pos (1- len) (decf pos)))
      ((< pos 0) (apply #'vector tmp))
    (push (characterify (aref arr pos)) tmp)))
