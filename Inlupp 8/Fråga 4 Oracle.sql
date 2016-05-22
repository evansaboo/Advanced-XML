SELECT XMLELEMENT(NAME "Resultat", XMLAGG(g))
FROM
(
  SELECT XMLELEMENT(NAME "Land", XMLATTRIBUTES(country as "namn"),
                    XMLAGG(XMLELEMENT(NAME "Stad", XMLATTRIBUTES(city as "namn", antal as "antalförlag" )))) g
  FROM
    (select country, city, count(*) as antal
    from bookdb.publisher
    group by country, city
    )
  group by country
)
