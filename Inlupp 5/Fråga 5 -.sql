UPDATE Edition
SET Translations = XMLQUERY('
					copy $nye := $e
					modify insert node element Translation {
					attribute Language {"Norwegian"},
					attribute Publisher {"KLC"},
					attribute Price {"200"}} as last into $nye/Translations
					return $nye' PASSING Translations AS "e"
          RETURNING CONTENT)
WHERE (year, book) IN (SELECT MAX(year), book.id
					  FROM edition, book 
					  WHERE book = book.id
					  AND Title = 'Encore une fois'
					  group by book.id) 