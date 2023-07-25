<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd"
    version="2.0">
    
    <!-- remove draft -->
    <xsl:template match="*[local-name()='footer']">
        <footer class="navbar navbar-default wh_footer">
            <div class="ifx-footer" role="contentinfo">
                <div class="text-center">
                    <p>
                        <span class="copyright_info">© 1999 - <script type="text/javascript">document.write( new Date().getFullYear() );</script> Infineon Technologies AG</span>
                        <span class="important-notice">
                            <a  href="https://www.infineon.com/cms/en/about-infineon/usage-terms/"> &gt; Usage of this website is subject to our Usage Terms</a>&#160;&#160;&#160;
                            <a href="https://www.infineon.com/cms/en/about-infineon/imprint/"> &gt; Imprint</a>&#160;&#160;&#160;
                            <a href="https://www.infineon.com/cms/en/about-infineon/company/contacts/"> &gt; Contacts</a>&#160;&#160;&#160;
                            <a href="https://www.infineon.com/cms/en/about-infineon/privacy-policy/"> &gt; Privacy Policy</a>&#160;&#160;&#160;
                            <a href="https://www.infineon.com/cms/en/about-infineon/investor/reporting/glossary/"> &gt; Glossary </a>
                        </span>
                    </p>
                    <p/>
                </div>
            </div>
        </footer>
    </xsl:template>
</xsl:stylesheet>
