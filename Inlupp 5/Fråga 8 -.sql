UPDATE Edition
SET Translations = XMLQUERY('
					copy $x := $e
					modify replace value of node $x//Translation[@Language = "French"]/@Publisher[string(.) = "KLC"] with "ABC International"
					return $x' PASSING Translations AS "e"
          RETURNING CONTENT)
WHERE year = 1999 AND book =(SELECT ID FROM book WHERE Title = 'Archeology in Egypt')