@ECHO OFF
setlocal enabledelayedexpansion
echo Ejercicio 3

set ACTUAL=%DATE%
set AMES=%ACTUAL:~4,2%
set ADIA=%ACTUAL:~7,2%
set AAGNO=%ACTUAL:~10,4%

echo Introduce tu fecha de nacimiento (dd/mm/aaaa):
set /P NACIMIENTO=

set LONGITUD=0
for /l %%i in (0,1,11) do (
    if "!NACIMIENTO:~%%i,1!"=="" goto fincontar
    set /a LONGITUD+=1
)
:fincontar
if NOT %LONGITUD%==10 (
	set FINALERR=1
	goto final
)

set DIA=%NACIMIENTO:~0,2%
set MES=%NACIMIENTO:~3,2%
set AGNO=%NACIMIENTO:~6,4%

set /a VDIA=%DIA% + 1
if %VDIA% LSS 2 (
	set FINALERR=1
	goto final
)
set /a VMES=%MES% + 1
if %VMES% LSS 2 (
	set FINALERR=1
	goto final
)
set /a VAGNO=%MES% + 1
if %VAGNO% LSS 2 (
	set FINALERR=1
	goto final
)
if %VMES% GTR 13 (
	set FINALERR=1
	goto final
)
set /A BISIESTO=%AGNO% %% 4 + 1

set /A DIA=%DIA% + 0
set /A MES=%MES% + 0
set /A AGNO=%AGNO% + 0

if %MES%==4 ( 
	set MESCORTO=1
)
if %MES%==6 ( 
	set MESCORTO=1
)
if %MES%==9 ( 
	set MESCORTO=1
)
if %MES%==11 ( 
	set MESCORTO=1
)
if DEFINED MESCORTO (
	if %DIA% GTR 30 (
		set FINALERR=1
		goto final
	)
) else (
	if %DIA% GTR 31 (
		set FINALERR=1
		goto final
	)
)
if %MES%==2 (
	if %BISIESTO%==1 (
		if %DIA% GTR 29 (
			set FINALERR=1
			goto final
		)
	) else (
		if %DIA% GTR 28 (
			set FINALERR=1
			goto final
		)
	)
)

if %AGNO% GTR %AAGNO% (
	echo Hay una diferencia negativa entre ambas fechas
	goto final
) else (
	if %AGNO% EQU %AAGNO% (
		if %MES% GTR %AMES% (
			echo Hay una diferencia negativa entre ambas fechas
			goto final
		) else (
			if %MES% EQU %AMES% (
				if %DIA% GTR %ADIA% (
					echo Hay una diferencia negativa entre ambas fechas
					goto final
				)
			)
		)
	)
)

set /A CANTAGNOS=%AAGNO%-%AGNO%
if %MES% LSS %AMES% (
	set /A CANTAGNOS=%CANTAGNOS%-1
) else (
	if %MES% EQU %AMES% (
		if %DIA% LEQ %ADIA% (
			set /A CANTAGNOS=%CANTAGNOS%-1
		)
	)
)

echo Tienes %CANTAGNOS% agnos.

:final
if DEFINED FINALERR ( 
	echo Formato de la fecha invalido
)
