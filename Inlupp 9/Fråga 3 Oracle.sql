SELECT XMLELEMENT(NAME "Resultat", XMLAGG(p))
FROM(
	SELECT XMLELEMENT(NAME "Märke", XMLATTRIBUTES(brand as "namn"), 
					  XMLAGG(XMLELEMENT(NAME "Företag", XMLATTRIBUTES(ag as "namn", antal as "antalanställdabilägare")))) p
	FROM(				  
		SELECT brand, ag, count(*) as antal
		FROM(
			SELECT DISTINCT brand, ag, pid
			FROM Person INNER JOIN car ON car.owner = person.pid, 
				XMLTABLE('$I//employment' PASSING employments AS "I"
								  COLUMNS
								  ag	VARCHAR(20)	PATH '@employer')
								  )
		group by brand, ag
	)
	group by brand
)