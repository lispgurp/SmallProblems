; load order: field.lisp,data-structure.lisp,calculator.lisp

;;; stream definitions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; o = output stream 
(defvar o nil)
(setf o t)


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
    (format o (display-string l) (value l))
    (format o "~%")
    (let ((exam-selectors (get-readers e))
          (exam-fields (mapcar #'(lambda (reader)
                                   (funcall reader e))
                               exam-selectors)))
      (loop for f in fields
           (process-field f)))))


(defun get-readers (o)
  "Only gets the first reader for the object"
  (let ((readers (mapcar #'(lambda (slot-def)
                               (first (sb-mop:slot-definition-readers slot-def)))
                           (sb-mop:class-direct-slots (class-of o)))))
    readers))

;;; field processing core ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod process-field ((f field))
  (if (user-input? f)
      (prompt-for-user-input f)
      (display-calculation f)))

(defmethod prompt-for-user-input ((f field))
  "reads in data from the input streamed named input"
  (let ((user-prompt (make-user-prompt f)))
    (format o user-prompt)
    (let ((input-data (read)))
      (setf (value f) input-data)
      (format o "~%"))))

(defmethod display-calculation ((f field))
  "shows a calculation to the output stream (named: o)"
  (let ((v (format-raw-value f))
        (d (denom f))
        (output-str (display-string f)))          
    (if (is-fraction? f)
        (format o output-str v d)
        (format o "~A ~A ~%" output-str v))))

;;; field processing helpers ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod format-raw-value ((f field))
  (if (is-decimal? f)
      (format o "~1$" (value f))
      (format o "~A" (value f))))

(defmethod make-user-prompt ((f field))
  (if (display-constraint? f)
      (format nil (display-string f) (make-constraint-string f))
      (display-string f)))

(defmethod make-constraint-string ((f field))
  (let ((constraint (constraint f))
        (const-type (first (constraint f))))        
    (cond ((eq const-type :range)
           (format nil "(~A-~A)" (second constraint) (third constraint)))
          ((eq const-type :binary-flag)
           (format nil "(~A/~A)" (getf :true) (getf :false)))
          


