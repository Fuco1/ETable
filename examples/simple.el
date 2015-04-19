(let ((commands-table (etable-create-table [["forward-char"   "Move point right N characters"   "C-f"]
                                            ["backward-char"  "Move point left N characters"    "C-b"]])))
  (with-current-buffer-window "*etable-simple*"
                              nil
                              nil
                              (etable-draw commands-table (point))))
