XQUERY
let $a := db2-fn:sqlquery('
					SELECT XMLELEMENT(NAME "Språk", XMLATTRIBUTES(OriginalLanguage AS "namn", antal AS "antalböcker"))
					FROM
					(SELECT OriginalLanguage, Count(*) antal FROM Book GROUP BY OriginalLanguage)')
return element Resultat  {$a}