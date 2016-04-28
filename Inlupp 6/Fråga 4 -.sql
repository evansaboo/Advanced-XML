SELECT DISTINCT name as Namn,  c.value('.', 'varchar(20)') as Land
FROM            
author INNER JOIN
       authorship ON author.id = authorship.author INNER JOIN
       book ON authorship.book = book.id INNER JOIN
       edition ON book.id = edition.book CROSS APPLY Info.nodes('//Country') AS X(c)
WHERE Translations.exist('//@Language[. = "Russian"]') = 1