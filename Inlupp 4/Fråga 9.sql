XQUERY
let $a := db2-fn:sqlquery('
					SELECT XMLELEMENT(NAME "Språk", XMLATTRIBUTES(OriginalLanguage AS "namn", Count(*) AS "antalböcker"))
				     FROM Book GROUP BY OriginalLanguage')
return element Resultat  {$a}