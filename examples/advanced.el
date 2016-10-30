(let* ((commands-table-model (etable-default-table-model "Commands"
                                                         :table-data [["forward-char"   "Move point right N characters"   "C-f"]
                                                                      ["backward-char"  "Move point left N characters"    "C-b"]]
                                                         :column-ids ["Command" "Description" "Shortcut"]))
       (commands-table (etable-create-table commands-table-model)))
  (with-current-buffer-window "*etable-advanced*"
                              nil
                              nil
                              (etable-draw commands-table (point))))
