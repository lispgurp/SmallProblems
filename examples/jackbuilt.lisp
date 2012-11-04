;;;; Jackbuilt ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
;This is the house that Jack built. (POEM-OPENING-LINE)

;This is the rat                    (VERSE-SUBJECT rat)
;That ate the malt                  (VERSE-REPEITION-CHAIN malt)
;That lay in the house that Jack built. (VERSE-CLOSING-LINE)
;
;This is the cat,                   (VERSE-SUBJECT cat)
;That killed the rat,               (VERSE-REPETITION-CHAIN rat malt)
;That ate the malt                  
;That lay in the house that Jack built. (VERSE-CLOSING-LINE)
;
;This is the dog,                   (VERSE-SUBJECT dog)
;That worried the cat,              (VERSE-REPETITION-CHAIN cat rat malt)
;That killed the rat,               
;That ate the malt
;That lay in the house that Jack built. (VERSE-CLOSING-CHAIN)
;
;This is the cow with the crumpled horn, (VERSE-SUBJECT cow)
;That tossed the dog,                    (VERSE-REPETITION-CHAIN dog cat rat malt)
;That worried the cat,                   
;That killed the rat,
;That ate the malt
;That lay in the house that Jack built.  (VERSE-CLOSING-LINE)
;
;This is the maiden all forlorn,             (VERSE-SUBJECT maiden)
;That milked the cow with the crumpled horn, (VERSE-REPITITION-CHAIN cow dog cat rat malt)
;That tossed the dog,                      
;That worried the cat, 
;That killed the rat,
;That ate the malt
;That lay in the house that Jack built.  (VERSE-CLOSING-LINE)
;
;This is the man all tattered and torn,   
;That kissed the maiden all forlorn,
;That milked the cow with the crumpled horn,
;That tossed the dog,
;That worried the cat, 
;That killed the rat,
;That ate the malt
;That lay in the house that Jack built. 

(setf repetition-chain '(cow dog cat rat malt))
'(maiden
  :as-verse-subject "This is the maiden all forlorn"
  :as-in-repetition-chain "That kissed the maiden all forlorn")


;This is the priest all shaven and shorn,
;That married the man all tattered and torn,
;That kissed the maiden all forlorn,
;That milked the cow with the crumpled horn,
;That tossed the dog,
;That worried the cat, 
;That killed the rat,
;That ate the malt 
;That lay in the house that Jack built.

;This is the cock that crowed in the morn,
;That waked the priest all shaven and shorn,
;That married the man all tattered and torn,
;That kissed the maiden all forlorn,
;That milked the cow with the crumpled horn,
;That tossed the dog,
;That worried the cat, 
;That killed the rat,
;That ate the malt
;That lay in the house that Jack built. 




	  


	   
	  



