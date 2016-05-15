SELECT DISTINCT name as Namn,  Info.value('(//Country)[1]', 'varchar(20)') as Land
FROM            
author INNER JOIN
       authorship ON author.id = authorship.author INNER JOIN
       edition ON authorship.book = edition.book
WHERE Translations.exist('//@Language[. = "Russian"]') = 1