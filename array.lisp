;;;; array.lisp

(in-package #:convertify)

(defgeneric arrayify (arg)
  (:documentation
   "Turn LIST CHARACTER STRING SYMBOL NUMBER OR ARRAY into an array.
ARRAY returns itself.
CHARACTER returns an array containing the character.
STRING returns an array containing the characters of STRING.
SYMBOL returns an array containing the characters of SYMBOL.
NUMBER returns an array containing the digits.
LIST returns an array containing the elements."))

(defmethod arrayify ((arr array))
  arr)

(defmethod arrayify ((lst list))
  (make-array (length lst) :initial-contents lst))

(defmethod arrayify ((str string))
  (arrayify (coerce str 'list)))
  ;; (let ((lst (coerce str 'list)))
  ;;   (arrayify
  ;;    (case elts-type
  ;;      (character (mapcar #'characterify lst))
  ;;      (number (mapcar #'numberify lst))
  ;;      (string (mapcar #'stringify lst))
  ;;      (otherwise lst)))))

(defmethod arrayify ((num number))
  (arrayify (mapcar #'numberify (listify (format nil "~A" num)))))

(defmethod arrayify ((sym symbol))
  (arrayify (format nil "~A" sym)))
