SELECT DISTINCT name "Namn", eCountry as "Land"     
FROM            
author INNER JOIN
       authorship ON author.id = authorship.author INNER JOIN
       edition ON authorship.book = edition.book,
       XMLTABLE('$I//Country' PASSING Info as "I"
	      	    COLUMNS
	      	    eCountry	VARCHAR(20)		PATH '.')
WHERE XMLEXISTS('$T//@Language[. = "Russian"]' PASSING Translations as "T")