<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html>
	    <body>
		<xsl:variable name="doc" select="document('books.xml')" />
		<h1>Böcker per originalspråk</h1> 
			<table border="1">
			<tr>
				<th>Språk</th>    
				<th>Titel</th>
				<th>Genre</th>
			</tr>
			
			<xsl:for-each select="$doc//Book/@OriginalLanguage[not(. = preceding::*/@OriginalLanguage)]"> 					
				<xsl:for-each select="$doc//Book[@OriginalLanguage = current()]"> 
					<tr>
						<xsl:if test="position() = 1">
							<td rowspan="{last()}"><xsl:value-of select="@OriginalLanguage"/></td>
						</xsl:if> 
						<td><xsl:value-of select="@Title"/></td>
						<td><xsl:value-of select="@Genre"/></td> 
					</tr>			 
				</xsl:for-each>							   
			</xsl:for-each>
			</table>
	    </body>
    </html>
</xsl:template>
</xsl:transform>