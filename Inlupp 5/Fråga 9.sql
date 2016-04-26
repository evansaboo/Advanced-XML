XQUERY
let $a := db2-fn:sqlquery('
SELECT XMLELEMENT(NAME "Språk", XMLATTRIBUTES(OriginalLanguage AS "Namn", AntalSpråk AS "AntalSpråk"))
FROM
(SELECT OriginalLanguage, Count(*) AntalSpråk FROM Book GROUP BY OriginalLanguage)')
return element Resultat  {$a}