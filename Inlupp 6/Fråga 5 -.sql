UPDATE Edition
SET Translations.modify('insert <Translation Language="Norwegian"
Publisher="KLC" Price="200"/> as last into (//Translations)[1]')
WHERE year in (SELECT MAX(year)
			   FROM Edition ed
			   WHERE ed.book = Edition.book)
			   AND book IN (SELECT ID FROM Book WHERE Title = 'Encore une fois')