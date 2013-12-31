<?xml version="1.0" encoding="iso-8859-1"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:xlink="http://www.w3.org/1999/xlink"
		exclude-result-prefixes="xlink"
		version="1.0">

<xsl:param name="XML" select="''"/>
<xsl:variable name="host">http://lacito.archivage.vjf.cnrs.fr</xsl:variable>
<xsl:variable name="website"><xsl:value-of select="$host"/>/archives</xsl:variable>
<xsl:variable name="stylesheets"><xsl:value-of select="$website"/>/styles</xsl:variable>
<xsl:variable name="servlet"><xsl:value-of select="$host"/>:8080/servlets-examples/servlet/myxsl</xsl:variable>


<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:template match="/">
			<h3>Boyd Michailovsky</h3>
			<DL>
<!-- formatage des reponses -->
			<xsl:attribute name="name"><xsl:value-of select="translate(@id,'ELMNOYZVW','fgjxv08')"/></xsl:attribute>
		</A>

		<xsl:apply-templates select="form/pron[@type='headword']"/>
<xsl:template match="form">
				<xsl:when test="@type='prstem'"><span class="littleItal"> <br/>present stem: </span><xsl:apply-templates/></xsl:when>
				<xsl:when test="@type='pastem'"><span class="littleItal"> <br/>past stem: </span><xsl:apply-templates/></xsl:when>
				<xsl:when test="@type='fem'"><span class="littleItal"> <br/>fem: </span><xsl:apply-templates/></xsl:when>
<xsl:template match="gramGrp">
<xsl:template match="sense">
		<!-- <xsl:apply-templates select="key|sem|xptr|note"/> -->
<xsl:template match="family">
<xsl:template match="eg/link">
	<xsl:variable name="xmlfile" select="substring-before(@xlink:href,'#')"/>
	<xsl:variable name="xptr"    select="substring-after(@xlink:href,'#')"/>
	<xsl:variable name="xpath"   select="substring($xptr,10, string-length($xptr)-10)"/>
	<xsl:text> </xsl:text>(<a href="{$servlet}?XML={$xmlfile}&amp;XSL={$stylesheets}/find.xsl&amp;xpath={$xpath}&amp;level=M"><xsl:value-of select="."/></a>)
</xsl:template>

<xsl:template match="xr">
		<xsl:apply-templates select="ptr[@type='cfe']"/>

		<xsl:apply-templates select="wordFamily[(@type='cff') or (@type='cfv')]"/>
		<xsl:apply-templates select="note[@type='comm']"/>
	</div>
</xsl:template>
	<xsl:choose>
		<xsl:when test="@type='cff'"><span class="littleItal"> postfinal-related: </span><xsl:value-of select="@family"/></xsl:when>
		<xsl:when test="@type='cfv'"><span class="littleItal"> initial-related: </span><xsl:value-of select="@family"/></xsl:when>
	</xsl:choose>
</xsl:template>
<xsl:template match="xr/ptr">
		<xsl:attribute name="href">#<xsl:value-of select="translate(@target,'ELMNOYZVW','fgjxv08')"/></xsl:attribute>
		<xsl:apply-templates/>
		<xsl:attribute name="href">#<xsl:value-of select="translate(@target,'ELMNOYZVW','fgjxv08')"/></xsl:attribute>
<xsl:template match="foreign">
</xsl:stylesheet>