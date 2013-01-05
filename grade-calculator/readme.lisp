; *overview*
;
; This code is now serving as fodder for my silly little language workbench called cl-lwblight 
;

; *problem statement*
;
; this is one of the introductory problems in Computer Science and Engineering 142 at 
; UW. In it the student has to create a command line driven application that, line by
; line defines thier grades for the quarter. See spec.pdf for more details. 

; *extra motivation* 
;
; basically, I have always wanted to use CL's condition system to decouple invalid input from main
; processing code. In the past I have tried to use Exceptions to do this, but the problem with
; this is that in it's classic incarnation, thrown exceptions lose the stack where the problem occurred 
;
