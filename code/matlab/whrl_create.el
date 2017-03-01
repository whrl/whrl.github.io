 (defun get-html-file-title (fName -beg -end)
    "Return FNAME <title> tag's text.
  Assumes that the file contains the string
  “<title>…</title>”."
					;Source: http://ergoemacs.org/emacs/elisp_link_report.html <2017-02-28 Tue>
    (with-temp-buffer
      (insert-file-contents fName nil nil nil t)
      (goto-char 1)
      (buffer-substring-no-properties
       (search-forward -beg) (- (search-forward -end) 1))
      ))

 (defun whrl-modify-html-file (fName -beg -end -replace)
    "Return FNAME <title> tag's text.
  Assumes that the file contains the string
  “<title>…</title>”."
					;Source: http://ergoemacs.org/emacs/elisp_link_report.html <2017-02-28 Tue>
(save-excursion
    (find-file fName)

      (goto-char 1)
      (delete-region
       (- (search-forward -beg) (length -beg)) (- (search-forward -end) 0))
      (insert -replace )
	      
(save-buffer)
(kill-buffer)
)
)


(defun whrl-create-html-table ()
  (setq -fileDir "c:/users/tw/Dropbox/www/whrl.github.io/code/matlab/")
  (setq -fileReg "\\.html$")
  (setq -fileTableName "index.html")
					;  (setq -fileList (find-lisp-find-files -fileDir -fileReg))
  (setq -htmlHeader "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<title></title>\n<meta  name=\"author\" content=\"T. Wöhrl\" />\n<link rel=\"stylesheet\" type=\"text/css\" href=\"theme.css\"/>\n</head>\n<body>\n<div id=\"org-div-home-and-up\"><a href=\"/\">Home</a> <a href=\"./\">Index</a>\n</div>")
  (setq -fileList (directory-files -fileDir t ".html$"))
  (setq -reg '("% created on:" "% info:"  ))
  (setq -tableHeading '("Link" "Created on"  "Shortinfo"))
  (setq -tableClosing)
  (setq -filePreamble "<html>")
  (setq -filePostamble "</body></html>")
  (save-excursion
    (find-file (concat -fileDir -fileTableName))
    (erase-buffer)
    (insert -filePreamble)
    (insert -htmlHeader)
    (insert "<table><tr>")
    (while -tableHeading
      (insert "<th>")
      (insert (pop -tableHeading))
      (insert "</th>")
      )
    (insert "</tr>")
    
    (while -fileList
      (setq -fileName (pop -fileList))
      (save-excursion
      (ignore-errors
	(whrl-modify-html-file -fileName "<head" "<body>" -htmlHeader)
	)
      (ignore-errors
	(whrl-modify-html-file -fileName "<p class=\"footer\">" "</body>" "</body>")
	))
      (insert "<tr>")
      (insert " <td><a href=\"")

      (insert (file-name-nondirectory -fileName))      
      (insert "\">")
(insert (file-name-sans-extension(file-name-nondirectory -fileName)))

       (insert " </a>")
      (insert " </td>")
      
      
      (dotimes (i (length -reg))
	(insert " <td> ")
	(ignore-errors

	  (insert (get-html-file-title -fileName (nth i -reg) "<"))
	  )
	(insert "</td>")      
	)
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
