@echo off

:: https://stackoverflow.com/questions/15561997/batch-file-playlist-random-sort

set previewfile=%cd%\preview.html

if exist "%previewfile%" del "%previewfile%"

:: Build file header
echo ^<!doctype html^>>%previewfile%
echo ^<html lang=en^> >>%previewfile%
echo ^<head^> >>%previewfile%
echo ^<meta charset=utf-8^> >>%previewfile%
echo ^<title^>Icons preview^</title^> >>%previewfile%
echo ^</head^> >>%previewfile%
echo ^<body^> >>%previewfile%
echo ^<p^>Preview icons:^<br^>^</p^> >>%previewfile%

::
:: Write the list of filenames with each
:: prefixed by a random number and a colon
::
setlocal EnableDelayedExpansion
for /f %%f in ('dir /on /b icons\*.gif;icons\*.jpg;icons\*.png') do echo ^<img src="icons/%%f" style="max-width: 400px; max-height: 400px;"^>>> !previewfile!
endlocal

:: Build file footer
echo ^</body^> >>%previewfile%
echo ^</html^> >>%previewfile%


pause
