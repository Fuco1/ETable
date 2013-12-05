
;;; helper macros
(defmacro etable-this (slot &optional value)
  "Get the value of SLOT in `this' instance.

If VALUE is non-nil, set the value of SLOT instead.  To set the
SLOT to nil, specify :nil as the VALUE."
  (if value
      (if (eq value :nil)
          `(oset this ,slot nil)
        `(oset this ,slot ,value))
    `(oref this ,slot)))

(defmacro etable-mutate (slot form &rest forms)
  "Mutate the SLOT in this object using FORM.

The SLOTs value is captured with variable `this-slot'."
  (declare (indent 1))
  `(let ((this-slot (etable-this ,slot)))
     (oset this ,slot (progn
                        ,form
                        ,@forms))))

(defun etable-aref (data idx &rest indices)
  (let ((e (aref data idx)))
    (cl-loop for i in indices do (setq e (aref e i)))
    e))

;;; etable view implementation
(defclass etable ()
  ((table-model :initarg :table-model
                :type etable-table-model
                :protection :private
                :documentation "Table model for this table.")
   (column-model :initarg :column-model
                 :type etable-table-column-model
                 :protection :private
                 :documentation "Column model for this table.")
   (overlay :initform nil
            :documentation "Overlay keeping track of bounds of this table.")))

(defmethod etable-draw ((this etable) point)
  (goto-char point)
  (-when-let (ov (etable-this overlay))
    (delete-region (overlay-start ov) (overlay-end ov))
    (delete-overlay ov)
    (etable-this overlay :nil))
  (let ((ov (make-overlay (point) (point) nil nil t)))
    (overlay-put ov 'etable this)
    (overlay-put ov 'face 'sp-pair-overlay-face)
    (etable-this overlay ov))
  (etable-update this))

(defmethod etable-update ((this etable))
  (let ((ov (etable-this overlay))
        (model (etable-this table-model)))
    (delete-region (overlay-start ov) (overlay-end ov))
    (save-excursion
      (goto-char (overlay-start ov))
      (cl-loop for i from 0 to (1- (etable-get-row-count model)) do
               (cl-loop for j from 0 to (1- (etable-get-column-count model)) do
                        (insert (etable-get-value-at model i j) " "))
               (insert "\n")))))

(defmethod etable-remove ((this etable))
  (let ((ov (etable-this overlay)))
    (delete-region (overlay-start ov) (overlay-end ov))
    (delete-overlay ov)
    (etable-this overlay :nil)))

(provide 'etable)
