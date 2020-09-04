;;;; convertify.lisp

(in-package #:convertify)

(defun convertify (arg type)
  "Convert ARG to TYPE."
  (case type
    (string (stringify arg))
    (number (numberify arg))
    (character (characterify arg))
    (array (arrayify arg))
    (list (listify arg))))
