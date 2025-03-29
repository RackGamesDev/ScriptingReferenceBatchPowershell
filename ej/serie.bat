@ECHO OFF
echo Ejercicio 6

set PRIMERO=%1%
set SEGUNDO=%2%


set /A ESPARUNO=%PRIMERO% %% 2

if %ESPARUNO%==0 (
	for /L %%I in (%PRIMERO%,2,%SEGUNDO%) do (
		echo %%I
	)
) else (
	for /L %%I in (%PRIMERO%,3,%SEGUNDO%) do (
		echo %%I
	)
)
