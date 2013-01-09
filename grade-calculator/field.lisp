; encapsulates the field for the sake of constraint processing 
(defclass field ()
  (
   (raw-value
    :documentation "value of the field. Normally used directly in data structure definitions (class/struct, etc)"
    :accessor value)
   (constraint
    :documentation  "declares what the valid values are or what the range is, to be used with condition system"
    :initarg :constraint
    :accessor constraint)
   (display-constraint?
    :documentation "if t, indicates whether it should plug a single constraint into display-string"
    :initarg :display-constraint?
    :accessor display-constraint?
    :initform nil)
   (display-string
    :documentation "intended to accompany display output"
    :initarg :display-string
    :accessor display-string)
   (is-fraction?
    :documentation "if t, plugs value as numerator and denom into display-string"
    :accessor is-fraction?
    :initarg :is-fraction?
    :initform nil)
   (denominator
    :documentation "will be set if the value is a fraction"
    :accessor denom
    :initarg :denom
    :initform nil)
   (is-decimal?
    :documentation "if t, displays val as %number.1digit"
    :accessor is-decimal?
    :initarg :is-decimal?
    :initform nil)
   (user-input?
    :documentation "if t, asks the user for input, default to true since most fields "
    :accessor user-input?
    :initarg :user-input?
    :initform t)
  (calculator
   :documentation "calculate and sets the field's value and denominator"
   :accessor calc-fn
   :initarg :calc-fn
   :initform nil)
   )   
)

(defgeneric input-or-output-field (field grade-object))
(defgeneric display-calculation (field))
(defgeneric format-raw-value (field))
(defgeneric prompt-for-user-prompt (field))
(defgeneric make-user-prompt (field))
(defgeneric make-constraint-string (field))
