SELECT elev.enamn as Namn, namn
FROM elev, Lokal
WHERE kontakt.exist('//adress[@postort = "Kista"]') = 1
FOR XML AUTO, ROOT('Resultat')