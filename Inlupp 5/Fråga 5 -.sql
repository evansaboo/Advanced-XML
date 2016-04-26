UPDATE Edition
SET Translations = XMLQUERY('
					copy $nye := $e
					modify insert node element Translation {
					attribute Language {"Norwegian"},
					attribute Publisher {"LCK"},
					attribute Price {"200"}} as last into $nye/Translations
					return $nye' PASSING Translations AS "e"
          RETURNING CONTENT)
WHERE year = (SELECT MAX(year) FROM edition where book IN(
														SELECT ID FROM book WHERE Title = 'Encore une fois')) AND book =(
														SELECT ID FROM book WHERE Title = 'Encore une fois')

