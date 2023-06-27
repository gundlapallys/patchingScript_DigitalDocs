<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd" version="2.0">

    <xsl:import href="patch/anlist.xsl"/>

    <xsl:template match="/">
        <ans>
            <xsl:for-each select="//DownloadUrl">
                <xsl:variable name="url" select="."/>
                <xsl:if test="contains($url, '-EN.pdf')">
                    <xsl:for-each select="$ans/an">
                        <xsl:if test="contains($url, ./@number)">
                            <an number="{./@number}" aboutid="{./@aboutid}" url="{$url}"/>
                            <xsl:value-of select="'&#x0a;'"/>
                        </xsl:if>
                    </xsl:for-each>

                </xsl:if>
            </xsl:for-each>
        </ans>
    </xsl:template>
</xsl:stylesheet>
