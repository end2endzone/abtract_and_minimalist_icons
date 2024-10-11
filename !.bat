@echo off

call :generate_html_preview
call :generate_md_preview
pause


:generate_html_preview
echo Generating HTML preview.
set previewfile=%cd%\preview.html
if exist "%previewfile%" del "%previewfile%"

:: Build HTML file header
echo ^<!doctype html^>>%previewfile%
echo ^<html lang=en^> >>%previewfile%
echo ^<head^> >>%previewfile%
echo ^<meta charset=utf-8^> >>%previewfile%
echo ^<title^>Icons preview^</title^> >>%previewfile%
echo ^</head^> >>%previewfile%
echo ^<body^> >>%previewfile%
echo ^<p^>Preview icons:^<br^>^</p^> >>%previewfile%

:: <img src="icons/01.png" style="max-width: 400px; max-height: 400px;">

::
:: Write the list of filenames with each
:: prefixed by a random number and a colon
::
setlocal EnableDelayedExpansion
for /f %%f in ('dir /on /b icons\*.gif;icons\*.jpg;icons\*.png') do echo ^<img src="icons/%%f" style="max-width: 400px; max-height: 400px;"^>>> !previewfile!
endlocal

:: Build HTML file footer
echo ^</body^> >>%previewfile%
echo ^</html^> >>%previewfile%

echo HTML preview completed.
echo.

goto :eof




:generate_md_preview
echo Generating MD preview.
set previewfile=%cd%\preview.md
if exist "%previewfile%" del "%previewfile%"

:: Build HTML file header
echo Preview icons^: >%previewfile%
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



:eof
