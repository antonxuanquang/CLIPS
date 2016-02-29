(deffacts startup
	(member-of beatles john_lennon paul_mccartney george_harrison ringo_starr)
	(member-of who roger_daltrey pete_townsend keith_moon)
	(member-of ebtg tracey_thorn ben_watt))

(defrule bands
	(member-of ?band $?)
	=>
	(printout t "There is a band called " ?band crlf))

(defrule band-members
	(member-of ?band $? ?member $?)
	=>
	(printout t ?member " is a member of " ?band crlf))

(defrule band-members-2
	(member-of ?band $?members)
	=>
	(printout t "The members of " ?band " are " $?members crlf))


(defrule addup
	(number ?x)
	(number ?y)
	=>
	(bind ?total (+ ?x ?y))
	(printout t ?x " + " ?y " = " ?total crlf)
	(assert (total ?total)))