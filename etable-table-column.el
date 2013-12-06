
;;; table-column implementation
(defclass etable-table-column ()
  ((width :initarg :width
          :initform 10
          :type integer
          :protection :private
          :documentation "Width of this column.")
   (align :initarg :align
          :initform :right
          :protection :private
          :documentation "Type of vertical alignment.")
   (model-index :initarg :model-index
                :protection :private
                :documentation "Index of model column this column represents in table view.")
   (renderer :initarg :renderer
             :initform (etable-string-cell-renderer "String cell renderer"))))

(defmethod etable-get-width ((this etable-table-column))
  (etable-this width))

(defmethod etable-set-width ((this etable-table-column) w)
  (etable-this width w))

(defmethod etable-get-align ((this etable-table-column))
  (etable-this align))

(defmethod etable-get-model-index ((this etable-table-column))
  (etable-this model-index))

(defmethod etable-set-model-index ((this etable-table-column) index)
  (etable-this model-index index))

(defmethod etable-get-renderer ((this etable-table-column))
  (etable-this renderer))

(defmethod etable-set-renderer ((this etable-table-column) new-renderer)
  (etable-this renderer new-renderer))


(provide 'etable-table-column)
