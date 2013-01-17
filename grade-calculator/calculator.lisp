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

(defmethod process ((obj grade-object))
  (let ((obj-selectors (get-readers obj)))
	loop for selector in obj-selectors
	do (let ((afield (funcall selector obj)))
		 (process-field obj afield selector))))

(defmethod process-field ((e exam) (field-slot-def t) (f field))
  (cond ((eq field-slot-def 'label)
		 '(TODO)
		((eq field-slot-def 'curve)
		 '(TODO))
		 (t
		  (process-input-or-output-field f e)))))		 
   
	
  ;(defmethod process ((e exam))
;  (with-accessors ((l label))
;      e
;    (format out (display-string l) (value l))
;    (format out "~%")
;    (let ((exam-selectors (get-readers e)))
;      (loop for selector in (rest exam-selectors)
;         do (let ((exam-field (funcall selector e))) 
;              (if (eq selector 'curve)
;                  (when (eq (value (curve? e)) "Y")
;                    (process-field exam-field e))
;                  (process-field exam-field e)))))))

;(defmethod process ((hw homework))
;  (let ((hw-selectors (get-readers hw)))
;    (loop for selector in (hw-selectors)
;         do (let ((hw-field (funcall selector hw)))
;              (process-field hw-field hw)))))

;(defmethod process-homework-field ((hw homework) (selector t))
;  (let ((hw-field (funcall selector hw)))
	
  
  

; TODO was in the middle of generifying process
;(defun process-generic-fn (obj process-fn)
;  (let ((obj-selectors (get-readers obj)))
;    (loop for selector in (obj-selectors)
;         do (let ((actual-field (funcall selector obj)))
;              (funcall process-fn (list obj actual-field))))))


(defun get-readers (obj)
  "Only gets the first reader for the object"
  (let ((readers (mapcar #'(lambda (slot-def)
                               (first (sb-mop:slot-definition-readers slot-def)))
                           (sb-mop:class-direct-slots (class-of obj)))))
    readers))

;;; field processing core ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod input-or-output-field ((f field) (obj grade-object))
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
          
; two subproblems left
; 1. finish the calculations i/o for objects 
; 2. reprogram condition system to catch invalid input


