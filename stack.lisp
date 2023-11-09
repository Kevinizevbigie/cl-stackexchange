(in-package :stack)



;;===================================================
;;-- General
;;===================================================



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
