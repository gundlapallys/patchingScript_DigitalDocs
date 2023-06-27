# Patch PSoC 6 html files to be ready for the Internet pages

$patcher = "patch/infineon.com.patch-psoc6.xsl"
$htmldir = "build/webhelp"

write-output "Retrieve application note pdf URLs from infineon.com"
# retrieve internet pdf info from internet pages and extract AN pdf filenames
#$url = "infineon.com..."
#$internetdocs = "build/internetdocs.xml"
#$result = Invoke-WebRequest -Uri $url -Method Get -OutFile $internetdocs -UseDefaultCredentials -TimeoutSec 3600
# extract relevant pdfs
&C:\CMS_TOOLS\processors\saxon\bin\transform.exe -s:build/internetdocs.xml -xsl:get-internet-pdf-refs.xsl -o:build/anlist.xml

# copy pdf icon
copy-item -path resources/pdf-icon.png -destination $htmldir/oxygen-webhelp/app/img/

# patch content
write-output "Patch content"
if (!([string]::IsNullOrWhiteSpace($patcher))) {
    $htmldir = Resolve-Path $htmldir
    $htmldir_uri = "file:/{0}" -f ($htmldir -replace "\\", "/" -replace " ", "%20")
    &C:\CMS_TOOLS\processors\saxon\bin\transform.exe -xsl:$patcher -it:patchdir directory=$htmldir_uri
}