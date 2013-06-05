; G = graph
; v = root
; t = target
; c = current node
;procedure BFS(G,v,t):
;2      create a queue Q
;3      enqueue v onto Q
;4      mark v
;5      while Q is not empty:
;6          cur ← Q.dequeue()
;7          if cur = t 
;8              return cur
;9          for all edges e in G.adjacentEdges(c) do
;12             u ← G.adjacentVertex(c,e)
;13             if u is not marked:
;14                  mark u
;15                  enqueue u onto Q

(defvar *raw-graph* nil
(setf *raw-graph*
  '((A B C)
    (B C A)
    (C A B)))

;;; alg ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; conventions
; upper case - instantiated data structure
; lower case - data
; neighbor = edge
(demethod bread-first-search ((G graph) (target node))
  (let ((Q (make-instance 'queue))
        (root (get-root G)))
    (enqueue! Q root)
    (setf (visited? root) t)
    (loop for current in (dequeue! Q) ;TODO - this is wrong
         thereis (same current target)
         do (enqueue-neighbors Q current)))))

(defmethod enqueue-neighbors ((Q queue) (current node))
  (loop for neighbor in (neighbors n)
     do (when (not (visited? edge))
          (enqueue! Q neighbor))))
       
(defun same (lhs rhs)
  (eq (lhs rhs) lhs nil))

;;; data structures ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass graph ()
  ((root
    :accessor root)))

(defmethod make-graph (lst)
  (if (eq lst nil)
      nil
      ()))

(defmethod get-root ((G graph))
  ())

(defclass node ()
  ((visted?
    :accessor visited?
    :initform nil)
   (value
    :accessor value)
   (neighbors
    :accessor neighbors)))

(defclass queue ()
  ((line
    :accessor line
    :initform '())))

(defmethod enqueue! ((Q queue) (n node))
  ())

(defmethod dequeue! ((Q queue))
  ())


