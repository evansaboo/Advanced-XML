UPDATE Edition
SET Translations.modify('insert <Translation Language="Norwegian"
Publisher="KLC" Price="200"/> as last into (//Translations)[1]')
WHERE EXISTS(SELECT year, book
					  FROM edition e, book 
					  WHERE book = book.id
					  AND Title = 'Encore une fois'
					  AND Edition.book = book
					  AND Edition.year > e.year)