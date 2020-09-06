;;;; number.lisp

(in-package #:convertify)

(defgeneric numberify (arg)
  (:documentation
   "Turn LIST CHARACTER STRING SYMBOL NUMBER OR ARRAY into a NUMBER.
NUMBER returns itself.
CHARACTER returns digit, CHARACTER must be between 0-9.
STRING returns the number, all inputs must be between 0-9.
SYMBOL returns the number.
ARRAY returns the number with digits going from right to left. All the elements of ARRAY must be single digits as numbers, characters, or strings.
LIST returns the number with digits going from right to left."))

(defmethod numberify ((num number))
  num)

(defmethod numberify ((char character))
  (let ((result (- (char-code char) (char-code #\0))))
    (if (and (< result 10) (>= result 0))
	result
	(error "ARG is not a number between 0-9: ~A" char))))

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
