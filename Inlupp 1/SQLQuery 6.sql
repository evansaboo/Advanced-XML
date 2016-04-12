SELECT XMLELEMENT(NAME"Resultat", XMLAGG(kurslängd))
FROM
(SELECT XMLELEMENT(NAME "Kurslängd", XMLATTRIBUTES(längder AS "antalveckor", (SUM(snitt)/COUNT(snitt)) as "snittpris")) AS kurslängd
FROM
				(
				SELECT XMLCAST(XMLQUERY('$e//längd'
PASSING Info AS "e") as INTEGER) as längder, XMLCAST(XMLQUERY('$e//pris'
PASSING Info AS "e") as INTEGER) as snitt
FROM Kurs)
group by längder)
