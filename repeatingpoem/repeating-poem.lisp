; writing a repetative poem

;1) *poem-opening*  (lines that start the poem)
;2) *poem-closing*  (lines that end the poem)
;3) *repetition*   (list of repetative-verses declared in the order that they show up in the poem)
;    (make-repetative-verse
;       :name (as defined in :objects of repetition chain)
;       :introduction
;       :repetition-lines
;       :verse-ending (supplied a default value in the constructor) 

(defvar *poem-opening-lines*)
(defvar *poem-closing-lines*)
(defvar *repetition*)

(defstruct repetative-verse
  (name)
  (introductory-lines)
  (repeating-lines)
  (verse-ending-lines))




