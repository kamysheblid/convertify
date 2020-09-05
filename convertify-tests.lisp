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

;;; test stringify

(defsuite string-suite ())

(deftest letter-string->string (string-suite) (assert-equalp (stringify letter-string) letter-string))
(deftest number-string->string (string-suite) (assert-equalp (stringify number-string) number-string))
(deftest chr->string (string-suite) (assert-equalp (stringify chr) (string chr)))
(deftest char-letter-list->string (string-suite) (assert-equalp (stringify char-letter-list) letter-string))
(deftest char-symbol-array->string (string-suite) (assert-equalp (stringify char-symbol-array) letter-string))
(deftest letter-array->string (string-suite) (assert-equalp (stringify letter-array) letter-string))
(deftest char-number-array->string (string-suite) (assert-equalp (stringify char-number-array) number-string))
(deftest number-array->string (string-suite) (assert-equalp (stringify number-array) number-string))
(deftest num->string (string-suite) (assert-equalp (stringify num) number-string))
(deftest number-symbol->string (string-suite) (assert-equalp (stringify number-symbol) number-string))
(deftest letter-symbol->string (string-suite) (assert-equalp (stringify letter-symbol) letter-string))

(defsuite character-suite ())

(deftest chr->character (character-suite) (assert-equalp (characterify chr) chr))
(deftest char-list->character (character-suite) (assert-equalp (characterify char-list) character-list))
(deftest letter-string->character (character-suite) (assert-equalp (characterify letter-string) char-letter-list))
(deftest number-string->character (character-suite) (assert-equalp (characterify number-string) char-number-list))
(deftest letter-symbol->character (character-suite) (assert-equalp (characterify letter-symbol) char-letter-list))
(deftest number-symbol->character (character-suite) (assert-equalp (characterify number-symbol) char-number-list))
(deftest num->character (character-suite) (assert-equalp (characterify num) char-number-list))
(deftest char-letter-list->character (character-suite) (assert-equalp (characterify char-letter-list) char-letter-list))
(deftest letter-list->character (character-suite) (assert-equalp (characterify letter-list) char-letter-list))
(deftest number-list->character (character-suite) (assert-equalp (characterify number-list) char-number-list))
(deftest num-list->character (character-suite) (assert-equalp (characterify num-list) (list char-number-list)))
(deftest char-number-list->character (character-suite) (assert-equalp (characterify char-number-list) char-number-list))
(deftest char-list->character (character-suite) (assert-equalp (characterify char-list) char-list))
(deftest char-letter-array->character (character-suite) (assert-equalp (characterify char-letter-array) char-letter-list))
(deftest char-symbol-array->character (character-suite) (assert-equalp (characterify char-symbol-array) char-letter-list))
(deftest char-number-array->character (character-suite) (assert-equalp (characterify char-number-array) char-number-list))
(deftest number-array->character (character-suite) (assert-equalp (characterify number-array) char-number-list))

