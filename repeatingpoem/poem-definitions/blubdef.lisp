(defvar blub-poem nil)
(setf blub-poem (make-instance 'repeating-poem-definition))

(setf (opening-verse blub-poem)
      '("I once wrote a program that wouldn't compile"
        "I don't know why it wouldn't compile"
        "My T/A just smiled"))

(setf (closing-verse blub-poem)
      '("Java is such a stupid useless bore"
        "So I switched to languages hackery of yore!"))

(setf (repeating-verse-punctuator blub-poem)
      '("I don't know what it wouldn't compile"
        "My T/A jut smiled"))

(setf (repetative-verses blub-poem)
      (list
       (make-instance 'repetative-verse
                      :name 'did-nothing
                      :introduction '("My program did nothing" "So I started typing")
                      :repetition '("I added System.out.println(\"I <3 coding \" "))
       (make-instance 'repetative-verse
                      :name 'parse-error
                      :introduction '("\"Parse Error \" cried the compiler" "Luckily I am such a code baller")
                      :repetition '("I added a backslash to escape the quotes"))
       (make-instance 'repetative-verse
                      :name 'identifier
                      :introduction '("Now the compiler wanted and identifier" "And I thought the situation was getting dire")
                      :repetition '("I added a main method with its String[] args"))
       (make-instance 'repetative-verse
                      :name 'dumb
                      :introduction '("Java expected an enum" "Boy compilers are really dumb")
                      :repetition '("I added a public class and called it Scum"))
       (make-instance 'repetative-verse
                      :name 'JSR
                      :introduction '("I needed to abstract more than just a class" "This language's abstraction facilities are really crass")
                      :repetition '("I added a JSR for macro metaprogramming"))))

;(output-whole-poem t blub-poem)
