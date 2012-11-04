; core ideas
; 1. relationships of subjects to dependents
; 2. how those relationships are expressed in the poem in language
; 3. how the repetition expresses itself in each of the poems
; 4. the subject of the first verse, becomes the beginning of the chain of the second verse
; 5. (restates #4 above) we introduce new link on the chain in each verse, like pusing on a stack 
; 6. each object has a value in the poem as a subject, and a value in the poem as a repetition
; 7. The essential nature of each poem is that there is a subject that finds themselves in
;    a degenerate situation that deteriorates as each new object enters the situation 
;    till it either ends (fly: she dies) or keeps going on forever (jack built/coding)

;There was an old woman who swallowed a fly.     (POEM-OPENING-LINE)
;I don't know why she swallowed that fly,        (VERSE-CLOSING-LINES)
;Perhaps she'll die.
 
;There was an old woman who swallowed a spider,   
;That wriggled and iggled and jiggled inside her. (VERSE-SUBJECT spider)
;She swallowed the spider to catch the fly,       (VERSE-REPETITION-CHAIN spider)
;I don't know why she swallowed that fly,         (VERSE-CLOSING-LINES)
;Perhaps she'll die.                              
 
;There was an old woman who swallowed a bird,    
;How absurd to swallow a bird.                   (VERSE-SUBJECT bird)
;She swallowed the bird to catch the spider,     (VERSE-REPETITION-CHAIN bird spider)
;She swallowed the spider to catch the fly,      
;I don't know why she swallowed that fly,        (VERSE-CLOSING-LINES)
;Perhaps she'll die.
 
;There was an old woman who swallowed a cat,    
;Imagine that to swallow a cat.                  (VERSE-SUBJECT)   (cat)
;She swallowed the cat to catch the bird,        (VERSE-REPETITION-CHAIN cat bird spider)
;She swallowed the bird to catch the spider,     
;She swallowed the spider to catch the fly,
;I don't know why she swallowed that fly,       (VERSE-CLOSING-LINES)
;Perhaps she'll die.
 
;There was an old woman who swallowed a dog,
;What a hog to swallow a dog.                   (VERSE-SUBJECT dog)
;She swallowed the dog to catch the cat,        (VERSE-REPETITION-CHAIN dog cat bird spider)
;She swallowed the cat to catch the bird,       
;She swallowed the bird to catch the spider, 
;She swallowed the spider to catch the fly,
;I don't know why she swallowed that fly,      
;Perhaps she'll die.
 
;<< Your custom sixth verse goes here >>
 
;There was an old woman who swallowed a horse,  (POEM-ENDING-LINES)
;She died of course.

(setf repetition-chain  '(dog cat bird spider))

'(dog 
  :as-verse-subject        "There was an old woman who swallowed a god ~% What a hog to swallow a dog"
  :as-in-repetition-chain  "She swallowed the ~A to catch the cat")

; Writing a repetative nursery rhyme

;1) Opening Lines (a list of lines to start the poem) 
;2) Closing Lines (a list of lines to end the peom)
;3) Repetition (the names of things that will repeat themselves as symbols)
;4) Verse Definitions
;       :name (as defined in repetition chain)
;       :first-lines
;       :as-in-repetition
