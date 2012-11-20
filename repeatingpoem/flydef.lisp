(setf *poem-opening* 
	  '("There was an old woman who swallowed a fly"
		"I don't know why she swallowed that fly"
		"Perhaps she'll die."))
(setf *poem-closing*
	  '("There was an old woman who swallowed a horse"
		"She died of course"))
 
(setf *repetition*
	  (list
	   (make-repetative-verse
		:name 'spider
		:introductory-lines '("There was an old woman who swallowed a spider" "That wriggled and iggled and jiggled insider her") 
		:repeating-lines "She swallowed the spider to catch the fly")
	   (make-repetative-verse
		:name 'bird 
		:introductory-lines '("There was an old woman who swallowed a bird" "How absurd to swallow a bird")
		:repeating-lines "She swallowed the bird to catch the spider")
	   (make-repetative-verse
		:name 'cat 
		:introductory-lines '("There was an old woman who swallowed a cat" "Imagine that to swallow a cat")
		:repeating-lines "She swallowed the cat to catch the bird")
	   (make-repetative-verse
		:name 'dog 
		:introductory-lines '("There was an old woman who swallowed a dog" "What a hog to swallow a dog")
		:repeating-lines "She swallowed the dog to catch the cat")))
		

