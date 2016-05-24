SELECT DISTINCT ag AS "företagsnamn"
FROM person,
				XMLTABLE('$I//employment' PASSING employments AS "I"
								  COLUMNS
								  ag	VARCHAR(20)	PATH '@employer')
WHERE ag NOT IN(
SELECT ag
			FROM Person INNER JOIN car ON car.owner = person.pid, 
				XMLTABLE('$I//employment' PASSING employments AS "I"
								  COLUMNS
								  ag	VARCHAR(20)	PATH '@employer')
WHERE brand = 'NISSAN')