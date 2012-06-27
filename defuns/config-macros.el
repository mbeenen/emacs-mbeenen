;; Macros which allow for easier Emacs configuration (i.e less boilerplate in my config)

;; Define directory local variables in a more efficient manner
(defmacro absolute-dirname (path)
  "Return the directory name portion of a path.

If PATH is local, return it unaltered.
If PATH is remote, return the remote diretory portion of the path."
  `(cond ((tramp-tramp-file-p ,path)
          (elt (tramp-dissect-file-name ,path) 3))
         (t ,path)))

(defmacro dir-locals (dir vars)
       "Set local variables for a directory.

DIR is the base diretory to set variables on.

VARS is an alist of variables to set on files opened under DIR,
in the same format as `dir-locals-set-class-variables' expects."
       `(let ((name (intern (concat "dir-locals-"
                                    ,(md5 (expand-file-name dir)))))
              (base-dir ,dir)
              (base-abs-dir ,(absolute-dirname dir)))
          (dir-locals-set-class-variables name ,vars)
          (dir-locals-set-directory-class ,dir name nil)))
