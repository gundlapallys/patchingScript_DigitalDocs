<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd" version="2.0">

    <xsl:template match="*[local-name() = 'head']"><head><xsl:apply-templates select="@* | node()"/>
    <xsl:comment>QA OneTrust Cookies And GTM Strat</xsl:comment>
    <!-- Script to be used in staging -->
    <script crossorigin="anonymous" type="text/javascript" src="https://kumar-tallapalli.github.io/cookiePopUpFromOnePlace/gtm_dynamic_load_script.js"/>
    <link rel="stylesheet" type="text/css" href="https://kumar-tallapalli.github.io/cookiePopUpFromOnePlace/show_community_after_search.css"/>
    <script type="text/javascript" src="https://kumar-tallapalli.github.io/cookiePopUpFromOnePlace/show_community_after_search.js" async="true" /> 
    
    <xsl:comment>QA OneTrust Cookies And GTM End</xsl:comment>
    <xsl:comment>QA CoveoSearchPop Starts</xsl:comment>
      
     <xsl:comment> Coveo In-Product Experience</xsl:comment>
    <!-- Below script is commented for non production environment.  -->
    
    <script type="text/javascript" src="https://platform-eu.cloud.coveo.com/rest/organizations/infineontechnologiesnonproduction1e02dtpdy/pages/c674a110-51e0-4697-afe9-e8d97cf2581f/inappwidget/loader" async="true" ></script>
    
    <!-- Below script is added for  production environment. -->
    <!-- 
    <script type="text/javascript" src="https://platform-eu.cloud.coveo.com/rest/organizations/infineontechnologiesnonproduction1e02dtpdy/pages/c674a110-51e0-4697-afe9-e8d97cf2581f/inappwidget/loader" async="true" ></script>
    -->
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
