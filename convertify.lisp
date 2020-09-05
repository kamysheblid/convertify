;;;; convertify.lisp

(in-package #:convertify)

(defun convertify (arg type)
  "Convert ARG to TYPE.
TYPE can be the symbol, string, character, number, array, or list.
The type of ARG can be symbol, string, character, number, array, or list.
"
  (case type
    (string (stringify arg))
    (number (numberify arg))
    (character (characterify arg))
    (array (arrayify arg))
    (list (listify arg))))
