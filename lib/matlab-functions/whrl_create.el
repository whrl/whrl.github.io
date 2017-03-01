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
  (setq -fileDir "c:/users/tw/Dropbox/www/whrl.github.io/lib/matlab-functions/")
  (setq -fileReg ".html$")
  (setq -fileTableName "index.html")
					;  (setq -fileList (find-lisp-find-files -fileDir -fileReg))
  (setq -htmlHeader "<?xml version=\"1.0\" encoding=\"utf-8\"?> <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"en\" xml:lang=\"en\"><head>\n<title></title>\n<meta  name=\"author\" content=\"T. Woehrl\" />\n<link rel=\"stylesheet\" type=\"text/css\" href=\"theme.css\" />\n</head>\n<body>\n<div id=\"org-div-home-and-up\"><a href=\"/\">Home</a> <a href=\"./\">Index</a>\n</div>\n<div><br/>Collection of m-files.\n<br/>\n<br/></div>")
  (setq -fileList (directory-files -fileDir t -fileReg))
  (setq -reg '("% created on:" "% info:"  ))
  (setq -tableHeading '("Link" "Created on"  "Shortinfo"))
  (setq -tableClosing)
  (setq -filePreamble "<html>")
  (setq -filePostamble "</body></html>")
  (save-excursion
    (find-file (concat -fileDir -fileTableName))
    (erase-buffer)
    ;(insert -filePreamble)
    (insert -htmlHeader)
    (insert "<div><table><thead><tr>")
    (while -tableHeading
      (insert "<th>")
      (insert (pop -tableHeading))
      (insert "</th>")
      )
    (insert "</tr></thead><tbody>")
    
    (while -fileList
      
      (setq -fileName (pop -fileList))
      (if   (equal (file-name-nondirectory -fileName) "index.html")
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
      ))
    (insert "</tbody></table></div>")
    (insert -filePostamble)
    (save-buffer)
    (kill-buffer)
    )
  (browse-url "index.html")
)

(defun whrl-modify-html-matlab ()
    (setq -fileDir "c:/users/tw/Dropbox/www/whrl.github.io/lib/matlab-functions/")
    (setq -htmlHeader "<?xml version=\"1.0\" encoding=\"utf-8\"?> <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"en\" xml:lang=\"en\"><head>\n<title></title>\n<meta  name=\"author\" content=\"T. Woehrl\" />\n<link rel=\"stylesheet\" type=\"text/css\" href=\"theme.css\" />\n</head>\n<body>\n<div id=\"org-div-home-and-up\"><a href=\"/\">Home</a> <a href=\"./\">Index</a>\n</div>")
  (setq -fileList (directory-files -fileDir t ".html$"))

(while -fileList
      (setq -fileName (pop -fileList))

      (save-excursion
	(find-file -fileName)
	(beginning-of-buffer)
	(ignore-errors
	(when (search-forward "DTD HTML 4.01 Transitional")
	(delete-region (goto-char 1) (search-forward "<body>"))
	(insert -htmlHeader)
	)
	(goto-char (point-max))
	)
	(ignore-errors
	(when (search-backward "<p class=\"footer\">")
	      (delete-region (point) (point-max)
			     )
	      (insert "´\n</div>\n</body>\n</html>")
	      ))
	
	
(save-buffer)
(kill-buffer)))

;      (ignore-errors
;	(whrl-modify-html-file -fileName "<!DOCTYPE html\n PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">" "</head>" -htmlHeader)
;	)
 ;     (ignore-errors
;	(whrl-modify-html-file -fileName "<p class=\"footer\">" "</body>" "</div>\n</body>")
;	)
 ;     ))
)


(whrl-create-html-table)

(whrl-modify-html-matlab)