@echo off
setlocal ENABLEDELAYEDEXPANSION
set day=86400
set /a year=day*365
set /a strip=day*7
set dSource=C:\temp

call :epoch %date%
set /a slice=epoch-strip

for /f "delims=" %%f in ('dir /a-d-h-s /b /s %dSource%') do (
    call :epoch %%~tf
    if !epoch! LEQ %slice% (echo DELETE %%f ^(%%~tf^)) ELSE echo keep %%f ^(%%~tf^)
)
exit /b 0

rem Args[1]: Year-Month-Day
:epoch
    setlocal ENABLEDELAYEDEXPANSION
    for /f "tokens=1,2,3 delims=-" %%d in ('echo %1') do set Years=%%d& set Months=%%e& set Days=%%f
    if "!Months:~0,1!"=="0" set Months=!Months:~1,1!
    if "!Days:~0,1!"=="0" set Days=!Days:~1,1!
    set /a Days=Days*day
    set /a _months=0
    set i=1&& for %%m in (31 28 31 30 31 30 31 31 30 31 30 31) do if !i! LSS !Months! (set /a _months=!_months! + %%m*day&& set /a i+=1)
    set /a Months=!_months!
    set /a Years=(Years-1970)*year
    set /a Epoch=Years+Months+Days
    endlocal& set Epoch=%Epoch%
    exit /b 0