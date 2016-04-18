<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
	    <html>
	    <head><title>Produktionsbolag</title></head>
		    <body>
			<xsl:variable name="doc" select="document('books.xml')" />
				<xsl:for-each select="$doc//Book/@Genre[not(. = preceding::Book/@Genre)]">
					<h1><xsl:value-of select="."/></h1>
					<xsl:for-each select="$doc//Book[@Genre = current()]">
						<ul><li><xsl:value-of select="@Title"/></li></ul>
					</xsl:for-each>
				</xsl:for-each>
		    </body>
	    </html>
	</xsl:template>
</xsl:transform>