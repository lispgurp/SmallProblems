;
;
;
; problem: write a program that tells if a string is palindrome or not
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
;
;
;
;
; problem: unit testing palindrome
;
;
;
;

; kickoff fns

(defun test-palindrome ()
  (test-fn #'palindrome?
           '(
             ("racecar" t)
             ("goobilasa" nil)
             )))

; middle layer fns: aka composite fns, called by kickoff, use the primitive layer

(defun test-fn (fn tests)
  (let ((complete-success (all-passed? fn tests)))
    (if complete-success
        (format t "Successful run of all tests")
        (get-all-results fn tests))))

(defun get-all-results (fn tests)
  (loop for tst in tests
     append 
       (list :test tst
             :result (interpret (run-test fn tst)))))

; primitive fns

(defun all-passed? (fn tests)
  (loop for tst in tests
     always (run-test fn tst)))

          
(defun run-test (fn-test tst)
  (let* ((arguments (first tst))
         (expected (second tst))
         (result (funcall fn-test arguments)))
    (eq result expected)))

(defun interpret (result)
  (if result '*winner* '*loser*))

;
;
;
; problem: Write a function that reverses a linked list
;
;
;

;
;
;
; 1. Describe what a list is in CL
;
;
;

; common lisp's fundemental data type is a linked list
; a list is represented as a cons cell or a pair where (right cons-cell) is a value (reference type/pointer)
; and (rest cons-cell) is either nil or a pointer to another cons cell. For example
; '() another way of putting it is that a cons is a a struct with two pointers that are implicitly always derfed
; and a list is one ore more cons cell where (second struct) = points to NULL (nil in CL) or another cons cell

;' (a b c) 

; '(c b a)

; stack
; '(a b c)
; '()     
; '(a)      a
; '(b a)    b
; '(c b a)        c

; using append
(defun my-reverse (lst)
  (if (null lst) '()
      (let ((ret (my-reverse (rest lst))))
        (append ret
                (list (first lst))))))

; using loop
(defun my-reverse-loop (lst)
  (let ((stk '())) 
    (loop for ele in lst
       do (push ele stk))
    stk))

; using loop without extra let 
(defun my-reverse-loop-without-let (lst)
  (loop for ele in lst
     for stk = (list ele) then (push ele stk) 
       finally (return stk)))

;
;
; problem: implement atoi and itoa
;
;
;

; precondition: input = a series of continous numeric characters where the left most character is the
; most significant digit and the rightmost character is the least significant digit.
; If this rule is violated the method will return nil. 
; supported: 
;   1. overflow on final result (condition system)
;   2. unicode (algorithm)
;   3. bounds checking on exponentiation (condition system)
;   4. overcorrection (e.g. make contigous string in place!)
;   5. different bases 
 
; basic algorithm: add each position individually, if number = 1234
;  1234 = length = 4
;  (1 * 10^3) + (2 * 10^2) + (3* 10^1) + (4*10^0)
(defun atoi (str)
  (handler-case
      (if (and (stringp str)
               (= (length str) 0))
          nil
          (multiple-value-bind (sign mstr)
              (get-sign str)
            (loop for c across mstr
               for i from (1- (length mstr)) downto 0
               for n = (get-numeric-value c)
               sum (compute-power n :to-the i :from-str mstr) into acc 
               finally (return (* acc sign)))))
    (non-numeric-error (e)
      (make-non-numeric-error-message e))))

; helpers
  
(defvar *number-map* nil)

(defun make-number-map ()
  (setf *number-map* (make-hash-table))
  (setf (gethash #\0 *number-map*) 0)
  (setf (gethash #\1 *number-map*) 1)
  (setf (gethash #\2 *number-map*) 2)
  (setf (gethash #\3 *number-map*) 3)
  (setf (gethash #\4 *number-map*) 4)
  (setf (gethash #\5 *number-map*) 5)
  (setf (gethash #\6 *number-map*) 6)
  (setf (gethash #\7 *number-map*) 7)
  (setf (gethash #\8 *number-map*) 8)
  (setf (gethash #\9 *number-map*) 9))

(defun get-numeric-value (chr)
  (if (characterp chr)
      (progn
        (if (null *number-map*)
            (make-number-map))
        (gethash chr *number-map*))
      nil))

(defun compute-power (n &key to-the from-str)
  (if (null n)
      (error 'non-numeric-error :bad-string from-str :bad-index to-the)
      (* n (expt 10 to-the))))

(defun get-sign (str)
  (defun is-minus? (charc) (equal charc "-"))
  (let* ((first-char (subseq str 0 1))
         (rest-chars (rest-vec str))
         (sign (if (is-minus? first-char) -1 1))
         (result-str (if (is-minus? first-char) rest-chars str)))
    (values sign result-str)))

; error cases
(define-condition non-numeric-error (error)
  ((message :initform "atoi error, non numeric character encountered in ~A at position ~A~%"
            :reader message)
   (bad-string :initarg :bad-string :reader bad-string)
   (bad-index :initarg :bad-index :reader bad-index)))

(defun make-non-numeric-error-message (e)
  (format t (message e) (bad-string e) (bad-index e)))
   
; generic utils

(defun rest-vec (vec)
  (if (<= (length vec) 1)
      nil
      (subseq vec 1)))

; equality - four equality operators in CL
; eq = reference/pointer equality
; eql = reference equality, plus numeric and character support -> use for latter purpose to not get confused
; equal = recursively definable deep compare
;(defun mine-equal (a b)
;  "This is not how it is implemented, but based on the hyperspec it can be recursively definable"
;  (cond ((are-symbols? a b)
;         (eq a b))
;        ((are-numbers? a b)
;         (eql a b))
;        ((are-characters? a b)
;         (eql a b))
;        ((are-conses? a b)
;         (and (mine-equal (first a) (first b))
;              (mine-equal (right a) (right b))))
;        ((are-arrays? a b)
;         (format t "something-something"))))

;(defun left (acons)
;  (car acons))

;(defun right (acons)
;  (cdr acons))
