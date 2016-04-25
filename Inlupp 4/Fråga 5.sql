UPDATE Edition
SET Translations = XMLQUERY('
					transform
					copy $nye := $e
					modify do insert element Translation {
					attribute Language {"Norwegian"},
					attribute Publisher {"LCK"},
					attribute Price {"200"}} as last into $nye/Translations
					return $nye' PASSING Translations AS "e")
WHERE year = (SELECT MAX(year) FROM edition where book IN(
														SELECT ID FROM book WHERE Title = 'Encore une fois')) AND book =(
														SELECT ID FROM book WHERE Title = 'Encore une fois')
