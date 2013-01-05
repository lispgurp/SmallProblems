; *** Overview ****
;
; Originally, this problem was a toy that I was using to revivify my interest in programming by
; proving to myself that the kind of piddily diddily problems that are typical in an interview/entry
; level programming are fun and easily doable in my favorite language, Lisp. However, now that this is
; done (it was actually a reminder of all those times I liked coding in Lisp), I am now using this program
; as fodder for my lightweight language workbench for CL.
;
; *Problem Statement*
;
; This API is based on abstracting three types of repetative poems that are used as the first programming problem in
; the University of Washington's introductory programming class, cse 142. Traditionally, the student only has to abstract
; the repetetition of one poem using Java static methods. I thought that this problem statement is too boring so I changed
; it to abstract all of the different types of poems that have been used in 142 in the last year (that is why there are 3).

; *** Breadcrumbs to understand this code ***
;
;  - 1. Look at \examples to see what this code is based on.
;  - 2. Look at \poem-definitions to see how the data structure is setup in the root github directory. 
;  - 3. Then look at the code in this file. I started with abstracting the pattern of the repeating verses first
;       and everything flowed backwards from from there up the call stack as I was writing it (e.g. make-nth-repeating-verse).
;  - P.S. There was a first draft of this code under \firstattempt which made no sense to me when I came back to it
;       so I rewrote this program as this file the second time.

; *** Breadcrumbs to execute the code ***
;
;  - 1. Feed this file into the interpreter (repeating-poem.lisp)
;  - 2. Feed the desired poem's lisp definition into the interpreter in \poem-definitions
;  - 3. Execute the commented out lines at the end of the desired each \poem-definitions file in the root github directory

;**** data structure ***********************************************************************

(defclass repeating-poem-definition ()
  ; "Data structure that defines a repetative poem"
  ((poem-opening-verse
       :documentation "List of lines that begin the poem. Never repeats itself"
       :accessor opening-verse)
   (poem-closing-verse
       :documentation  "List of lines that close the poem. Never repeats itself"
       :accessor closing-verse)       
   (poem-repetative-verses
    :documentation "List of repetative verse structures. This is where the repetitions are defined"
    :accessor repetative-verses)
   (ending-lines-of-all-repetative-verses
    :documentation "punctuates each verse. The same for all repetative verses"
    :accessor repeating-verse-punctuator)))

(defclass repetative-verse ()    
   ;"Definition of each verse that repeats itself"
  ((name
    :documentation "A label for each verse. Intended to be an aid for you when you analyze the poem to breakdown the repetition."
    :initarg :name)
   (introductory-lines
    :documentation "The lines that introduce the verse to the poem. Never repeats itself." 
    :initarg :introduction
    :accessor introduction)
   (repeating-lines
    :documentation "The lines that repeat themselves through the poem for the whole verse."
    :initarg :repetition
    :accessor repetition)))

;;; Repeating Poem Construction ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod make-whole-repeating-poem ((poem-definition repeating-poem-definition))
  (append
   (list (opening-verse poem-definition))
   (make-all-repeating-verses poem-definition)
   (list (closing-verse poem-definition))))

(defmethod make-all-repeating-verses ((poem-definition repeating-poem-definition))
  (loop for i from 0 upTo (1- (length (repetative-verses poem-definition)))
       collect (make-nth-repeating-verse poem-definition i)))

(defmethod make-nth-repeating-verse ((poem-definition repeating-poem-definition) n)
  "Constructs the nth verse by reverse iterating through the lst of repetative-verses"
  (let* ((poem-verses (repetative-verses poem-definition))
         (ith-verse-definition (nth n poem-verses)))
    (append 
     (introduction ith-verse-definition)
     (loop for i from n downTo 0
        append (repetition (nth i poem-verses)))
     (repeating-verse-punctuator poem-definition))))

;;; Repeating Poem Output ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod output-whole-poem (s (poem-def repeating-poem-definition))
  (output-verses s (make-whole-repeating-poem poem-def)))

(defun output-verses (s lst-of-verses)
  "Each verse is a lst of strings"
  (loop for verse in lst-of-verses
       do (progn
            (output-verse s verse)
            (format s "~%"))))

(defun output-verse (s verse)
  "Each verse is a lst of strings"
  (loop for ln in verse
       do (format s "~A~%" ln)))
