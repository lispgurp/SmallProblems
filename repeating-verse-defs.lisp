
(defpackage :com.lispgurp.repeating-poem-user
  (:use :common-lisp
		:com.lispgurp.repeating-poem)
  (:export :repeating-verse-fly))

;;; Fly poem ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun repeating-verse-fly ()
  (setup-repeating-verse 
   :nverses 6
   :openinglines
   #(("There was an old woman who swallowed a fly" 
	  "")
	 ("There was an old woman who swallowed a spider"
	  "That wriggled and iggled and jiggled insider her.")
	 ("There was an old woman who swalled a bird"
	  "How absurd to swallow a bird")
	 ("There was an old woman who swallowed a cat"
	  "Imagine that to swallow a cat")
	 ("There was an old woman who swallowed a dog"
	  "What a hog to swallow a dog")
	 (SUBVERT 
	  "There was an old woman who swallowed a horse,"
	  "She died of course"))
  :repeatingblock
  '(""  ; first verse
	"She swallowed the spider to catch the fly"
	"She swallowed the bird to catch the spider"
	"She swallowed the cat to catch the bird"
	"She swallowed the dog to catch the cat"
	"") ; last verse
  :endinglines
  '("I don't why she swallowed that fly"
	"Perhaps she'll die"))
  (write-repeating-poem))


;;; Jackbuilt poem ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun repeating-verse-jackbuilt ()
  (setup-repeating-verse
   :nverses 7
   :openinglines
   #((SUBVERT "This is the house that Jack built" "")
	 ("This is the malt" "")
	 ("This is the rat," "")
	 ("This is the cat," "")
	 ("This is the dog," "")
	 ("This is the cow with the crumpled horn," "")
	 ("This is the maiden all forlorn" ""))
   :repeatingblock
   '(""
	 ""
	 "That ate the malt"
	 "That killed the rat"
	 "That worried the cat"
	 "That tossed the dog"
	 "That milked the cow with the crumpled horn")
   :endinglines
   '("That lay in the house that jack built"))
  (write-repeating-poem))


;;; Coding poem ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun repeating-verse-blub-coding ()
  (setup-repeating-verse
   :nverses 5
   :openinglines
   #(("I once wrote a blub program that wouldn't compile"
	  "")
	 ("My program did nothing"
	  "So I started typing.")
	 ("\"Parse error,\" cried the blub compiler"
	  "Luckily I'm such a corporate slave")
	 ("Now the blub compiler wanted an identifier"
	  "And I thought the situation was getting dire")
	 ("blub complained it was expecting an enum"
	  "boy blub languages are really dumb"))
   :repeatingblock
   '(""
	 "I added Blub.out.println(\"I hate coding in blub languages \")"
	 "I added a blubslash to escape the quotes"
	 "I added a main method with its BlubString[] args"
	 "I added a public class and called it BlubScum")
   :endinglines
   '("I don't know why it wouldn't compile"
	 "My TA just smiled"))
  (write-repeating-poem t)
  (format t "Fuck you, Fuck you Blub Nerd Scum.~%")
  (format t "I am never turning back ~%")
  (format t "Into the sychophantic Bum I was~%")
  (dotimes (i 10)
	(format t "Fuck you, fuck you ~%")))
 

  

		



