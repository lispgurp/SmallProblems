; dependency field.lisp

(defclass grade-object ()
  (
   
   )
)

(defgeneric process (grade-object)) 

(defclass exam (grade-object)
  (
   (label
    :accessor label
    :initform (make-instance 'field
                             :display-string "exam ~A:~%"
                             :constraint '(:positive-integer)))

   (weight
    :accessor weight
    :initform (make-instance 'field 
                              :display-string "what is its weight (~A) ?"
                              :constraint '(:range 0 100)
                              :display-constraint? t))
    (score
     :accessor score
     :initform (make-instance 'field
                              :display-string "score earned?"
                              :constraint '(:range 0 100)))
    (curve?
     :accessor curve?
     :initform (make-instance 'field
                              :display-string "was there a curve (~A) ?"
                              :constraint '(:binary-flag :true "Y" :false "N")
                              :display-constraint? t))
   (curve
    :accessor curve
    :initform (make-instance 'field
                              :display-string "how much was the curve?"
                              :constraint '(:todo)))
     
    (points
     :accessor points
     :initform (make-instance 'field
                              :is-fraction? t
                              :user-input? nil
                              :display-string "total points = ~A / ~A ~%"
                              :constraint '(:range 0 100)))
    (weighed-score
     :accessor weighted-score
     :initform (make-instance 'field
                              :is-fraction? t
                              :is-decimal? t
                              :user-input? nil
                              :display-string "weighted score = ~A / ~A ~%"
                              :constraint '(:todo)))
   ) 
)


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
                             :constraint '(:todo)))
   )
) 
   
(defclass homework (grade-object)
    (
     (weight
      :accessor weight
      :initform (make-instance 'field
                               :display-string "what is its weight (~A) ?"
                               :constraint '(:range 0 100)
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
                               :constraint '(:todo)))
     (total-points
      :accessor total-points
      :initform (make-instance 'field
                               :is-fraction? t
                               :user-input? nil
                               :display-string "total points = ~A / ~A "
                               :constraint '(:todo)))
     (weighted-score
      :accessor weighted-score
      :initform (make-instance 'field
                               :is-fraction? t
                               :is-decimal? t
                               :user-input? nil
                               :display-string "weighted score = ~A / ~A "
                               :constraint '(:todo)))
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
