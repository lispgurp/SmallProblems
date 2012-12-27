;c: 1.75
; *overview*
;
; this is part 2 in a continuing series to convince myself that little bitty
; problems are fun and easily doable in my favorite language, Common Lisp
;

; *problem statement*
;
; this is one of the introductory problems in Computer Science and Engineering 142 at 
; UW. In it the student has to create a command line driven application that, line by
; line defines thier grades for the quarter. See spec.pdf for more details. 

; *motivation* 
;
; basically, I have always wanted to use CL's condition system to decouple invalid input from main
; processing code. In the past I have tried to use Exceptions to do this, but the problem with
; this it's classic incarnation is that one loses to stack and cannot go back to where the error is 
; to do things differently. 
;


; *** data objects ***********************************************************************************************
; exam, homework, result

(defclass exam ()
  (
   (weight
    :accessor weight
    :initform (make-instance 'field 
                              :display-prefix "what is its weight?"
                              :constraint '(:range 0 100)))
    (score
     :accessor score
     :initform (make-instance 'field
                              :display-prefix "score earned?"
                              :constraint '(:range 0 100)))
    (curve?
     :accessor curve?
     :initform (make-instance 'field
                              :display-prefix "was there a curve?"
                              :constraint '(:constants "Y" "N")))
    (points
     :documentation "calculated internally"
     :accessor points
     :initform (make-instance 'field
                              :display-prefix "total points ="
                              :constraint '(:range 0 100)))
    (weighed-score
     :documentation "calculated internally"
     :accessor weighted-score
     :initform (make-instance 'field
                              :display-prefix "weighted Score ="
                              :constraint '(:todo)))
   ) 
)

(defclass assignment ()
  (
   (assignment-label
    :accessor name
    :initform (make-instance 'field
                             :display-prefix "Assignment"
                             :constraint '(:positive-integers)))
   (maximum-value
    :accessor maximum
    :initform (make-instance 'field
                             :display-prefix "Max:"
                             :constraint '(:positive-integers)))
   (score
    :accessor score
    :initform (make-instance 'field
                             :display-prefix "Score:"
                             :constraint '(:range 0 '(max this))))
   )
) 
   
               


(defclass homework ()
    (

     (weight
      :accessor weight
      :initform (make-instance 'field
                               :display-prefix "What is its weight?"
                               :constraint '(:range 0 100)))
     (assignments
      :documentation "collection of assignment objects, to determine at runtime"
      :accessor assignments 
      :initform nil)

     (number-of-sections
      :accessor n-sections
      :initform (make-instance 'field
                               :display-prefix "How many sections did you attend?"
                               :constraint '(:positive-integers)))
     (section-points
      :accessor section-points
      :initform (make-instance 'field
                               :display-prefix "Section Points = "
                               :constraint '(:range 0 (* (n-sections this) 5))))
     (total-points
      :accessor total-points
      :initform (make-instance 'field
                               :display-prefix "Total Points = "
                               :constraint '(:range 0 (sum (assigments max))))) ; TODO define with the calculation will be
     (weighted-score
      :accessor weighted-score
      :initform (make-instance 'field
                               :display-prefix "Weighted Score ="
                               :constraint '(:to-do)))
     )
)

(defclass result ()
  (
   (overall-percentage
      :accessor percentage
      :initform (make-instance 'field
                               :display-prefix "Overall Percentage ="
                               :constraint '(:range 0 100)))
   (field-name
      :accessor field-name
      :initform (make-instance 'field
                               :display-prefix "Your Grade Will Be At Least"
                               :constraint '(:range 0 4)))
   );end slot defs
); end defclass


; this object will capture the value, what will be printed, and the data that constrains the value
(defclass field ()
  ((raw-value
    :documentation "value of the field. Normally used directly in data structure definitions (class/struct, etc)"
    :accessor value)
   (constraint
    :documentation  "declares what the valid values are or what the range is, to be used with condition system"
    :initarg :constraint
    :accessor constraint)
   (display-prefix
    :documentation "intended to accompany display output"
    :initarg :display-prefix
    :accessor display-prefix)))
; TODO find "static" qualifier or extend MOP with :singleton     
