;;;; array.lisp

(in-package #:convertify)

(defgeneric arrayify (arg)
  (:documentation
   "Turn LIST CHARACTER STRING SYMBOL NUMBER OR ARRAY into an ARRAY.
ARRAY returns itself.
CHARACTER returns ARRAY containing the character.
STRING returns ARRAY containing the characters of STRING.
SYMBOL returns ARRAY containing the characters of SYMBOL.
NUMBER returns ARRAY containing the digits.
LIST returns ARRAY containing the elements."))

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
