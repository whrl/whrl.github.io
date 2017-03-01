(defun whrl-create-html-table ()



  
  (defun get-html-file-title (fName -beg -end)
    "Return FNAME <title> tag's text.
  Assumes that the file contains the string
  “<title>…</title>”."
					;http://ergoemacs.org/emacs/elisp_link_report.html <2017-02-28 Tue>
    (with-temp-buffer
      (insert-file-contents fName nil nil nil t)
      (goto-char 1)
      (buffer-substring-no-properties
       (search-forward -beg) (- (search-forward -end) 1))
      ))



  (setq -fileDir "c:/users/tw/Dropbox/lib/matlab_whrl/")
  (setq -fileReg "\\.m$")
  (setq -fileTableName "index.html")
					;  (setq -fileList (find-lisp-find-files -fileDir -fileReg))

  (setq -fileList (directory-files -fileDir t ".m$"))
  (setq -reg '("\n% Author:" "\n% Created:" "function"))
  (setq -tableHeading '("Author" "Created" "Function" "Filename"))
  (setq -tableClosing)
  (setq -filePreamble "<html>")
  (setq -filePostamble "</html>")
  (save-excursion
    (find-file (concat -fileDir -fileTableName))
    (erase-buffer)
    (insert -filePreamble)  
    (insert "<table><tr>")
    (while -tableHeading
      (insert "<th>")
      (insert (pop -tableHeading))
      (insert "</th>")
      )
    (insert "</tr>")
    
    (while -fileList
      (setq -fileName (pop -fileList))
      
      (insert "<tr>")
      (dotimes (i (length -reg))
	(insert " <td> ")
	(ignore-errors

	  (insert (get-html-file-title -fileName (nth i -reg) "\n"))
	  )
	(insert "</td>")      
	)
      (insert " <td> ")
      (insert (file-name-nondirectory -fileName))
      (insert " </td>")
      (insert "</tr>")
      )
    (insert "</table>")
    (insert -filePostamble)
    (save-buffer)
    (kill-buffer)
    )
  (browse-url "index.html")
  )
(whrl-create-html-table)
