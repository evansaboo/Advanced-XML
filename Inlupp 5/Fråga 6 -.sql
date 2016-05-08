SELECT title AS "Titel", Originallanguage AS "Original språk", COALESCE(genre, 'N/A') AS "Genre", 
	   countEd AS "Antal upplagor",(COALESCE(countLang, 0) + 1) AS "Antal språk", 
	   countAuthor AS "Antal författare", years AS "Tidigaste upplagan"
FROM 
	(SELECT count(*) as countEd, MIN(year) as years, book FROM EDITION group by book) editions,
	(SELECT count(*) as countAuthor, book FROM Authorship group by book) authors,
book left outer join
	(SELECT count(*) as countLang, book
	 FROM
		(SELECT DISTINCT Lang, book
		FROM  edition,  XMLTABLE('$I//@Language' PASSING Translations as "I"
								 COLUMNS
								 Lang	   VARCHAR(20)		PATH '.')) 
		GROUP BY book) langEd
		on langEd.book = book.id
where book.id = editions.book AND book.id = authors.book