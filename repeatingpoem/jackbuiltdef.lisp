(defvar jackbuilt-poem nil)
(setf jackbuilt-poem (make-instance 'repeating-poem-definition))

(setf (opening-verse jackbuilt-poem)
      '("This is the house that Jack built"))

(setf (closing-verse jackbuilt-poem) nil)

(setf (repeating-verse-punctuator jackbuilt-poem)
      '("That lay in the house that Jack built"))

(setf (repetative-verses jackbuilt-poem)
      (list
       (make-instance 'repetative-verse
                      :name 'rat
                      :introduction '("This is the Rat")
                      :repetition '("That ate the Malt"))
       (make-instance 'repetative-verse
                      :name 'cat
                      :introduction '("This is the Cat")
                      :repetition '("That killed the Rat"))
       (make-instance 'repetative-verse
                      :name 'dog 
                      :introduction '("This is the Dog")
                      :repetition '("That worried the Cat"))
       (make-instance 'repetative-verse
                      :name 'cow
                      :introduction '("This is the Cow with the crumpled horn")
                      :repetition '("That tossed the Dog"))
       (make-instance 'repetative-verse
                      :name 'maiden
                      :introduction '("This is the Maiden all forlorn")
                      :repetition '("That milked the Cow with the crumpled horn"))
       (make-instance 'repetative-verse
                      :name 'man
                      :introduction '("This is the Man all tattered and torn")
                      :repetition '("That kissed the Maiden all forlorn"))
       (make-instance 'repetative-verse
                      :name 'priest
                      :introduction '("This is the Priest all shaven and shorn")
                      :repetition '("That married the Man all tattered and torn"))
       (make-instance 'repetative-verse
                      :name 'cock
                      :introduction '("This is the cock that crowed in the morn")
                      :repetition '("That walked past the priest all shaven and shorn"))))

;(output-whole-poem t jackbuilt-poem)

