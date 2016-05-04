UPDATE Edition
SET Translations = XMLQUERY('transform
							copy $ NewTrans := $Trans
							modify do insert element Translation {
							attribute Language {"Norwegian"},
							attribute Publisher {"KLC"},
							attribute Price {"200"}} as last into $NewTrans/Translations
							return $NewTrans' PASSING Translations AS "Trans")
WHERE year = (SELECT MAX(year) 
			  FROM edition 
			  where book IN(SELECT ID FROM book WHERE Title = 'Encore une fois')) 
							AND book =(SELECT ID FROM book WHERE Title = 'Encore une fois')