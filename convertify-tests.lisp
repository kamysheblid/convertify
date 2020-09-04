;;;; convertify-tests.lisp

(defpackage :convertify-tests
  (:use :convertify :clunit :common-lisp))

(in-package :convertify-tests)

;;; universal variables
(defvar char-letter-list (list #\A #\B #\C))
(defvar letter-list (list 'A 'B 'C))
(defvar number-list (list 1 2 3))
(defvar num-list (list 123))
(defvar char-number-list (list #\1 #\2 #\3))
(defvar char-list (list #\A))

(defvar char-letter-array #(#\A #\B #\C))
(defvar char-symbol-array #(A B C))
(defvar letter-array #(A B C))
(defvar char-number-array #(#\1 #\2 #\3))
(defvar number-array #(1 2 3))

(defvar letter-string "ABC")
(defvar number-string "123")

(defvar letter-symbol 'abc)
(defvar number-symbol '123)

(defvar num 123)
(defvar chr #\A)

;;; test arrayify

(defsuite array-suite ())

(deftest number-array->array (array-suite) (assert-equalp number-array (arrayify number-array)))
(deftest letter-array->array (array-suite) (assert-equalp letter-array (arrayify letter-array)))
(deftest char-letter-array->array (array-suite) (assert-equalp char-letter-array (arrayify char-letter-array)))
(deftest char-letter-list->array (array-suite) (assert-equalp char-letter-array (arrayify char-letter-list)))
(deftest number-list->array (array-suite) (assert-equalp number-array (arrayify number-list)))
(deftest letter-list->array (array-suite) (assert-equalp char-symbol-array (arrayify letter-list)))
(deftest char-letter-list->array (array-suite) (assert-equalp char-letter-array (arrayify char-letter-list)))
(deftest number-string->array (array-suite) (assert-equalp char-number-array (arrayify number-string)))
(deftest letter-string->array (array-suite) (assert-equalp char-letter-array (arrayify letter-string)))
(deftest num->array (array-suite) (assert-equalp number-array (arrayify num)))
(deftest number-symbol->array (array-suite) (assert-equalp number-array (arrayify number-symbol)))
(deftest letter-symbol->array (array-suite) (assert-equalp char-letter-array (arrayify letter-symbol)))

;;; test listify

(defsuite list-suite ())

(deftest  char-letter-list->list (list-suite) (assert-equalp (listify char-letter-list) char-letter-list))
(deftest  letter-list->list (list-suite) (assert-equalp (listify letter-list) letter-list))
(deftest number-list->list (list-suite) (assert-equalp (listify number-list) number-list))
(deftest char->list (list-suite) (assert-equalp (listify chr) char-list))
(deftest num->list (list-suite) (assert-equalp (listify num) number-list))
(deftest letter-string->list (list-suite) (assert-equalp (listify letter-string) char-letter-list))
(deftest number-string->list (list-suite) (assert-equalp (listify number-string) char-number-list))
(deftest letter-string->list (list-suite) (assert-equalp (listify letter-string) char-letter-list))
(deftest letter-array->list (list-suite) (assert-equalp (listify letter-array) letter-list))
