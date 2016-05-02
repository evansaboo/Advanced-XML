SELECT XMLELEMENT(NAME "Resultat", XMLAGG(F))
FROM
(
SELECT XMLELEMENT(NAME "Förlag", XMLATTRIBUTES(name as "Namn", Country as "Land"),
					 XMLAGG(XMLELEMENT(NAME "Språk", Lang))) as F
FROM
(SELECT DISTINCT name, country, Lang
	FROM book INNER JOIN
	      edition ON book.id = edition.book, Publisher, 
	      XMLTABLE('$Info//Translation' Passing Translations AS "Info"
	      			COLUMNS
	      			Publishers		VARCHAR(20)		Path '@Publisher',
	      			Lang			VARCHAR(20)		Path '@Language'
	      			)
	WHERE Name = Publishers)
	group by Country, name)


SELECT DISTINCT name, country, c.value('@Language', 'varchar(20)')
	FROM book INNER JOIN
	      edition ON book.id = edition.book CROSS APPLY Translations.nodes('//Translation') AS X(c), Publisher
	WHERE Name = c.value('@Publisher', 'varchar(20)')
ORDER BY name
FOR XML AUTO