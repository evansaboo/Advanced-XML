SELECT XMLELEMENT(NAME "Resultat", XMLAGG(p))
FROM
(
	SELECT XMLELEMENT(NAME "Färg", XMLATTRIBUTES(color as "namn"), 
					  XMLAGG(XMLELEMENT(NAME "Person",
										XMLATTRIBUTES(name as "namn", antalg as "antalarbetsgivare", 
													  antalanst as "antalanställningar" )))) as p
	FROM(				  
		SELECT DISTINCT color, name,
						(
						SELECT COUNT(*)
						FROM(
						SELECT DISTINCT employer, pid
						FROM person,
						XMLTABLE('$I//@employer' PASSING employments as "I"
								 COLUMNS
								 employer		VARCHAR(20)		PATH '.'))
								 WHERE pid = p.pid
								 group by pid
								 ) as antalg,
						(
						SELECT COUNT(*)
						FROM(
						SELECT employment, pid
						FROM person,
						XMLTABLE('$I//employment' PASSING employments as "I"
								 COLUMNS
								 employment		VARCHAR(20)		PATH '.'))
								 WHERE pid = p.pid
								 group by pid
								 ) as antalanst		 
		FROM person p INNER JOIN car
		ON p.pid = car.owner
	)
	group by color
)