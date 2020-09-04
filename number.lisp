;;;; number.lisp

(in-package #:convertify)

(defgeneric numberify (arg)
  (:documentation
   "Turn LIST CHARACTER STRING SYMBOL NUMBER OR ARRAY into a number.
NUMBER returns itself.
CHARACTER returns digit, CHARACTER must be a digit between 0-9.
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
  (numberify (apply #'vector
		    (mapcar #'numberify
			    (coerce str 'list)))))

(defmethod numberify ((lst list))
  (numberify (apply #'vector (mapcar #'numberify lst))))

(defmethod numberify ((arr array))
  ;; First convert everything inside the array to numbers, as they might be chars or strings, but they should all be 1 digit.
  (do ((pos 0 (incf pos))
       (len (length arr)))
      ((= pos len))
    (setf (aref arr pos)
	  (numberify
	   (let ((elt (aref arr pos)))
	     (typecase elt
	       (number elt)
	       (character (numberify elt))
	       ;; Check to make sure it is 
	       (string (if (= (length elt) 1)
			   (numberify elt)
			   (error "One of the elements of your ARR is not 1 digit: ~A" elt)))
	       (otherwise (error "I cant handle an element of type ~A: ~A" (type-of elt) elt)))))))

  ;; Finally turn the array into a number.
  (do ((pos 0 (incf pos))
       (len (length arr))
       (sum 0))
      ((= pos len) sum)
    (incf sum
	  (* (expt 10 (- len pos 1))
	     (aref arr pos)))))

(defmethod numberify ((sym symbol))
  (numberify (format nil "~A" sym)))
