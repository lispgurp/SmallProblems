(defvar fly-poem nil)

(setf fly-poem (make-instance 'repeating-poem-definition))

; TODO: special setup note - last two opening lines equal to verse-punctuator, don't repeat!

(setf (opening-lines fly-poem) 
	  '("There was an old woman who swallowed a fly"
		"I don't know why she swallowed that fly"
		"Perhaps she'll die."))

(setf (closing-lines fly-poem)
	  '("There was an old woman who swallowed a horse"
		"She died of course"))

(setf (verse-punctuator fly-poem)
      '("I don't know what she swallowed that fly" "Perhaps she'll die"))
 
(setf (repetative-verses fly-poem)
	  (list
	   (make-instance 'repetative-verse
		:name 'spider
		:introduction '("There was an old woman who swallowed a spider" "That wriggled and iggled and jiggled insider her") 
		:repetition '("She swallowed the spider to catch the fly"))
	   (make-instance 'repetative-verse
		:name 'bird 
		:introduction '("There was an old woman who swallowed a bird" "How absurd to swallow a bird")
		:repetition '("She swallowed the bird to catch the spider"))
	   (make-instance 'repetative-verse
		:name 'cat 
		:introduction '("There was an old woman who swallowed a cat" "Imagine that to swallow a cat")
		:repetition '("She swallowed the cat to catch the bird"))
	   (make-instance 'repetative-verse
		:name 'dog 
		:introduction '("There was an old woman who swallowed a dog" "What a hog to swallow a dog")
		:repetition '("She swallowed the dog to catch the cat"))))
		

