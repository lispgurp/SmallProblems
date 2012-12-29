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
; 1.75,2.75,3.5,6.5

(defvar *intro-display* nil)
(setf *intro-display* "This program reads exam/homework scores and reports your overall course grade")

(defclass grade-object ()
  (
   
   )
)

(defgeneric process-user-input (grade-o)) 

(defclass exam (grade-object)
  (
   (label
    :accessor label
    :initform (make-instance 'field
                             :display-string "exam ~A:"
                             :constraint '(:positive-integer)
                             :display-constraint? t))

   (weight
    :accessor weight
    :initform (make-instance 'field 
                              :display-string "what is its weight ~A ?"
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
                              :display-string "was there a curve ~A ?"
                              :constraint '(:constants "Y" "N")
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
                              :display-string "total points = ~A / ~A"
                              :constraint '(:range 0 100)))
    (weighed-score
     :accessor weighted-score
     :initform (make-instance 'field
                              :is-fraction? t
                              :is-decimal? t
                              :user-input? nil
                              :display-string "weighted score = ~A / ~A"
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
                               :display-string "what is its weight ~A ?"
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

; encapsulates the field for the sake of constraint processing 
(defclass field ()
  (
   (raw-value
    :documentation "value of the field. Normally used directly in data structure definitions (class/struct, etc)"
    :accessor value)
   (constraint
    :documentation  "declares what the valid values are or what the range is, to be used with condition system"
    :initarg :constraint
    :accessor constraint)
   (display-constraint?
    :documentation "if t, indicates whether it should plug a single constraint into display-string"
    :initarg :display-constraint?
    :accessor display-constraint?
    :initform nil)
   (display-string
    :documentation "intended to accompany display output"
    :initarg :display-string
    :accessor display-string)
   (is-fraction?
    :documentation "if t, plugs value as numerator and denom into display-string"
    :accessor is-fraction?
    :initarg :is-fraction?
    :initform nil)
   (denominator
    :documentation "will be set if the value is a fraction"
    :accessor denom
    :initarg :denom
    :initform nil)
   (is-decimal?
    :documentation "if t, displays val as %number.1digit"
    :accessor is-decimal?
    :initarg :is-decimal?
    :initform nil)
   (user-input?
    :documentation "if t, asks the user for input, default to true since most fields "
    :accessor user-input?
    :initarg user-input?
    :initform t)
   )
)

(defmethod format-display-string ((f field))
  "fills in ONE atom if the display prefix is a format string"
  (if (has-formatting-string? (display-string f))
      (format nil (display-string f) (value f))
      (display-string)))

(defun has-formatting-string? (str)
  "looks for one tilde TODO"
  ())

(defmethod process-user-input ((eggsam exam))
  (format t "To Implement eggsam user I/O processor"))

(defmethod process-user-input ((homeverk homework))
  (format t "To implement homeverk user I/O processor"))

(defmethod process-user-input ((ass-sign-ment assignment))
  (format t "to implement ass-sign-ment user I/O processor"))

(defmethod process-user-input ((resssult result))
  (format t "To implement resssult user I/O processor"))


(defun process-grades ()
  "The 'main function' "
  ())



; data definition - done
; user I/O 
; constraint processor
; calculations





