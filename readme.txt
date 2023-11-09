
#
#
# Kevin Izevbigie (vinn@fastmail.com, twitter: @kevinize)
# https://www.thebackedengineer.com - helping business build web software.
#
#
#


Using the search API to search for data from the Stackexchange website portfolio.


## How To Use

Add an exchange website using the `make-stackexchange-defun` macro.

(make-stackexchange-defun defun-name stack-site-name)

E.G. (make-stackexchange-defun stackoverflow *link-one-key*)

This will create a stackoverflow function. To be used:

(stackoverflow :page-size "2"
               :tag-list '("common-lisp")
	       :sort "creation")

page-size = how many results will be returned
tag-list = currently only accepts one value in list

## Return value

(((TITLE
   . "Is it theoretically possible to rewrite tagbody in terms of labels?")
  (LINK
   . "https://stackoverflow.com/questions/77431504/is-it-theoretically-possible-to-rewrite-tagbody-in-terms-of-labels"))
 ((TITLE . "How to move the cursor on the editing line with cl-readline")
  (LINK
   . "https://stackoverflow.com/questions/77421618/how-to-move-the-cursor-on-the-editing-line-with-cl-readline")))

## To Do

   - Allow for multiple stack tags in tag list
   - add advanced search API






