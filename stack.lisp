(in-package :stack)



;;===================================================
;;-- General
;;===================================================

(defvar *link-one-key* "stackoverflow" "The name of the stackoverflow website to be passed into the stackexchange query search")


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
