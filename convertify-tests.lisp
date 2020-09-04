;;;; convertify-tests.lisp

(defpackage :convertify-tests
  (:use :convertify :clunit :common-lisp))

(in-package :convertify-tests)

;;; universal variables
(defvar char-letter-list (list #\A #\B #\C))
(defvar letter-list (list 'A 'B 'C))
(defvar number-list (list 1 2 3))
(defvar char-number-list (list #\1 #\2 #\3))

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

;; (define-test arrayify-test
;;     (assert-equal number-array (arrayify number-array))
;;   (assert-equal letter-array (arrayify letter-array))
;;   (assert-equal char-letter-array (arrayify char-letter-array))
;;   (assert-equal char-letter-array (arrayify char-letter-list))
;;   (assert-equal number-array (arrayify number-list))

;;   (assert-equal char-letter-array (arrayify letter-list))
;;   (assert-equal char-letter-array (arrayify char-letter-list))
  
;;   (assert-equal char-number-array (arrayify number-string))
;;   (assert-equal char-letter-array (arrayify letter-string))

;;   (assert-equal number-array (arrayify num))

;;   (assert-equal number-array (arrayify number-symbol))
;;   (assert-equal char-letter-array (arrayify letter-symbol)))

;;; test listify

;; (define-test listify-test
;;     (assert-equal (listify char-letter-list) char-letter-list)
;;   (assert-equal (listify letter-list) letter-list)
;;   (assert-equal (listify number-list) number-list)

;;   (assert-equal (listify #\a) (list #\a))
;;   (assert-equal (listify 1) (list 1))
  
;;   (assert-equal (listify letter-string) char-letter-list)
;;   (assert-equal (listify number-string) char-number-list)
  
;;   (assert-equal (listify number-string) number-list)
;;   (assert-equal (listify letter-string) char-letter-list)

;;   (assert-equal (listify letter-array) letter-list)

;;   (assert-equal (listify 123) number-list))
