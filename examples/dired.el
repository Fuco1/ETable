(require 'f)

(let* ((dired-column-model (etable-default-table-column-model "DiredColumnModel"
                                                              :column-list (vector
                                                                            (etable-table-column "perm" :width 10 :model-index 9)
                                                                            (etable-table-column "size" :width 10 :model-index 8
                                                                                                 :renderer (etable-file-size-cell-renderer "FileSizeRenderer"))
                                                                            (etable-table-column "lastmod" :width 12 :model-index 6
                                                                                                 :renderer (etable-date-cell-renderer "DateRenderer"))
                                                                            (etable-table-column "filename" :width 40 :align 'left :model-index 0))
                                                              :goal-column 3))
       (dired-table-data (etable-list-to-vector (--map (cons (f-filename it) (file-attributes it)) (f-entries "/usr/bin"))))
       (dired-table-model (etable-default-table-model "DiredTableModel" :table-data dired-table-data :column-ids ["perm" "size" "lastmod" "filename"]))
       (dired-table (etable-create-table dired-table-model dired-column-model)))
  (with-current-buffer-window "*etable-dired*"
                              nil
                              nil
                              (etable-draw dired-table (point))))
