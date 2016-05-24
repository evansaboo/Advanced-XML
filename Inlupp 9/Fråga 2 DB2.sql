SELECT arbetsgivare, name, 
				(DAYS(COALESCE(end, CURRENT DATE))-DAYS(start)) as anställningslängd, 
				count(licencenumber) as antalbilar
FROM Person LEFT OUTER JOIN CAR ON car.owner = person.pid, 
	XMLTABLE('$I//employment' PASSING employments AS "I"
					  COLUMNS
					  arbetsgivare	VARCHAR(20)	PATH '@employer',
					  start			VARCHAR(20)	PATH '@startdate',
					  end			VARCHAR(20)	PATH '@enddate')
group by arbetsgivare, name, start, end
--------------------------------------------

ELLER

--------------------------------------------
SELECT arbetsgivare, name, 
				(DAYS(COALESCE(end, CURRENT DATE))-DAYS(start)) as anställningslängd, 
				(SELECT COUNT(licencenumber) FROM car where car.owner = p.pid) as antalbilar
FROM Person p,
	XMLTABLE('$I//employment' PASSING employments AS "I"
					  COLUMNS
					  arbetsgivare	VARCHAR(20)	PATH '@employer',
					  start			VARCHAR(20)	PATH '@startdate',
					  end			VARCHAR(20)	PATH '@enddate')
