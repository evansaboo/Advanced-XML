SELECT title AS "Titel", Originallanguage AS "Original språk", COALESCE(genre, 'N/A') AS "Genre", 
	   countEd AS "Antal upplagor",(COALESCE(countLang, 0) + 1) AS "Antal språk", 
	   countAuthor AS "Antal författare", years AS "Tidigaste upplagan"
FROM 
	(SELECT count(*) as countEd, MIN(year) as years, book FROM EDITION group by book) as editions,
	(SELECT count(*) as countAuthor, book FROM Authorship group by book) as authors,
book left outer join
	(SELECT count(*) as countLang, book
	 FROM
		(SELECT distinct  book, c.value('@Language', 'varchar(20)') AS Lang
		FROM edition CROSS APPLY Translations.nodes('//Translation') AS X(c)) as Bok
		group by book) as langEd
		on langEd.book = book.id
where book.id = editions.book AND book.id = authors.book