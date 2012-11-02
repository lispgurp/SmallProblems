;I once wrote a program that wouldn't compile (POEM-OPENING-LINE)
;I don't know why it wouldn't compile, (VERSE-CLOSING-LINES)
;My TA just smiled.

;My program did nothing
;So I started typing.                             (VERSE-SUBJECT love)
;I added System.out.println("I <3 coding"),       (REPETITION-CHAIN love)
;I don't know why it wouldn't compile,            (VERSE-CLOSING-LINES)
;My TA just smiled.

;"Parse error," cried the compiler
;Luckily I'm such a code baller.                 (VERSE-SUBJECT error)
;I added a backslash to escape the quotes,       (REPETITION-CHAIN error love)
;I added System.out.println("I <3 coding"),
;I don't know why it wouldn't compile,           (VERSE-CLOSING-LINES)
;My TA just smiled.

;Now the compiler wanted an identifier
;And I thought the situation was getting dire.   (VERSE-SUBJECT identifier)
;I added a main method with its String[] args,   (REPETITION-CHAIN identifier backslash love)  
;I added a backslash to escape the quotes,
;I added System.out.println("I <3 coding"),     (VERSE-CLOSING-LINES)
;I don't know why it wouldn't compile,
;My TA just smiled.

;Java complained it expected an enum
;Boy, these computers really are dumb!           (VERSE-SUBJECT dumb)
;I added a public class and called it Scum,      (REPETITION-CHAIN dumb identifier backslash love)
;I added a main method with its String[] args,
;I added a backslash to escape the quotes,
;I added System.out.println("I <3 coding"),
;I don't know why it wouldn't compile,          (VERSE-CLOSING-LINES)
;My TA just smiled.
;<< your custom 6th verse goes here >>

(setf repetition-chain (scum main backslash love))

'(dumb
  :as-verse-subject "Java complained it expected an enum ~% Boy, these computers really are ~A ~%"
  :as-in-repetition-chain "I added a public class and called it Scum")

'(identifier
  :as-verse-subject "Now the compiler wanted an ~A ~% And I thought the situation was getting dire ~%"
  :as-in-repetition-chain "I added a main method with its String[] args")

