# Generate WebHelp for the given document and patch with tracking code
#
param(
[Parameter(Mandatory=$true)][string]$ditamap,                # ditamap in PRISMA
[Parameter(Mandatory=$true)][string]$outputdir,              # html output directory
[Parameter(Mandatory=$false)][string]$latestpublished="no",  # set to "yes" if to publish latest published
[Parameter(Mandatory=$false)][string]$docbase='prod'         # PRISMA docbase: prod, mc
)

$tempdir = Join-Path -Path (Resolve-Path ".") -ChildPath "build/temp"
$htmldir = Resolve-Path $outputdir -ErrorAction SilentlyContinue -ErrorVariable _frperror
if (-not($htmldir)) {
    $htmldir = $_frperror[0].TargetObject
}
$hubUrl = switch ($docbase) {
    'mc' { 'https://prismahub-mc.intra.infineon.com' }
    default { 'https://prismahub.intra.infineon.com' } # prod
}
write-output "Ditamap: $ditamap"
write-output "Hub: $hubUrl"
write-output "Latest published: $latestpublished"
write-output "Output: $htmldir"

if(1){
Remove-Item -path $tempdir -recurse 2>$null
Remove-Item -path $htmldir -recurse 2>$null
New-Item -Path $tempdir -ItemType Directory 1>$null
}

if (1) {
$cycle = "Authoring" # default to authoring, changed below if needed
$latestversion = ""
# get latest published version if required
if ($latestpublished -eq "yes")
{
    Write-Output "Get latest published version"
    $latest = "$tempdir/latestpublished.xml"
    $url = "$hubUrl/prisma-converter/metadata/latest-published?map.id=$ditamap"
    write-output $url
    $result = Invoke-WebRequest -Uri $url -Method Get -OutFile $latest -UseDefaultCredentials -TimeoutSec 3600
    $latestversion = Select-Xml -Path $latest -XPath "/map/version/text()" | Select-Object -ExpandProperty Node
    $latestversion = $latestversion.InnerText.Trim()
    $cycle = "Published"
    Write-Output "  Latest published version: $latestversion"
}

# Render the WebHelp from PRISMA
$form = @{
    'map.id' = $ditamap
    'cycle' = $cycle
    'version' = $latestversion
    'output' = 'WebHelp'
    'error.response.format' = 'application/json'
    'args.rellinks' = 'nofamily'
}
write-output "Generate WebHelp"
$url = "$hubUrl/prisma-converter/processor/execute?processor.id=outputProcessor"
$outfile = "$tempdir/webhelp.zip"
write-output $url
$result = Invoke-WebRequest -Uri $url -Method Post -OutFile $outfile -UseDefaultCredentials -Body $form
write-output $result

write-output "Unzip"
Expand-Archive -Path $outfile -DestinationPath $tempdir -Force
Expand-Archive -Path "$tempdir/$ditamap`.zip" -DestinationPath $htmldir -Force
# move logs out of content
Move-Item "$htmldir/Output_Logs" "$tempdir/Output_Logs"

# check if render worked
if (!(Test-Path -Path "$htmldir/index.html")) {
    throw "Output generation failed. Check $htmldir/error.build.log"
}

}#if0


