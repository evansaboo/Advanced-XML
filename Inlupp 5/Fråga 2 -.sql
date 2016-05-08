SELECT XMLELEMENT(NAME "Resultat", XMLAGG(F))
FROM
	(SELECT XMLELEMENT(NAME "Förlag", XMLATTRIBUTES(name as "Namn", Country as "Land"),
					   XMLAGG(XMLELEMENT(NAME "Bok", XMLATTRIBUTES(Title as "Titel", Genre as "Genre")))) as F	
	FROM(
		SELECT DISTINCT Name, Country, Title, Genre
		FROM book INNER JOIN
	      edition ON book.id = edition.book, Publisher,
		       XMLTABLE('$Info//@Publisher' Passing Translations AS "Info"
		      		COLUMNS
		      		Publishers		VARCHAR(20)		Path '.')
		WHERE Name = Publishers
	)
	group by name, country)