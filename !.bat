@echo off

:: Copy template file
echo Copying template
copy README.md.template README.md
echo done.
echo.


:: Extends README.md with icons
echo Generating MD preview.
set previewfile=%cd%\README.md

:: Build MD file header
echo. >>%previewfile%
echo. >>%previewfile%
echo Preview icons^: >>%previewfile%
echo. >>%previewfile%

:: ![icons/01.png](icons/01.png)

::
:: Write the list of filenames with each
:: prefixed by a random number and a colon
::
setlocal EnableDelayedExpansion
for /f %%f in ('dir /on /b icons\*.gif;icons\*.jpg;icons\*.png') do echo ^^![%%f](icons/%%f^?raw=true) >> !previewfile!
endlocal

echo MD preview completed.
echo.

goto :eof



pause

:eof
