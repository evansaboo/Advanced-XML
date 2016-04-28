UPDATE Edition
SET Translations.modify('insert <Translation Language="Norwegian"
Publisher="KLC" Price="200"/> as last into (//Translations)[1]')
WHERE year = (SELECT MAX(year) FROM edition where book IN(
														SELECT ID FROM book WHERE Title = 'Encore une fois'))
														AND book IN(
														SELECT ID FROM book WHERE Title = 'Encore une fois')