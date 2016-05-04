SELECT XMLELEMENT(NAME "Resultat", XMLAGG(F))
FROM
(
	SELECT XMLELEMENT(NAME "Förlag", XMLATTRIBUTES(name as "Namn", Country as "Land"),
						 XMLAGG(XMLELEMENT(NAME "Språk", Lang))) as F
	FROM
	(SELECT DISTINCT name, country, Lang
		FROM edition, Publisher, 
		      XMLTABLE('$Info//Translation' Passing Translations AS "Info"
		      			COLUMNS
		      			Publishers		VARCHAR(20)		Path '@Publisher',
		      			Lang			VARCHAR(20)		Path '@Language'
		      			)
	WHERE Name = Publishers)
	GROUP BY Country, name)