SELECT title AS "Titel", Originallanguage AS "Original språk", Genre, 
	   countEd AS "Antal upplagor",(countLang + 1) AS "antal språk", 
	   countAuthor AS "Antal författare", years AS "Tidigaste upplagan"
FROM book,
	(SELECT count(*) as countEd, book FROM book  INNER JOIN edition ON book.id = edition.book group by book) as editions,
	(SELECT count(*) as countAuthor, book FROM  authorship INNER JOIN book ON authorship.book = book.id group by book) as authors,
	(SELECT count(*) as countLang, book, MIN(year) as years
	 FROM
		(SELECT distinct  book, c.value('@Language', 'varchar(20)') AS Lang, year 
		FROM edition CROSS APPLY Translations.nodes('//Translation') AS X(c)) as Bok
		group by book) as langEd
where book.id = editions.book AND book.id = authors.book AND book.id = langEd.book