(in-package :cl-user)
(defpackage :stack
 (:use :cl)
 (:export #:stackoverflow
	  #:*search-cache*
	  #:*stack-key*
	  #:clear-cache))
