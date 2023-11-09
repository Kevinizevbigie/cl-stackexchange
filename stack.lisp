(in-package :stack)

;;===================================================
;;-- General
;;===================================================

(defvar *link-one-key* "stackoverflow" "The name of the stackoverflow website to be passed into the stackexchange query search")

(defvar *stack-key* nil)

(defun taglist-to-url (lst)
  "takes a list of tags and converts then to a semi colon delimited list to be used in a stackexchange api url"
  (unless (consp lst)
    (return-from taglist-to-url (format t "Not a list")))
  (if (> (length lst) 1)
      ;;FIXME: Add functionality for multiple tags
      t
      (first lst)))

(defun get-title-and-link (item)
  "Return an alist of stack title and url from the return JSON of stackexchange"
  (let* ((title (getf item :|title|))
	  (link (getf item :|link|)))
     `((title . ,title) (link . ,link))))

(defun make-stack-url (&key page-size tag-list sort site)
  (let ((taglist (taglist-to-url tag-list)))
    (concatenate 'string
		 "2.3/search?page=1&pagesize="
		 page-size
		 "&tagged="
		 taglist
		 "&order=desc&sort="
		 sort
		 "&site="
		 site "&key=" *stack-key*)))
;;===================================================
;;-- Caching
;;===================================================

(defvar *search-cache* (make-hash-table :size 30 :test #'equal))

(defun clear-cache ()
  (setf *search-cache* (make-hash-table :size 30 :test #'equal)))

(defun save-to-link-cache (hashkey links)
  (setf (gethash hashkey *search-cache*) links))

;;===================================================
;;-- Main Functions
;;===================================================

(defmacro make-stackexchange-defun (name site)
  "A utility to create a function that gets stackechange links based on the hashkey"
  `(defun ,name
       (&key (page-size "2") (tag-list '("common-lisp")) (sort "creation"))
     (let ((cache (gethash ,site *search-cache*)))
       (when cache
	 (return-from ,name cache))
       (let* ((api-path (make-stack-url :page-size page-size
				   :tag-list tag-list
				   :sort sort
				   :site ,site))
	      (api "https://api.stackexchange.com/")
	      (full-url (concatenate 'string api api-path))
	      (data (eighth (jonathan:parse (dexador:get full-url))))
     	      (links (mapcar #'get-title-and-link data)))
	 (save-to-link-cache ,site links)
	 (format t "Links saved to memory cache~%")
	 (format t "Links saved to db cache~%")
	 links))))

;;===================================================
;;-- Make Functions
;;===================================================

(make-stackexchange-defun stackoverflow *link-one-key*)
