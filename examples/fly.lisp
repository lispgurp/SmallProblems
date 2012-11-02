; core ideas
; 1. relationships of subjects to dependents
; 2. how those relationships are expressed in the poem in language
; 3. how the repetition expresses itself in each of the poems
; 4. the subject of the first verse, becomes the beginning of the chain of the second verse

;There was an old woman who swallowed a fly.     (POEM-OPENING-LINE)
;I don't know why she swallowed that fly,        (VERSE-CLOSING-LINES)
;Perhaps she'll die.
 
;There was an old woman who swallowed a spider,   
;That wriggled and iggled and jiggled inside her. (VERSE-SUBJECT spider)
;She swallowed the spider to catch the fly,       (VERSE-REPETITION-CHAIN fly)
;I don't know why she swallowed that fly,         (VERSE-CLOSING-LINES)
;Perhaps she'll die.                              
 
;There was an old woman who swallowed a bird,    
;How absurd to swallow a bird.                   (VERSE-SUBJECT bird)
;She swallowed the bird to catch the spider,     (VERSE-REPETITION-CHAIN spider fly)
;She swallowed the spider to catch the fly,      
;I don't know why she swallowed that fly,        (VERSE-CLOSING-LINES)
;Perhaps she'll die.
 
;There was an old woman who swallowed a cat,    
;Imagine that to swallow a cat.                  (VERSE-SUBJECT)   (cat)
;She swallowed the cat to catch the bird,        (VERSE-REPETITION-CHAIN bird spider fly)
;She swallowed the bird to catch the spider,     
;She swallowed the spider to catch the fly,
;I don't know why she swallowed that fly,       (VERSE-CLOSING-LINES)
;Perhaps she'll die.
 
;There was an old woman who swallowed a dog,
;What a hog to swallow a dog.                   (VERSE-SUBJECT dog)
;She swallowed the dog to catch the cat,        (VERSE-DEPENDENT cat bird spider fly)
;She swallowed the cat to catch the bird,       
;She swallowed the bird to catch the spider, 
;She swallowed the spider to catch the fly,
;I don't know why she swallowed that fly,      
;Perhaps she'll die.
 
;<< Your custom sixth verse goes here >>
 
;There was an old woman who swallowed a horse,  (POEM-ENDING-LINES)
;She died of course.

'(dependency-chain 
  ((dog cat)
   (cat bird)
   (bird spider)
   (spider fly)))

'(dog 
  :opening "There was an old woman who swallowed a ~A ~% What a hog to swallow a ~A"
  :dependent cat)

(defun make-dependency-line-chain (subject dependent)
  (format t "She swallowed a ~A to catch the ~A ~%" subject dependent))


