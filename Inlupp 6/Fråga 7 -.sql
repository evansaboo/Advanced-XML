SELECT name "@Namn", country as "@Land", (SELECT DISTINCT c.value('@Language', 'varchar(20)') as Språk 
								FROM edition CROSS APPLY Translations.nodes('//Translation') AS X(c)
								WHERE Publisher.name = c.value('@Publisher', 'varchar(20)')
								FOR XML PATH(''), TYPE, ELEMENTS) "*" 
FROM Publisher
FOR XML PATH('Förlag'), ROOT('Resultat')