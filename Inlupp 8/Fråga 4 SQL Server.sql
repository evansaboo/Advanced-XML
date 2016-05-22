select country as "@namn", (SELECT city as "@namn", count(*) as "@antalförlag" 
							from publisher 
							where country = p.country 
							group by city 
							FOR XML PATH('Stad'), TYPE) "*"
from publisher as p
group by country
FOR XML PATH('Land'), ROOT('Resultat')
