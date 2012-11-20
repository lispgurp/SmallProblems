;;;; Jackbuilt ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
;This is the house that Jack built. (POEM-OPENING-LINE)

;This is the rat                    (VERSE-SUBJECT)
;That ate the malt ; eating-line    (VERSE-DEPENDENT)
;That lay in the house that Jack built. (VERSE-CLOSING)
;
;This is the cat,                   (VERSE-SUBJECT)
;That killed the rat,               VERSE-DEPENDENT
;That ate the malt                  VERSE-DEPDENCY-CHAIN, where chain = malt
;That lay in the house that Jack built. VERSE-CLOSING
;
;This is the dog,                   VERSE-SUBJECT
;That worried the cat,              VERSE-DEPENDENT
;That killed the rat,               VERSE-DEPENDENCY-CHAIN, where chain = rat,malt
;That ate the malt
;That lay in the house that Jack built. VERSE-CLOSING
;
;This is the cow with the crumpled horn, VERSE-SUBJECT
;That tossed the dog,                    VERSE-DEPENDENT
;That worried the cat,                   VERSE-DEPENDENCY-CHAIN, where chain = cat,rat,malt 
;That killed the rat,
;That ate the malt
;That lay in the house that Jack built.  VERSE-CLOSING
;
;This is the maiden all forlorn,             VERSE-SUBJECT
;That milked the cow with the crumpled horn, VERSE-DEPENDENT
;That tossed the dog,                        VERSE-DEPENDENCY-CHAIN, where chain = dog,cat,rat,malt
;That worried the cat, 
;That killed the rat,
;That ate the malt
;That lay in the house that Jack built.  VERSE-CLOSING
;
;This is the man all tattered and torn,
;That kissed the maiden all forlorn,
;That milked the cow with the crumpled horn,
;That tossed the dog,
;That worried the cat, 
;That killed the rat,
;That ate the malt
;That lay in the house that Jack built. 

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





(defvar jackbuilt-repeating-lines)
(defvar jackbuilt-first-lines)
(defvar jackbuilt-end-line)

(setf jackbuilt-repeating-lines
	  (list 
	   "That ate the malt"
	   "That killed that rat,"
	   "That worried the cat,"
	   "That tossed the dog,"
	   "That milked the cow with the crumpled horn,"))

(setf jackbuilt-first-lines
	  (list 
	   "This is the rat"
	   "This is the cat"
	   "This is the dog"
	   "This is the cow with the crumpled horn,"
	   "This is the maiden all forlorn"))

(setf jackbuilt-end-line 
	  (list "That lay in the house that Jack built"))


(defin make-repeating-jackbuilt-verses ()
	(loop for i from 1 to 5
		 collect
		 (append
		  (list (elt jackbuilt-first-lines (- i 1)))
		  (make-repeating-lines jackbuilt-repeating-lines (- i 1)))))
		 
	  


	   
	  



