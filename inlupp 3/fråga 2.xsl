<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" />
<xsl:template match="/">
    <xsl:variable name="docBook" select="document('books.xml')" />
	<xsl:variable name="docPublisher" select="document('publishers.xml')" />
	<Resultat>
		<xsl:for-each select="$docPublisher//Publisher">
			<xsl:variable name="testBook" select="$docBook//Book[count(*//@Publisher[. = current()/@Name]) = count(*//Translation)]"/>
			<xsl:if test="count($testBook//Translation) > 0">
				<Förlag Namn="{@Name}" Land="{.//Country}">
					<xsl:for-each select="$testBook">
						<xsl:if test="count(current()//Translation) > 0">
							<Bok Namn="{@Title}" Genre="{@Genre}"/>
						</xsl:if>
					</xsl:for-each>
				</Förlag>
			</xsl:if>
		</xsl:for-each>
	</Resultat>
</xsl:template>
</xsl:transform>