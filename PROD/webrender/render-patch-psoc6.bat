@echo off
@echo =========================
@echo PRISMA ditamap to WebHelp
@echo =========================
@echo.

@setlocal EnableDelayedExpansion
@set "startTime=%time: =0%"

:: set /p DITAMAP=Enter ditamap:
:: test
::set DITAMAP=slv1593788267129.ditamap

:: Render PSoC 6 WebHelp
set DITAMAP=lhy1649327762448.ditamap
call Powershell.exe -executionpolicy remotesigned -File render.ps1 -ditamap %DITAMAP% -latestpublished no -outputdir build/webhelp

:: Patch the content to make it good (no internet-specific patching)
call Powershell.exe -executionpolicy remotesigned -File patch-psoc6.ps1

IF %ERRORLEVEL% NEQ 0 GOTO END
::robocopy /mir webhelp \\mucsdv034.infineon.com\webhelppilot_stc\CSS\psoc6-pilot


:END
@rem Get elapsed time:
@set "endTime=%time: =0%"
@set "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
@set /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
@set /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"
@echo Elapsed:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%
