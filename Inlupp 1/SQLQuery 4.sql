SELECT XMLAGG(XMLELEMENT(NAME "Resultat" , elevdata))
FROM (SELECT XMLELEMENT(NAME "Elev", 
XMLATTRIBUTES(enamn AS "namn"), 
XMLAGG(XMLELEMENT(NAME "Lokal", a.lokal))) AS elevdata
FROM elev, (SELECT DISTINCT ktillf.lokal, elev.enamn AS namn FROM 
elev, deltag, ktillf
WHERE 
deltag.sdat = ktillf.sdat AND deltag.kurs = ktillf.kurs AND elev.eid = deltag.elev) AS a
WHERE XMLEXISTS('$K//adress[@postort = "Kista"]'
				PASSING Kontakt as "K")
				    AND a.namn = elev.enamn
				    group by enamn)