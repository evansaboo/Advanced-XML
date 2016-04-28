SELECT XMLQUERY('element Resulat {
                for $l in distinct-values(ora:view("Book")//ORIGINALLANGUAGE/text())
                let $count := count(ora:view("Book")//ORIGINALLANGUAGE[text() = $l])
                return element Språk{attribute namn{$l}, attribute antalböcker{$count}}
                }'
                RETURNING CONTENT)
FROM DUAL