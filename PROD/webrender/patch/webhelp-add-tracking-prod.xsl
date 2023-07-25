<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd" version="2.0">

    <xsl:template match="*[local-name() = 'head']">
        <head>
            <xsl:apply-templates select="@* | node()"/>
            <xsl:comment>QA OneTrust Cookies And GTM Strat</xsl:comment>
            <script crossorigin="anonymous" type="text/javascript" src="https://gundlapallys.github.io/openDocsServices/gtm_dynamic_load_script.js"/>
<link rel="stylesheet" type="text/css" href="https://gundlapallys.github.io/openDocsServices/show_community_after_search.css"/>
    <script type="text/javascript" src="https://gundlapallys.github.io/openDocsServices/show_community_after_search.js" async="true" />
            <xsl:comment>QA OneTrust Cookies And GTM End</xsl:comment> 
<xsl:comment>QA CoveoSearchPop Starts</xsl:comment>
      
     <xsl:comment> Coveo In-Product Experience</xsl:comment>

<script type="text/javascript" src="https://platform-eu.cloud.coveo.com/rest/organizations/infineontechnologiesproduction6kx2o63f/pages/2d518574-423d-4062-b32c-17ef1538c839/inappwidget/loader" async="true" ></script>

<xsl:comment>End Coveo In-Product Experience</xsl:comment>
<style>
    coveo-in-app-widget-loader::part(button) {
          width: 200px;
          background-image: linear-gradient(#0a8276, #0a8276);
          justify-content: flex-start;
    }
    coveo-in-app-widget-loader::part(button):before {
          background-image: linear-gradient(#0a8276, #0a8276);
    }
    coveo-in-app-widget-loader::part(button):hover:before {
          background-image: linear-gradient(#0a8276, #0a8276);
    }
    coveo-in-app-widget-loader::part(button-text) {
          color: #fff;
          background-image: linear-gradient(#0a8276, #0a8276);
          overflow: initial;
    }
</style>

<script>

  window.addEventListener('load', function() {
    const title = document.querySelector('.title').textContent;
    console.log('title: ', title);
    CoveoInProduct.setContext({
      searchTerm: title,
    });
  });

   </script>
      <xsl:comment>QA CoveoSearchPop End</xsl:comment>
        </head>

    </xsl:template>

</xsl:stylesheet>
