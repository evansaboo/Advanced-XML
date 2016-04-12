SELECT XMLELEMENT(NAME "Resultat", XMLAGG(ktillf))
FROM
(SELECT XMLELEMENT(NAME "Kurstillfälle",
XMLATTRIBUTES(kurs.kurskod AS "kurskod", kurs.kursben AS "kursnamn", ktillf.sdat AS "startdat", ktillf.lokal AS "lokal"),
XMLFOREST(lärare.lnamn AS "Lärare", count(deltag.elev) AS "AntalElever")) as ktillf
FROM kurs INNER JOIN
     ktillf ON kurs.kurskod = ktillf.kurs INNER JOIN
     deltag ON ktillf.sdat = deltag.sdat AND ktillf.kurs = deltag.kurs
	 INNER JOIN lärare ON lärare.lid = ktillf.lärare
	 GROUP BY kurs.kurskod, kursben, ktillf.sdat, ktillf.lokal, lärare.lnamn)

