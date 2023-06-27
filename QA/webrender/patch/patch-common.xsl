<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd"
    version="2.0">
    <!-- common processing for all patch processing -->

    <!-- directory to process. Must be in form: file://... -->
    <xsl:param name="directory"/>

    <!-- identity transform -->
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

    <!-- process a directory of content -->
    <xsl:template name="patchdir">
        <xsl:variable name="options" select="';recurse=no;on-error=warning'"/>
        <xsl:for-each select="collection(concat($directory,'/?select=*.html',$options))">
            <xsl:result-document href="{document-uri(.)}" method="xhtml" omit-xml-declaration="yes">
<!--                <xsl:message select="concat('  ',document-uri(.))"/>-->
                <xsl:call-template name="generateDoctype"/>
                <xsl:apply-templates/>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <!-- add doctype back to output -->
    <xsl:template name="generateDoctype">
        <xsl:value-of select="concat('&#10;',replace(translate(unparsed-text(base-uri(.)),'&#xa;&#xd;',''),'^.*(&lt;!DOCTYPE[^&lt;]*>).*','$1'),'&#10;')" disable-output-escaping="yes"/>
    </xsl:template>

</xsl:stylesheet>