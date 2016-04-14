SELECT XMLAGG(XMLELEMENT(NAME "Resultat" , elevdata))
FROM (SELECT XMLELEMENT(NAME "Elev", 
XMLATTRIBUTES(a.namn AS "namn"), 
XMLAGG(XMLELEMENT(NAME "Lokal", a.lokal))) AS elevdata
FROM (SELECT DISTINCT ktillf.lokal, elev.enamn AS namn FROM 
elev, deltag, ktillf
WHERE 
deltag.sdat = ktillf.sdat AND deltag.kurs = ktillf.kurs AND elev.eid = deltag.elev
AND XMLEXISTS('$K//adress[@postort = "Kista"]'
				PASSING Kontakt as "K")) as a
				    group by namn)