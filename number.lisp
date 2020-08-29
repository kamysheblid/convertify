;;;; conversions.lisp

(in-package #:conversions)

(defun convert (arg type)
  "Convert ARG to TYPE."
  nil)

(defgeneric number (arg))
(defmethod number ((char character))
  (let ((result (- (char-code char) (char-code #\0))))
    (if (and (< result 10) (>= result 0))
	result
	(error "ARG is not a number between 0-9: ~A" char))))

(defmethod number ((str string))
  (to-number (apply #'vector
		    (mapcar #'to-number
			    (coerce arg 'list)))))

(defmethod number ((arr array))
  (do ((pos 0 (incf pos))
       (len (length arr))
       (sum 0))
      ((= pos len) sum)
    (incf sum
	  (* (expt 10 (- len pos 1))
	     (aref arr pos)))))



(defun array-to-string (arr)
  (declare (array arr))
  (let ((lst (coerce arr 'list)))
    (apply #'concatenate
	   (mapcar
	    (lambda (num)
	      (format nil "~A" num))))))

