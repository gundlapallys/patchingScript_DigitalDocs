# Render WebHelp from PRISMA and patch for the Internet

## Render

`render.ps1` renders a ditamap as WebHelp. Generated WebHelp is unzipped to the `webhelp` subdirectory from where the script is run.

Parameters:
- *ditamap* - ditamap in PRISMA
- *latestpublished* - set to "yes" to generate WebHelp from latest published version. Default is "no"
- *docbase* - PRISMA docbase where content is stored. Default is "prod". Other options: "mc"

Example usage:

`Powershell.exe -executionpolicy remotesigned -File render.ps1 -ditamap slv1593788267129.ditamap`

`render-test.bat` is an example batch script that demonstrates how the scripts work

## Patch
`patch.ps1` patches the generated WebHelp with tracking scripts

Parameters:
- *htmldir* - directory of html files to patch
- *patcher* - Path to the xslt script that is used to patch the html

`patch/` is the directory with patching scripts. Each of the patch sub-scripts performs a specific patch operation. A root patching script, such as `infineon.com.patch.xsl`, combines a number of the sub-scripts to perform a set of patch operations.

