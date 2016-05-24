SELECT c.value('@employer', 'varchar(20)') as arbetsgivare, name, 
				DATEDIFF(day, c.value('@startdate', 'varchar(20)'), COALESCE(c.value('@enddate', 'varchar(20)'), GETDATE()))as anställningslängd,
				(SELECT COUNT(licencenumber) FROM car where car.owner = p.pid) as antalbilar
				
FROM Person p
	 CROSS APPLY employments.nodes('//employment') AS X(c)