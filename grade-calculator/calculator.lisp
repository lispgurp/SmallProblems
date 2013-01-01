; load order: field.lisp,data-structure.lisp,calculator.lisp

;;; stream definitions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; o = output stream 
; input = input stream
(defvar o nil)
(defvar input nil)
(setf o t)
(setf input t)

;;; processing ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun process-grades ()
  "the 'main' method "
  (format o "This program reads exam/homework scores and reports your overall course grade ~%")
  (let* ((exam-numbers '(1 2))
         (exams (mapcar #'(lambda (x)
                           (let ((e (make-instance 'exam)))
                             (setf (value (label e)) x)
                             e))
                       exam-numbers)))        
    (loop for exam in exams
       do (process exam))))

(defmethod process ((e exam))
  (with-accessors ((l label))
      e
    (format o (display-string l) (value l))))

;(first (sb-mop:class-direct-slots (class-of e)))
;(mapcar #'sb-mop:slot-definition-name (sb-mop:class-slots (class-of object)))

(defun get-readers (o)
  "Only gets the first reader for the object"
  (let ((readers (mapcar #'(lambda (slot-def)
                               (first (sb-mop:slot-definition-readers slot-def)))
                           (sb-mop:class-direct-slots (class-of o)))))
    readers))

;;; field processing ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod process-field ((f field))
  (if (user-input? f)
      (prompt-for-user-input f)
      (display-calculation f)))

(defmethod prompt-for-user-input ((f field))
  "reads in data from the input streamed named input"
  (let ((user-prompt (make-user-prompt f)))
    (format input user-prompt)
    (let ((hopefully-atom-integer (read)))
      (format t "TODO: riya says, daddy process it, just process it"))))

(defmethod display-calculation ((f field))
  "shows a calculation to the output stream (named: o)"
  (let ((v (format-raw-value f))
        (d (denom f))
        (output-str (display-string f)))          
    (if (is-fraction? f)
        (format o output-str v d)
        (format o "~A ~A" output-str v))))


;;; field processing helpers ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod format-raw-value ((f field))
  (if (is-decimal? f)
      (format o "~1$" (value f))
      (format o "~A" (value f))))


(defmethod make-user-prompt ((f field))
  (if (display-constraint? f)
      (format nil (display-string f) (make-constraint-string (constraint f)))
      (display-string f)))

(defun make-constraint-string (constraint)
  "TODO: define this function"
  (format nil "~A" constraint))

