UPDATE Edition
SET Translations = XMLQUERY('transform
							copy $ NewTrans := $Trans
							modify do insert element Translation {
							attribute Language {"Norwegian"},
							attribute Publisher {"KLC"},
							attribute Price {"200"}} as last into $NewTrans/Translations
							return $NewTrans' PASSING Translations AS "Trans")
WHERE (year, book) IN (SELECT MAX(year), book.id
					  FROM edition, book 
					  WHERE book = book.id
					  AND Title = 'Encore une fois'
					  group by book.id) 