(defrule starter-turning
=>
(printout t "Is the starter turning (yes or no)?")
(assert (starter-turning-answer (read))))


; branch starter turning: case yes 
(defrule got-any-pertrol
(starter-turning-answer yes)
=>
(printout t "Do you have any petrol (yes or no)?")
(assert (got-any-pertrol-answer (read))))

(defrule got-any-pertrol-case-yes
(got-any-pertrol-answer yes)
=>
(printout t "Call the AA." crlf))

(defrule got-any-pertrol-case-no
(got-any-pertrol-answer no)
=>
(printout t "Buy some!" crlf))


; branch starter turning: case no
(defrule lights-working
(starter-turning-answer no)
=>
(printout t "Is the light working (yes or no)?")
(assert (lights-working-answer (read))))

(defrule lights-working-case-yes
(lights-working-answer yes)
=>
(printout t "" ))
