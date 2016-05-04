SELECT title AS "Titel", Originallanguage AS "Original språk", COALESCE(genre, 'N/A') AS "Genre", 
	   countEd AS "Antal upplagor",(COALESCE(countLang, 0) + 1) AS "Antal språk", 
	   countAuthor AS "Antal författare", year AS "Tidigaste upplagan"
FROM 
	(SELECT count(*) as countEd, book FROM book  INNER JOIN edition ON book.id = edition.book group by book) as editions,
	(SELECT count(*) as countAuthor, book FROM  authorship INNER JOIN book ON authorship.book = book.id group by book) as authors,
	(SELECT MIN(year) as year, book FROM  Edition group by book) as years,
book left outer join
	(SELECT count(*) as countLang, book
	 FROM
		(SELECT DISTINCT Lang, book
		FROM  edition,  XMLTABLE('$I//@Language' PASSING Translations as "I"
								 COLUMNS
								 Lang	   VARCHAR(20)		PATH '.')) 
		GROUP BY book) as langEd
		on langEd.book = book.id
where book.id = editions.book AND book.id = authors.book AND book.id = years.book