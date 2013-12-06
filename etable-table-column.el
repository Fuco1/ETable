
;;; table-column implementation
(defclass etable-table-column ()
  ((width :initarg :width
          :initform 10
          :type integer
          :protection :private
          :documentation "Width of this column.")))

(defmethod etable-get-width ((this etable-table-column))
  (etable-this width))


(provide 'etable-table-column)
