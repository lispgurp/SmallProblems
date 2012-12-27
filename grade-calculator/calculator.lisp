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
; line defines thier grades for the quarter. See spec.pdf for more details
;

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
                              :constraint '(:range 0 50)))
   ) ; end slot defs
) ; end classdef

(defclass homework ()
    (

     (field-name
      :accessor field-name
      :initform (make-instance 'field
                               :display-prefix "display Prefix"
                               :constraint '()))
     (field-name
      :accessor field-name
      :initform (make-instance 'field
                               :display-prefix "Display Prefix"
                               :constraint '()))
     (field-name
      :accessor field-name
      :initform (make-instance 'field
                               :display-prefix "Display Prefix"
                               :constraint '()))
     (field-name
      :accessor field-name
      :initform (make-instance 'field
                               :display-prefix "Display Prefix"
                               :constraint '()))
     (field-name
      :accessor field-name
      :initform (make-instance 'field
                               :display-prefix "Display Prefix"
                               :constraint '()))
     (field-name
      :accessor field-name
      :initform (make-instance 'field
                               :display-prefix "Display Prefix"
                               :constraint '()))
     (field-name
      :accessor field-name
      :initform (make-instance 'field
                               :display-prefix "Display Prefix"
                               :constraint '()))
     (field-name
      :accessor field-name
      :initform (make-instance 'field
                               :display-prefix "Display Prefix"
                               :constraint '()))
     (field-name
      :accessor field-name
      :initform (make-instance 'field
                               :display-prefix "Display Prefix"
                               :constraint '()))
     ) ; end slot defs
); end defclass

(defclass result ()
  (
   (field-name
      :accessor field-name
      :initform (make-instance 'field
                               :display-prefix "Display Prefix"
                               :constraint '()))
   (field-name
      :accessor field-name
      :initform (make-instance 'field
                               :display-prefix "Display Prefix"
                               :constraint '()))
   (field-name
      :accessor field-name
      :initform (make-instance 'field
                               :display-prefix "Display Prefix"
                               :constraint '()))
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
