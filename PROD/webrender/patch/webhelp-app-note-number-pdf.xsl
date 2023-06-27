<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd" version="2.0">

    <xsl:variable name="anlist" select="doc('../build/anlist.xml')"/>

    <xsl:key name="an_id" match="an" use="@aboutid"/>

    <!-- add AN number and pdf link to title -->
    <xsl:template
        match="*[local-name() = 'main']/*[local-name() = 'article']/*[local-name() = 'article']/*[local-name() = 'h1']">
        <xsl:variable name="id" select="../*[local-name() = 'article'][1]/@id"/>
        <xsl:variable name="anmatch" select="key('an_id', $id, $anlist)"/>
        <h1>
            <xsl:if test="$anmatch">
                <xsl:value-of select="$anmatch/@number"/>
                <xsl:text>&#160;&#160;</xsl:text>
            </xsl:if>
            <xsl:apply-templates/>
            <xsl:text>&#160;&#160;</xsl:text>
            <a href="{$anmatch/@url}" target="_blank" rel="external noopener">
                <img src="oxygen-webhelp/app/img/pdf-icon.png" height="20"
                    alt="Download {$anmatch/@number} as PDF"/>
            </a>
        </h1>
    </xsl:template>

</xsl:stylesheet>
