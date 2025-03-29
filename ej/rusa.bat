@ECHO OFF
setlocal enabledelayedexpansion
echo Ejercicio 1

:intento
echo ¿En que posicion estas?
set /A RECAMARA=%RANDOM% %% 6 + 1
set /P POSICION=

if NOT %POSICION%==1 (
	if NOT %POSICION%==2 (
		if NOT %POSICION%==3 (
			if NOT %POSICION%==4 (
				if NOT %POSICION%==5 (
					if NOT %POSICION%==6 (
						echo El valor introducido no es correcto. Prueba de nuevo
						goto intento
					)
				)
			)
		)
	)
)

if %POSICION%==%RECAMARA% (
	echo La bala estaba en la recamara %RECAMARA% Estas muerto
	goto fin
) else (
	echo La bala estaba en la recamara %RECAMARA% Te has salvado, de momento
	goto intento
)

:fin

