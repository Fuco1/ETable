(require 'etable)
(require 'etable-table-column)


;;; table-column-model interface
(defclass etable-table-column-model ()
  ()
  :abstract t)

(defmethod etable-add-column ((this etable-table-column-model) column)
  (error "Not implemented yet"))

(defmethod etable-move-column ((this etable-table-column-model) index-from index-to)
  (error "Not implemented yet"))

(defmethod etable-remove-column ((this etable-table-column-model) index)
  (error "Not implemented yet"))

(defmethod etable-get-column ((this etable-table-column-model) index)
  (error "Not implemented yet"))

(defmethod etable-get-columns ((this etable-table-column-model))
  (error "Not implemented yet"))

(defmethod etable-get-column-count ((this etable-table-column-model))
  (error "Not implemented yet"))

(defmethod etable-get-column-margin ((this etable-table-column-model))
  (error "Not implemented yet"))

(defmethod etable-set-column-margin ((this etable-table-column-model) margin)
  (error "Not implemented yet"))

(defmethod etable-get-total-column-width ((this etable-table-column-model))
  (error "Not implemented yet"))


;;; default table-column-model implementation
(defclass etable-default-table-column-model (etable-table-column-model)
  ((column-list :initarg :column-list
                :initform []
                :type vector
                :protection :private
                :documentation "Array of `etable-table-column' objects in this model.")
   ;; (selection-model)
   (column-margin :initarg :column-margin
                  :initform 0
                  :type integer
                  :protection :private
                  :documentation "Margin between each column.")))

(defmethod etable-add-column ((this etable-default-table-column-model) column)
  (etable-mutate column-list (vconcat this-slot (vector column))))

(defmethod etable-move-column ((this etable-default-table-column-model) index-from index-to)
  (etable-mutate column-list
    (let ((from (elt this-slot index-from))
          (to (elt this-slot index-to)))
      (setf (elt this-slot index-to) from)
      (setf (elt this-slot index-from) to)
      this-slot)))

(defmethod etable-remove-column ((this etable-default-table-column-model) index)
  (let ((modified (vconcat (-remove-at index (append (etable-this column-list) nil)) nil)))
    (etable-this column-list modified)))

(defmethod etable-get-column ((this etable-default-table-column-model) index)
  (elt (etable-this column-list) index))

(defmethod etable-get-columns ((this etable-default-table-column-model))
  (etable-this column-list))

(defmethod etable-get-column-count ((this etable-default-table-column-model))
  (length (etable-this column-list)))

(defmethod etable-get-column-margin ((this etable-default-table-column-model))
  (etable-this column-margin))

(defmethod etable-set-column-margin ((this etable-default-table-column-model) margin)
  (etable-this column-margin margin))

(defmethod etable-get-total-column-width ((this etable-default-table-column-model))
  (let* ((col-num (etable-get-column-count this))
         (margins (* (1- col-num) (etable-get-column-margin this))))
    (apply '+ margins (mapcar (lambda (x) (etable-get-width x)) (etable-this column-list)))))


(provide 'etable-table-column-model)
