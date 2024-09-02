;; Clojure example:
;; Copy the whole thing into clj
;; And then 
;; advprpa=> (advprpa/-main)
;; Functional languages:  (Clojure Haskell Lisp)

(ns advprpa (:gen-class)) 

;; Define a map of programming languages and their paradigms 
(def languages 
    {"Clojure" "Functional", 
     "JavaScript" "Multi-paradigm", 
     "Python" "Multi-paradigm", 
     "Haskell" "Functional", 
     "Java" "Object-oriented", 
     "Lisp" "Functional"}) 

;; Function to find all languages with a specific paradigm 
(defn find-languages [languages-map paradigm] 
  (filter (fn [[lang par]] (= par paradigm)) languages-map)) 

(defn -main [& args] 
  (println "Functional languages: " 
    (map first (find-languages languages "Functional"))))
