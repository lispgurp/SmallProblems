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
; this is that in it's classic incarnation, thrown exceptions lose the stack where the problem occurred 
;
