(defrule compare-object
=>
(printout t "What do you want to compare (cartridge-case or bullet)?")
(assert (object-to-compare (read))))


(defrule comparable-ejector-mark
(object-to-compare cartridge-case)
=>
(printout t "Are the ejector marks comparable (yes or no)?")
(assert (ejector-mark-comparable (read))))


(defrule similar-ejector-mark
(and (object-to-compare cartridge-case)
(ejector-mark-comparable yes))
=>
(printout t "What is the similarity ratio of the ejector marks (high or low)?")
(assert (ejector-mark-similarity (read))))

(defrule comparable-pin-mark
(object-to-compare cartridge-case)
=>
(printout t "Are the pin marks comparable (yes or no)?")
(assert (pin-mark-comparable (read))))


(defrule similar-pin-mark
(and (object-to-compare cartridge-case)
(pin-mark-comparable yes))
=>
(printout t "What is the similarity ratio of the pin marks (high or low)?")
(assert (pin-mark-similarity (read))))

(defrule similar-breech-face
(object-to-compare cartridge-case)
=>
(printout t "What is the similarity ratio of the breech faces (high or low)?")
(assert (breech-face-similarity (read))))

(defrule comparable-set-mark
(object-to-compare bullet)
=>
(printout t "Is there a comparable set mark (yes or no)?")
(assert (set-mark-comparable (read))))


(defrule similar-set-mark
(and (object-to-compare bullet)
(set-mark-comparable yes))
=>
(printout t "Is there a highly similar set mark on the other bullet (yes or no)?")
(assert (set-mark-similarity (read))))

(defrule similar-other-set-marks
(and (object-to-compare bullet)
(set-mark-similar yes))
=>
(printout t "What is the similarity ratio when all the set marks are compared to their matching set marks taking the previously similar set mark as pivot (high or low)?")
(assert (other-set-marks-similarity (read))))

(defrule related-cartridge-cases1
(and (ejector-mark-similarity low)
(pin-mark-similarity low)
(breech-face-similarity low))
=>
(printout t "The cartridge cases are not related.")
(assert (related-cartridge-cases no)))

(defrule related-cartridge-cases2
(and (or (ejector-mark-similarity high)
(pin-mark-similarity high) )
(breech-face-similarity high))
=>
(printout t "The cartridge cases are highly probable that related, but better to consult an expert.")
(assert (related-cartridge-cases highly-probably-yes))))


(defrule related-cartridge-cases3
(and (or (ejector-mark-similarity high)
(pin-mark-similarity high) )
(breech-face-similarity low))
=>
(printout t "The cartridge cases are possible related, but better to consult an expert.")
(assert (related-cartridge-cases possibly-yes)))

(defrule related-cartridge-cases4
(and (ejector-mark-similarity low)
(pin-mark-similarity low)
(breech-face-similarity high))
=>
(printout t "The cartridge cases are possible not related, but better to consult an expert.")
(assert (related-cartridge-cases possibly-no)))

(defrule related-cartridge-cases5
(and (ejector-mark-similarity high)
(pin-mark-similarity high)
(breech-face-similarity low))
=>
(printout t "The cartridge cases are highly probably related, but consult to an expert for breech face differences.")
(assert (related-cartridge-cases highly-probably-yes))))

(defrule related-cartridge-cases6
(and (ejector-mark-similarity high)
(pin-mark-similarity high)
(breech-face-similarity high))
=>
(printout t "The cartridge cases are definitely related")
(assert (related-cartridge-cases yes)))

(defrule related-bullets1
(and (other-set-marks-similarity high)
(set-marks-similarity yes) )
=>
(printout t "The bullets are definitely related")
(assert (related-bullets yes)))

(defrule related-bullets2
(set-marks-similarity no)
=>
(printout t "The bullets are definitely not related")
(assert (related-bullets no)))