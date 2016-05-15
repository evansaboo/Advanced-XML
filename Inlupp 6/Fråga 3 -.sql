SELECT name AS Namn,  Info.value('(//Country)[1]', 'varchar(20)') as Land , title as Titel, OriginalLanguage as OriginalSpråk, Genre
	FROM  author as Författare INNER JOIN 
	      authorship ON Författare.id = authorship.author INNER JOIN
	      book as Bok ON authorship.book = Bok.id
FOR XML AUTO, ROOT('Alla')