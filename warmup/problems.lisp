; write a program that tells if a string is palindrome or not
; 
; 

(defun symmetry? (str)
  (loop 
       for i = 0 then (1+ i)
       for j = (1- (length str)) then (1- j)
       until (< j i)
       always (eq (elt str i)
                  (elt str j))))
 
(defun symmetry-debug (str)
  (let ((debug-data '()))
    (loop 
       for i = 0 then (1+ i)
       for j = (1- (length str)) then (1- j)
       until (< j i )
       do (setf debug-data 
                (append
                 debug-data
                 (list
                  (list "i:" i
                        "j:" j
                        "str[i]:" (elt str i)
                        "str[j]:" (elt str j))))))
    (loop for ele in debug-data
         do
         (format t "~A~%" ele))))

(defun palindrome? (str)
  (symmetry? str))

; TODO
;(defun palindrome-unit-tests? (str)
;  (let ((passed '("racecar"))
;        (failed '("goobilasa")))
;    (loop 
;       for shouldpass in passed
;       for 


