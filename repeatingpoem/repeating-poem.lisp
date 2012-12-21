; This API is based on abstracting three types of repetative poems that are used as the introductory programming problem in
; the University of Washington's introductory programming class, cse 142. Traditionally, the student only has to abstract
; the repetetition of one poem using Java static methods. I though that this problem statement is too boring so I changed
; it to abstract all of the different types of poem that have been used in 142 in the last year (that is why there are 3).

(defclass repeating-poem-definition ()
  ; "Data structure that defines a repetative poem"
  ((poem-opening-lines
       :documentation "List of lines that begin the poem. Never repeats itself"
       :accessor opening-lines)
   (poem-closing-lines
       :documentation  "List of lines that close the poem. Never repeats itself"
       :accessor closing-lines)       
   (poem-repetative-verses
    :documentation "List of repetative verse structures. This is where the repetitions are defined"
    :accessor repetative-verses)
   (ending-lines-of-all-repetative-verses
    :documentation "punctuates each verse. The same for all repetative verses"
    :accessor verse-punctuator)))

(defclass repetative-verse ()    
   ;"Definition of each verse that repeats itself"
  ((name
    :documentation "A label for each verse. Intended to be an aid for you when you analyze the poem to breakdown the repetition."
    :initarg :name)
   (introductory-lines
    :documentation "The lines that introduce the verse to the poem. Never repeats itself." 
    :initarg :introduction)
   (repeating-lines
    :documentation "The lines that repeat themselves through the poem for the whole verse."
    :initarg :repetition)))



       




