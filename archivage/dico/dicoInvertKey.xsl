<?xml version="1.0" encoding="iso-8859-1"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:xalan="http://xml.apache.org/xalan"
		xmlns:java="http://xml.apache.org/xslt/java"
		xmlns:xlink="http://www.w3.org/1999/xlink"
		exclude-result-prefixes="xlink java xalan"
		version="1.0">

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:template match="/">
			<xsl:variable name="all">
				<xsl:for-each select=".//invertkey">
					<xsl:sort select="."/>
					<LI>
						<xsl:copy-of select="ancestor::entry/@id"/>
						<xsl:copy-of select="."/>
						<xsl:copy-of select="ancestor::entry/form/pron[@type='headword']"/>
					</LI>
				</xsl:for-each>
			</xsl:variable>
			<UL>
				<xsl:for-each select="xalan:distinct(xalan:nodeset($all)/LI/invertkey)">
					<LI>
						<nobr class="normal">
							<xsl:value-of select="."/>
							<xsl:variable name="ik" select="."/>
							<xsl:for-each select="xalan:nodeset($all)/LI[string(invertkey)=string($ik)]">
								<br/>
								<xsl:text>--</xsl:text>
								<a target="dico">
									<xsl:attribute name="href">dico.htm#<xsl:value-of select="translate(@id,'ELMNOYZVW','fgjxv08')"/></xsl:attribute>
									<xsl:apply-templates select="pron[@type='headword']"/>
								</a>
							</xsl:for-each>
						</nobr>
					</LI>
				</xsl:for-each>
			</UL>
		</BODY>
<xsl:template match="pron/text()">
	<span class="phonetic"><xsl:value-of select="."/></span>
</xsl:template>

<xsl:template match="foreign">
	<i><xsl:text> </xsl:text><xsl:apply-templates/></i>
</xsl:template>

</xsl:stylesheet>