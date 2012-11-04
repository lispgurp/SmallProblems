; This program will account for all three types of repeating poems

(defpackage :com.lispgurp.repeating-poem
  (:use :common-lisp)
  (:export :setup-repeating-verse
		   :write-repeating-poem))		   

; State that defines each poem ;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar n-verses)
(defvar opening-lines)
(defvar repeating-block)
(defvar ending-lines)

(defun write-repeating-poem (&optional (s t))
  (dolist (ln (build-repeating-poem))
	(if (not (equal ln ""))
		(format s (if (equal ln #\newline)
					"~A"
					"~A~%")
				ln))))

(defun build-repeating-poem ()
  (loop for i from 0 to (- n-verses 1)
	 append
	   (if (equal 'SUBVERT (first (elt opening-lines i)))
		   (append 
			(rest (elt opening-lines i))'(#\newline))
		   (append 
			(elt opening-lines i)
			(make-block repeating-block i)
			ending-lines
			'(#\newline)))))

(defun make-block (whole-block block-pos)
  (loop for i from block-pos downTo 0
	   collect (elt whole-block i)))


(defun setup-repeating-verse (&key nverses openinglines repeatingblock endinglines)
  (setf n-verses nverses)
  (setf opening-lines openinglines)
  (setf repeating-block repeatingblock)
  (setf ending-lines endinglines))

