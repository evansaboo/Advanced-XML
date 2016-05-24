SELECT Märke.brand as namn, namn, count(*) as antalanställningar
		FROM(
			SELECT DISTINCT brand, c.value('@employer', 'varchar(20)') namn, pid
			FROM Person INNER JOIN car ON car.owner = person.pid CROSS APPLY employments.nodes('//employment') AS X(c)
	) Företag,
	(SELECT DISTINCT brand, owner from car) Märke
	WHERE Märke.owner = Företag.pid
	AND  Märke.brand = Företag.brand
	GROUP BY Märke.brand, namn
	ORDER BY Märke.brand
FOR XML AUTO, ROOT('Resultat')