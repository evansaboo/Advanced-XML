SELECT kurs.kurskod[Kurstillfälle/@kurskod], kursben [Kurstillfälle/@kursnamn], ktillf.sdat [Kurstillfälle/@startdatum], 
ktillf.lokal [Kurstillfälle/@lokal], lärare.lnamn [Kurstillfälle/Lärare], COUNT(deltag.elev) [Kurstillfälle/AntalElever]

FROM kurs INNER JOIN
     ktillf ON kurs.kurskod = ktillf.kurs INNER JOIN
     deltag ON ktillf.sdat = deltag.sdat AND ktillf.kurs = deltag.kurs
	 INNER JOIN lärare ON lärare.lid = ktillf.lärare
	 GROUP BY kurs.kurskod, kursben, ktillf.sdat, ktillf.lokal, lärare.lnamn
FOR XML PATH(''), ROOT('Resultat')
