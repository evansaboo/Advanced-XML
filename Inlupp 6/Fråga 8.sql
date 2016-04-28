UPDATE Edition
SET Translations = XMLQUERY('
					transform
					copy $x := $e
					modify do replace value of $x//Translation[@Language = "French"]/../@Publisher[. = "KLC"] with "ABC International"
					return $x' PASSING Translations AS "e")
WHERE year = 1999 AND book =(SELECT ID FROM book WHERE Title = 'Archeology in Egypt')