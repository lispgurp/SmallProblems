; load order: field.lisp,data-structure.lisp,calculator.lisp

;;; stream definitions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; o = output stream 
(defvar out nil)
(setf out t)


;;; processing ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(process-grades)
(defun process-grades ()
  "the 'main' method "
  (format out "This program reads exam/homework scores and reports your overall course grade ~%")
  (let* ((exam-numbers '(1))
         (exams (mapcar #'(lambda (x)
                           (let ((e (make-instance 'exam)))
                             (setf (value (label e)) x)
                             e))
                       exam-numbers)))        
    (loop for exam in exams
       do (process exam))))

;(defmethod process ((e exam))
;  (with-accessors ((l label))
;      e
;    (format out (display-string l) (value l))
;    (format out "~%")
;    (let* ((exam-selectors (get-readers e))
;           (exam-fields (mapcar #'(lambda (reader)
;                                   (funcall reader e))
;                               exam-selectors)))
;      (loop for f in (rest exam-fields)
;         do (process-field f e)))))

(defmethod process ((e exam))
  (with-accessors ((l label))
      e
    (format out (display-string l) (value l))
    (format out "~%")
    (let ((exam-selectors (get-readers e)))
      (loop for selector in (rest exam-selectors)
         do (let ((exam-field (funcall selector e))) 
              (process-field exam-field e))))))

;(funcall exam-selectors e)
; if (field == curve)
;    if(value (curve? exam)) == "Y"
;      process-field f // only process the field if the user said so
; else
;     process-field f

(defun get-readers (obj)
  "Only gets the first reader for the object"
  (let ((readers (mapcar #'(lambda (slot-def)
                               (first (sb-mop:slot-definition-readers slot-def)))
                           (sb-mop:class-direct-slots (class-of obj)))))
    readers))

;;; field processing core ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod process-field ((f field) (obj grade-object))
  (if (user-input? f)
      (prompt-for-user-input f)
      (progn
        (funcall (calc-fn f) obj)
        (display-calculation f))))

(defmethod prompt-for-user-input ((f field))
  "reads in data from the input streamed named input"
  (let ((user-prompt (make-user-prompt f)))
    (format out user-prompt)
    (let ((input-data (read)))
      (setf (value f) input-data))))

(defmethod display-calculation ((f field))
  "shows a calculation to the output stream (named: out)"
  (let ((v (format-raw-value f))
        (d (denom f))
        (output-str (display-string f)))          
    (if (is-fraction? f)
        (progn 
          (format out output-str v d) 
          (format out "~%"))
        (format out "~A ~A ~%" output-str v))))

;;; field processing helpers ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod format-raw-value ((f field))
  (if (is-decimal? f)
      (format nil "~1$" (value f))
      (format nil "~A" (value f))))

(defmethod make-user-prompt ((f field))
  (if (display-constraint? f)
      (format nil (display-string f) (make-constraint-string f))
      (display-string f)))

(defmethod make-constraint-string ((f field))
  (let* ((c (constraint f))
         (const-type (first c)))       
    (cond ((eq const-type :range)
           (format nil "(~A-~A)" (second c) (third c)))
          ((eq const-type :binary-flag)
           (format nil "(~A/~A)" (getf c :true) (getf c :false))))))
          


