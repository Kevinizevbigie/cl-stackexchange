(asdf:defsystem :stack
  :version "0.0.1"
  :license "MIT"
  :description "Search for posts from the stackexchange API"
  :author "Kevin Izevbigie"
  :depends-on ("dexador")
  :serial t
  :components ((:file "package")
               (:file "stack")))
