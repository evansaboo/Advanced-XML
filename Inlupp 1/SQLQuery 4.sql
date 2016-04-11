SELECT s.enamn as [Elev/@namn],(
SELECT DISTINCT ktillf.lokal as Lokal FROM ktillf
     INNER JOIN deltag 
		ON deltag.sdat = ktillf.sdat AND deltag.kurs = ktillf.kurs
		WHERE s.eid = deltag.elev
	FOR XML PATH(''), TYPE
) as [Elev]
FROM elev s
WHERE kontakt.exist('//adress[@postort = "Kista"]') = 1
FOR XML PATH(''), ROOT('Resultat')



SELECT XMLELEMENT(NAME "Elev", 
XMLATTRIBUTES(enamn AS "namn"), 
XMLELEMENT(NAME "Lokal", ktillf.lokal))
FROM elev INNER JOIN
     deltag ON elev.eid = deltag.elev INNER JOIN
     ktillf ON deltag.sdat = ktillf.sdat AND deltag.kurs = ktillf.kurs
WHERE XMLEXISTS('$K//adress[@postort = "Kista"]'
				PASSING Kontakt as "K")
				    