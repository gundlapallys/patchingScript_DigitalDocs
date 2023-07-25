@echo off
call Powershell.exe -executionpolicy remotesigned -File patch-psoc6.ps1

IF %ERRORLEVEL% NEQ 0 GOTO END
::robocopy /mir webhelp \\mucsdv034.infineon.com\webhelppilot_stc\CSS\psoc6-pilot
