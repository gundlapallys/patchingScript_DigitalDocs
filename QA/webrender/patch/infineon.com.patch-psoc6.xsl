<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd"
    version="2.0">

    <xsl:import href="patch-common.xsl"/>
    <xsl:import href="webhelp-remove-draft.xsl"/>
    <xsl:import href="webhelp-patch-bad-chunking.xsl"/>
    <xsl:import href="webhelp-app-note-number-pdf.xsl"/>

</xsl:stylesheet>