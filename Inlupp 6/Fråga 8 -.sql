UPDATE Edition
SET Translations.modify('replace value of (//Translation[@Language = "French"]/@Publisher[. = "KLC"])[1] with "ABC International"')
WHERE year = 1999 AND book =(SELECT ID FROM book WHERE Title = 'Archeology in Egypt')