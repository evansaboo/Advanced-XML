SELECT e.
FROM(
SELECT XMLQUERY('for $a in $e
return element Kurslängd {attribute antalveckor{$a//längd}}'
PASSING Info AS "e") as e
				FROM Kurs)