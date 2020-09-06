;;;; number.lisp

(in-package #:convertify)

(defgeneric numberify (arg)
  (:documentation
   "Turn LIST CHARACTER STRING SYMBOL NUMBER OR ARRAY into a NUMBER.
NUMBER returns itself.
CHARACTER returns digit.
STRING returns the number.
SYMBOL returns the number.
ARRAY/LIST returns the number with digits going from left to right, it is recursive and will return the number which is made up of the leaves of the SEQUENCE. (numberify (1 (2 (3)))) => 123

All input must contain digits between 0-9 only, or it will error."))

(defmethod numberify ((num number))
  num)

(defmethod numberify ((char character))
  (numberify (string char)))

(defmethod numberify ((str string))
  ;; parse-integer prints the number of digits, not sure how to stop
  ;; that. Will figure out later and get rid of this let block.
  (let ((result
	 (parse-integer str :junk-allowed nil)))
    result))

(defmethod numberify ((lst list))
  (numberify (stringify lst)))

(defmethod numberify ((arr array))
  (numberify (stringify arr)))

(defmethod numberify ((sym symbol))
  (numberify (format nil "~A" sym)))
