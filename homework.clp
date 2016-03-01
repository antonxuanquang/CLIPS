; rule 1: If a patient has a very high fever, the patient has a high fever. 
(defrule high-fever
	(patient ?name)
	(very-high-fever ?name)
	=>
	(printout t ?name " is having a high fever." crlf)
	(assert (high-fever ?name))
)

; rule 2: If a patient has whooping cough, the patient has a cough. 
(defrule cough
	(patient ?name)
	(whooping-cough ?name)
	=>
	(printout t ?name " is having a cough." crlf)
	(assert (cough ?name))
)

; rule 3: If a patient has poison ivy, the patient has a rash. 
(defrule rash
	(patient ?name)
	(poison-ivy ?name)
	=>
	(printout t ?name " is having a rash." crlf)
	(assert (rash ?name))
)

; rule 4: If a patient has a high fever and congestion, the patient has the
 flu.
(defrule flu
	(patient ?name)
	(high-fever ?name)
	(congestion ?name)
	=>
	(printout t ?name " is having the flu." crlf)
	(assert (flu ?name))
)

; rule 5: If a patient has a rash and no high fever, the patient has poison
 ivy.
(defrule poison-ivy
	(patient ?name)
	(rash ?name)
	(not (high-fever ?name))
	=>
	(printout t ?name " is having poison ivy." crlf)
	(assert (poison-ivy ?name))
)


; rule 6: If a patient has a cough and a very high fever, the patient has
 whooping cough.
(defrule whooping-cough
	(patient ?name)
	(cough ?name)
	(very-high-fever ?name)
	=>
	(printout t ?name " is having whooping cough." crlf)
	(assert (whooping-cough ?name))
)

; rule 7: If a patient has no fever, no cough, and no rash, the patient is
 healthy.
(defrule healthy
	(patient ?name)
	(not (high-fever ?name))
	(not (cough ?name))
	(not (rash ?name))
	=>
	(printout t ?name " is healthy." crlf)
	(assert (healthy ?name))
)

; rule 8: If one patient has a particular disease which is contagious and
 that patient contacts another patient, then the other
 patient has the disease.

(defrule contagion
	(patient ?name)
	(contact ?another)
	(whooping-cough ?another)
	=>
	(printout t ?name "is having whooping cough as well." crlf)
	(assert (whooping-cough ?name))
)


; rule 9: If a doctor says that a patient has a particular disease or is
 healthy, then what the doctor says is true.



; rule 10: If a person says that a patient has a particular disease or is
 healthy and that is not true of the patient, then that
 person is not a doctor. 


(deffacts startup
	(patient Ed)
	(very-high-fever Ed)

	(patient Ed)
	(whooping-cough Ed)

)