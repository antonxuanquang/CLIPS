(deftemplate personal-data
	(slot name)
	(slot age)
	(slot weight)
	(slot height)
	(multislot blood-pressure)
)

(deffacts people
	(personal-data (name Andrew) (age 20) (weight 80)
					(height 188) (blood-pressure 130 80))
	(personal-data (name Cyril) (age 63) (weight 70)
					(height 167) (blood-pressure 180 90))
)

(defrule birthday
	?birthday <- (birthday ?name)
	?data-fact <- (personal-data (name ?name) (age ?age))
	=>
	(modify ?data-fact (age (+ ?age + 1)))
	(retract ?birthday)
)

(defrule lardy-bugger
	(personal-data (name ?name) (weight ?weight))
	(test (> ?weight 100))
	=>
	(printout t ?name " weighs " ?weight " - the fat sod." crlf)
)

(defrule print-ages
	(personal-data (name ?name) (age ?age))
	=>
	(printout t ?name " is " ?age " years old." crlf)
)