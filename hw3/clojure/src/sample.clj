(ns sample
  (:gen-class))

(defprotocol Interactable
  (interact-with [this other]))

(defmulti interact
  (fn [thing-1 thing-2]
    [(type thing-1) (type thing-2)]))

(defrecord Child []
  Interactable
  (interact-with [this other]
    (interact this other)))

(defprotocol Animal
  (sound [this]))

(defrecord Dog []
  Animal
  Interactable
  (sound [this] (println "bark"))
  (interact-with [this other]
    (interact this other)))

(defrecord Cat []
  Animal
  (sound [this] (println "meow")))

(defmethod interact [Dog Child]
  [_ _]
  (println "dog is nice to the child"))

(defmethod interact [Child Dog]
  [_ _]
  (println "the child plays with the dog"))

(defn talk [animal]
  (sound animal))

(defn play [this other]
  (interact-with this other))

(defn -main [& args]
  (println "Polymorphism:")
  (talk (->Dog))
  (talk (->Cat))
  (println "\nMultimethods via receiver:")
  (play (->Dog) (->Child))
  (play (->Child) (->Dog)))
