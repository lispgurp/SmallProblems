;;;; Jackbuilt ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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
		 
	  


	   
	  



