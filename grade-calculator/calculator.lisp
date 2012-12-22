; *Overview
; This is part 2 in a continuing series to convince myself that little bitty
; problems are fun and easily doable in a Real Language like Lisp (tm) as opposed
; to my blubstream experience. The bottom line is that no matter the expertise one
; might have in a blub languages (Java,C++,C#) one is fighting the tool to get things to work.
; A.K.A. I am noticing that some of the latent expertise I have as an engineer
; is pouring out when I solve problems in Lisp.

; *Problem Statement
; This is one of the introductory problems in Computer Science and Engineering 142 at 
; UW. In it the student has to create a command line driven application that, line by
; line defines thier grades for the quarter. See spec.pdf for more details

; *Motivation 
; Basically, I have always wanted to use CL's condition system to decouple invalid input from main
; processing code. In the past I have tried to use Exceptions to do this, but the problem with
; this it's classic incarnation is that one loses to stack and cannot go back to where the error is 
; to do things differently. Furthermore since closure oriented programming is so forgien to
; mainstream computing, even if you could go back the lack of this tradition means that you have
; to supply some awkward statically typed function pointer/single dispatch object. 

; *** Data Structures for the raw data in the grades specification *** ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defclass exam ()
  ((weight
    :accessor weight
    :initform (make-instance 'field 
                              :display-prefix "What is its weight"
                              :constraint (list :range 0 10)))))
                             
    

;  (score
;   :accessor score)
;  (curve?
;   :accessor curve?)
;  (total-points
;   :accessor total-points)
;  (weighted-score
;   :accessor weighted-score))

; TODO how to declare static objects aka singletons from Beverly Hills
(defclass field ()
  ((raw-value
    :documentation "Value of the field. Normally used directly in data structure definitions (class/struct, etc)"
    :accessor value)
   (constraint
    :documentation  "declares what the valid values are or what the range is"
    :initarg :constraint
    :accessor constraint)
   (display-prefix
    :documentation "Intended to accompany display output"
    :initarg :display-prefix
    :accessor display-prefix)))
 
   

