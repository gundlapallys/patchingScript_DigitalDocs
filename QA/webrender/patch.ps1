# Patch html files to be ready for the Internet pages

param(
[Parameter(Mandatory=$true)][string]$htmldir="",                # directory of html files to patch
[Parameter(Mandatory=$true)][string]$patcher="",                # patch xslt script in patch directory
)

# patch content
write-output "Patch content"
if (!([string]::IsNullOrWhiteSpace($patcher))) {
    $htmldir = Resolve-Path $htmldir
    $htmldir_uri = "file:/{0}" -f ($htmldir -replace "\\", "/" -replace " ", "%20")
    &C:\CMS_TOOLS\processors\saxon\bin\transform.exe -xsl:$patcher -it:patchdir directory=$htmldir_uri
}