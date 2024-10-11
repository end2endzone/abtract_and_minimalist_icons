@echo off

:: https://stackoverflow.com/questions/15561997/batch-file-playlist-random-sort

set file=!.html
set tempfile=%TEMP%\tmp.tmp

if exist "%tempfile%" del "%tempfile%"

echo ^<!-- --^> >%file%
 
::
:: Write the list of filenames with each
:: prefixed by a random number and a colon
::
pushd icons
setlocal EnableDelayedExpansion
for /f %%f in ('dir /b *.gif;*.jpg;*.png') do echo !random!:^<img src="icons/%%f" style="max-width: 400px; max-height: 400px;"^> >> !tempfile!
endlocal
popd

::
:: Write the playlist.
:: sort the tempfile (which places it 
:: in random order) and remove the number:
::
(FOR /f "tokens=1*delims=:" %%i IN (' sort ^<%tempfile% ') DO ECHO %%j
) >%file%

del %tempfile%

pause
