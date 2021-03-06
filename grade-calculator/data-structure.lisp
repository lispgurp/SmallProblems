; dependency field.lisp

(defclass grade-object ()
  (
   
   )
)

(defgeneric process (grade-object)) 
(defgeneric process-field (grade-object t field))

(defclass exam (grade-object)
  (
   (label
    :accessor label
    :initform (make-instance 'field
                             :display-string "Exam ~A:"
                             :constraint '(:positive-integer)))

   (weight
    :accessor weight
    :initform (make-instance 'field 
                              :display-string "What is its weight ~A?"
                              :constraint '(:range 0 100)
                              :display-constraint? t))
    (score
     :accessor score
     :initform (make-instance 'field
                              :display-string "Score earned?"
                              :constraint '(:range 0 100)))
    (curve?
     :accessor curve?
     :initform (make-instance 'field
                              :display-string "Was there a curve ~A ?"
                              :constraint '(:binary-flag nil :true "Y" :false "N")
                              :display-constraint? t))
   (curve
    :accessor curve
    :initform (make-instance 'field
                             :display-string "How much was the curve?"
                             :constraint '(:range 0 100)))
     
    (total-points
     :accessor total-pts
     :initform (make-instance 'field
                              :is-fraction? t
                              :user-input? nil
                              :display-string "Total points = ~A / ~A"
                              :constraint '(:range 0 100)
                              :calc-fn #'calculate-exam-total-points!))
    (weighed-score
     :accessor weighted-score
     :initform (make-instance 'field
                              :is-fraction? t
                              :is-decimal? t
                              :user-input? nil
                              :display-string "Weighted score = ~A / ~A"
                              :constraint '(:range 0 100)
                              :calc-fn #'calculate-exam-weighted-score!))
   ) 
)
; exam calculations
; 1. exam total = 
;  value =
;    if(curve?)
;      score + curve round down to (constraint upper-bound)
;    else
;      score
;  denom = 100 // TODO: (constraint upper-bound)
;    
; 2. exam weighted-score =
;   value = 
;     (exam total value) / (exam total denom) * (exam weight)
;   denom = (exam weight)  
;

;TODO 100 = (constraint upper-bound)
(defun calculate-exam-total-points! (exam)
  "sets the numerator and denominator of total-points of exam object"
  (setf (value (total-pts exam))
        (if (value (curve? exam))
            (let ((raw-curved-value
                   (+ (value (score exam))
                      (value (curve exam)))))
              (if (>= (floor raw-curved-value 100) 1)
                  100
                  raw-curved-value))
            (value (score exam))))
  (setf (denom (total-pts exam))
        100))
           
(defun calculate-exam-weighted-score! (exam)
  "sets the numerator and denominator of weighted-score of exam object"
  (setf (value (weighted-score exam))
        (* (value (weight exam))
           (/ (value (total-pts exam))
              (denom (total-pts exam)))))
  (setf (denom (weighted-score exam))
        (value (weight exam))))

(defclass assignment (grade-object)
  (
   (assignment-label
    :accessor name
    :initform (make-instance 'field
                             :display-string "assignment ~A:"
                             :constraint '(:positive-integer)
                             :display-constraint? t))
   (maximum-value
    :accessor maximum
    :initform (make-instance 'field
                             :display-string "max:"
                             :constraint '(:positive-integer)))
   (score
    :accessor score
    :initform (make-instance 'field
                             :display-string "score:"
                             :constraint '(:range 0 100)))
   )
) 
   
(defclass homework (grade-object)
    (
     (weight
      :accessor weight
      :initform (make-instance 'field
                               :display-string "what is its weight ~A ?"
                               :constraint '(:range 0 50)
                               :display-constraint? t))
     (assignments
      :documentation "collection of assignment objects, to determine at runtime"
      :accessor assignments 
      :initform nil)

     (number-of-sections
      :accessor n-sections
      :initform (make-instance 'field
                               :display-string "how many sections did you attend?"
                               :constraint '(:positive-integer)))
     (section-points
      :accessor section-points
      :initform (make-instance 'field
                               :is-fraction? t
                               :user-input? nil
                               :display-string "section points = ~A / ~A "
                               :constraint '(:range 0 50)))
     (total-points
      :accessor total-points
      :initform (make-instance 'field
                               :is-fraction? t
                               :user-input? nil
                               :display-string "total points = ~A / ~A "
                               :constraint '(:positive-integer)))
     (weighted-score
      :accessor weighted-score
      :initform (make-instance 'field
                               :is-fraction? t
                               :is-decimal? t
                               :user-input? nil
                               :display-string "weighted score = ~A / ~A "
                               :constraint '(:positive-integer)))
     )
)

(defclass result (grade-object)
  (
   (overall-percentage
    :accessor overall-percentage
    :initform (make-instance 'field
                             :display-string "overall percentage ="
                             :is-decimal? t
                             :user-input? nil
                             :constraint '(:range 0 100)))
   (grade
    :accessor grade
    :initform (make-instance 'field
                             :display-string "your grade will be at least:"
                             :is-decimal? t
                             :user-input? nil
                             :constraint '(:range 0 4)))
   )
)
