(asdf:defsystem :stack
  :version "0.0.1"
  :license "MPL-2.0"
  :description "Search for posts from the stackexchange API"
  :author "Kevin Izevbigie"
  :depends-on ("dexador")
  :serial t
  :components ((:file "package")
               (:file "stack")))
