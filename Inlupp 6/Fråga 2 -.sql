SELECT DISTINCT Name as Namn, Country as Land, Title as Titel, Genre
	FROM book as Bok INNER JOIN
	      edition ON Bok.id = edition.book CROSS APPLY Translations.nodes('//Translation') AS X(c), Publisher as Förlag
	WHERE Name = c.value('@Publisher', 'varchar(20)')
	order by Namn
FOR XML AUTO, ROOT('Resultat')