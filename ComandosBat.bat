@ECHO OFF			::Desactivar que se muestren los comandos en la consola
setlocal enabledelayedexpansion
::Los comentarios se escriben asi
doskey /H				::Ver el historial de comandos de la sesion actual
ver/version				::Ver la version de cmd
cls						::Limpia el terminal
doskey /history			::Historial de comandos
color col1col2			::Pone un color a la consola, col 7D
echo aasdfasdf			::Muestra un texto por consola
echo %PATH%				::Ver contenido de variable
date /t					::Ver la fecha, el /t es para cambiarla
time /t					::Ver la hora, el /t es para cambiarla
cd						::Ver ruta actual
cd ..					::Subir un nivel
cd ruta					::Ir a cierta ruta
exit					::Sale del cmd
getmac					::Da la direccion mac
format D				::Formatea una unidad a un sistema de archivos
help comando			::Ayuda
label C:windows			::Cambia el nombre de un volumen
msinfo32				::Abre el programa de informacion del sistema
nslookup				::Programa para informacion de servidores dns
path asdf				::Cambia el contnido de la variable path
path ;					::Borra el contenido de la variable path
ping 192.168.1.1		::Prueba la conexion con una ip
prompt hola:			::Cambia el C:\asdf> por otra cosa (prompt $P$G para default)
prompt %USERNAME%@%COMPUTERNAME%#
shutdown				::Apagar y derivados
systeminfo				::Muestra informacion del hardware
diskpart				::Programa de particionado y formateo
comando /?				::Ver la ayuda de un comando
taskill /F /IM algo.exe	::Termina un proceso
start hola.exe			::Ejecuta un proceso
start google.com		::Abre una web en el navegador
convert C:/FS:NTFS		::Convierte una unidad a un sistema de archivos

type archivo		::Ver contenido de un archivo
dir					::Listar el contenido
dir ruta			::idem
dir /A				::Muestra todo el contenido
dir /A:D			::Dependiendo de la opcion (- para no) (d=directorios, r=readonly, h=hidden, s=system)
dir /B				::dir simplificado
dir /D				::dir en columnas
dir /L				::dir en minusculas
dir /O:N			::dir ordenado (- invertido) (n=name, e=extension, s=size, d=fecha, g=primero directorios)
dir /W				::dir horizontal ancho
dir /P				::dir pero si no caben todos se acopla
dir /Q				::dir mostrando el propietario de cada archivo
dir /S				::dir recursivo
tree				::Como dir pero tambien lista subcarpetas
chkdsk C			::Muestra un informe de una unidad, dependiendo si es fat o ntfs se pueden usar opciones extra como /f (corregir)
comp archivo1 archivo2		::Compara el contenido de 2 archivos
fc archivo1 archivo2		::Igual que comp pero de forma grafica

del archivo archivo2		::Eliminar archivos
del /A:F *					::Elimina todos los archivos que cumplan esa condicion (en este caso los de solo lectura)
md nuevacarpeta				::Crea una carpeta
md sup\sub otra				::Crear sistema de carpetas
rd carpeta					::Elimina una carpeta vacia
rd carpeta /s				::Elimina una carpeta recursivamente
move algo carpetadestino	::Mueve una carpeta o un archivo
copy algo carpetadestino	::Copia un archivo a una carpeta
xcopy /s algo carpetadestino::Copia una carpeta y sus contenidos
ren algo nuevonombre		::Renombra carpetas o archivos
attrib archivo				::Muestra los atributos de un archivo
attrib +H -S archivo		::Cambia los atributos de un archivo, + agnadir - quitar. (r=readonly, a=archive, s=system, h=hidden)
echo asdfasdf > archivo.txt	::Crear un archivo con ese contenido
copy CON archivo.txt		::Crear un archivo e inmediatamente escribir en el

::En los siguientes comandos se suele poder cambiar el archivo por un dispositivo, como NUL, CON o CLOCK$
comando < archivo			::(omitible) obligar a un comando a usar como entrada ese contenido
comando > archivo			::Redirige la salida del comando a un archivo (echo asdf > a.txt)
comando 2> archivo			::Redirige el error de un comando a un archivo
comando >> archivo			::Redirige la salida de un comando a un archivo sin borrar el que tenia antes (ponerlo al final)
comando 2>> archivo			::Redirige el error de un comando a un archivo al final
comando1 | comando2			::Redirige la salida del comando 2 a la entrada del comando 1 (sort | dir)
comando1 & comando2			::Ejecuta el comando 1 y luego el 2
comando1 && comando2		::Ejecuta el comando 1 y si no da error luego el 2
comando1 || comando2		::Ejecuta el comando 1 y si da error luego el 2
comando1 && comando2 ||comando3 ::Ejecuta el comando 1, si no da error luego el 2, o si da error el 3
comando > nul 2>&1			::&1 se refiere al objeto 1, que en este caso es nul, por lo tanto ambas salidas irian a nul
comando > archivo.txt 2>&1	::En este caso escribiria tanto la salida como el error en el archivo

find "asdf" archivo.txt	a.txt	::Busca ese texto, combinable con |
find /V "asdf" archivo.txt		::Lo contrario, donde no aparece
find /C "asdf" archivo.txt		::Cuenta las lineas que contienen el texto
find /N "asdf" archivo.txt		::Muestra los numeros de lineas con el texto
find /I "AsDf" archivo.txt		::Ignora mayusculas-minusculas
findstr /S "hola" *.txt			::Igual pero con comodines (opciones similares a find)
sort archivo.txt				::Ordena el contenido, combinable con otros comandos con |
sort /R	archivo.txt				::Ordenar de forma inversa
sort /+2						::Ordena a partir de x caracter
more archivo.txt				::Similar a type, muestra de forma acoplada el contenido o lo que se le pase como entada
::EJEMPLOS:
sort archivo.txt > ordenado.txt
find "hola" archivo.txt | sort > lineasordenadas.txt
dir | more | sort > indice.txt



::COMODINES
::	* 		Cualquier caracter en cualquier cantidad
::	? 		Un solo caracter cualquiera
::	. 		idem
::	^ 		Inicio de linea
::	$ 		Fin de linea
::	[aeiou] 	Cualquiera de los caracteres
::	[^aeiou] 	Ninguno
::	[a-z] 		Caracter en ese rango
::	\x 		Escape de caracter
::	\<asdfaa 	Inicio de palabra
::	asdfa\> 	Fin de palabra



::	VARIABLES
::	%cd% 			Ruta actual
::	%appdata% 		Carpeta appdata
::	%PATH% 			Contenido de la variable path
::	%TIME%			Hora actual
::	%DATE%			Fecha actual
::	%RANDOM%		Numero aleatorio simple
::	%USERNAME%		Usuario actual
::	%COMPUTERNAME%		Nombre de la maquina
::	%CMDTEXTVERSION%	
::	%CMDCMDLINE%		Comando que abrio el cmd

set							::Ver todas las variables de entorno
setx VARIABLE asdf			::Establecer una variable de entorno permanente, se puede ver con %VARIABLE%
set /A RAND=%RANDOM% + 1	::Establecer una variable de entorno NUMERICA haciendo calculos	
set TEXTO=asdfasdf			::Establecer variables de TEXTO	
set /P VAR=a				::Escribir de forma acoplada para rellenar la variable
echo %VARIABLE:~2,3%		::Coger desde el x caracter y caracteres (desde el 1) (daria RIA si %VARIABLE% vale VARIABLE)
echo %RANDOM% 
set /A VARIABLE=%RANDOM% %10+1	::Guardar en una variable un numero entre 1 y 10 (solo valido en scripts)


::UTILES PARA .BAT
@ECHO OFF			::No mostrar los comandos en el prompt
cmd /v:on			::Permite operar dentro de un bucle, solo que las variables a operar serian asi: !VARIABLE!
pause > nul			::Parar la ejecucion hasta que se pulse una tecla
exit				::Cierra la consola
title hola			::Cambia el titulo de la ventana
rem comentario		::Poner comentarios (sin usar ::)
echo %1				::Hace referencia al parametro 1, funciona hasta %9
shift				::%1 hara referencia al segundo, %2 al tercero...
:etiqueta			::Declara una etiqueta, un punto en el codigo al que saltar
goto etiqueta		::Salta a esa etiqueta
choice /c abc "selecciona:"	::Dar a elegir opciones (/CS para case insensitive)
choice /C ABC /M "?" /T 10 /D A	::Si pasan 10 segundos pasa a la opcion A
echo %ERRORLEVEL%	::El numero de la ultima opcion elegida

if EXIST archivo.txt (			::if basico, en este caso comprueba que existe un archivo
	echo si
) else (
	echo no	
)

if 2 LSS 4 (					::Comparar numeros (EQU= NEQ!= LSS< LEQ<= GTR> GEQ>=)
	contenido
)

if /I %TEXTO%==hola (			::Comparar textos, en este caso sin tener en cuenta mayusculas por el /i
	contenido
)

if NOT %TEXTO%==%TEXTODOS% (	::Negando una condicion
	contenido
)

if DEFINED VARIABLE (			::Saber si una variable esta definida

)


for %%X in (*.png) do echo %%X	::Itera sobre una serie de archivos (for /R para subcarpeta, /D para solo carpetas)

for %%X in (A*) do (			::Tambien se podria iterar en el resultado de un comando con: for %%X in (`dir`) do 
echo %%X
)

for /L %%I in (0,1,10) do (		::Iteraria de 0 a 10 haciendo saltos de 1
echo %%I
					::Si se usa una variable aqui dentro (declarada con set /A) se usa con !VARIABLE!
)

for /f "tokens=1,3 delims=;" %%G in (archivo.csv) do (
echo %%G %%H
)



















































































