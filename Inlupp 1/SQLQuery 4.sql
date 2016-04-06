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

