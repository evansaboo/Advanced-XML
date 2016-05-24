SELECT DISTINCT c.value('.', 'varchar(20)') as företagsnamn
FROM person CROSS APPLY employments.nodes('//@employer') AS X(c)
WHERE c.value('.', 'varchar(20)') NOT IN(
										SELECT c.value('.', 'varchar(20)')
										FROM Person INNER JOIN car ON car.owner = person.pid
											 CROSS APPLY employments.nodes('//@employer') AS X(c)
WHERE brand = 'NISSAN')