<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd" version="2.0">

    <!-- patch badly chunked web content -->

    <xsl:template match="/">
        <xsl:variable name="badchunktopic"
            select="(//*[local-name() = 'a' and contains(@class, ' topic/xref ') and starts-with(text()[1], 'Chunk')])[1]/substring-before(@href, '#')"/>
        <xsl:apply-templates>
            <xsl:with-param name="badchunk" select="$badchunktopic" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>


    <!-- patch broken chunks -->
    <xsl:template match="*[local-name() = 'a' and contains(@class, ' topic/xref ') and starts-with(@href, 'Chunk')]">
        <xsl:param name="badchunk"/>

        <a>
            <xsl:choose>
                <xsl:when test="starts-with(@href, $badchunk)">
                    <xsl:variable name="chunkid" select="substring-after(@href, '#')"/>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="href" select="concat('#', $chunkid)"/>
                    <xsl:choose>
                        <!-- 'chunk' in generated link text -->
                        <xsl:when test="starts-with(text()[1], 'Chunk')">
                            <xsl:apply-templates
                                select="//*[local-name() = ('figure', 'article') and @id = $chunkid]/*[1]/node()"
                            />
                        </xsl:when>
                        <!-- link text hardcoded in dita -->
                        <xsl:otherwise>
                            <xsl:apply-templates select="node()"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- good chunk reference -->
                <xsl:otherwise>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:otherwise>
            </xsl:choose>
        </a>
    </xsl:template>

</xsl:stylesheet>
