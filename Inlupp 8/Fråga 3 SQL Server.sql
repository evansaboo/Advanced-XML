SELECT COALESCE(Genre, 'Ingen genre') as "@namn", 
		       (SELECT COUNT(*)
		        FROM BOOK
		        WHERE COALESCE(book.Genre, '0') = COALESCE(Bok.Genre, '0')) as "@antalböcker",
				(SELECT Språk
				FROM
					(SELECT c.value('@Language', 'varchar(20)') as Språk
					FROM Edition INNER JOIN BOOK ON book.id = Edition.book CROSS APPLY Translations.nodes('//Translation') AS X(c)
					WHERE  COALESCE(Bok.genre, '0') = COALESCE(Book.genre, '0')
					UNION
					(SELECT OriginalLanguage as Språk
					FROM Book
					WHERE  COALESCE(Bok.genre, '0') = COALESCE(Book.genre, '0')
					)) "*"
				FOR XML PATH(''), ELEMENTS, TYPE) "*"
FROM BOOK as Bok
GROUP BY Genre 
FOR XML PATH('Genre'), ROOT('Resultat')