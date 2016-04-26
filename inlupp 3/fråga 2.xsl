<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" />
<xsl:template match="/">
    <xsl:variable name="docBook" select="document('books.xml')" />
	<xsl:variable name="docPublisher" select="document('publishers.xml')" />
	<Resultat>
		<xsl:for-each select="$docPublisher//Publisher">
				<Förlag Namn="{@Name}" Land="{.//Country}">
					<xsl:for-each select="$docBook//Book[*//@Publisher = current()/@Name]">
					 <Book Titel="{@Title}" Genre="{@Genre}"/>
					</xsl:for-each>
				</Förlag>
		</xsl:for-each>
	</Resultat>
</xsl:template>
</xsl:transform>