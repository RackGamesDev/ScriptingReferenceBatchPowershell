#Los cmdlets son comandos para manejar objetos <Get/Set/Remove/New...>-<sujeto> y sustituyen a los comandos, aunque tienen alias
Set-ExecutionPolicy RemoteSigned #Habilitar los scripts, para ver los permisos: Get-ExecutionPolicy
Update-Help -Module Microsoft.PowerShell* #Actualizar la ayuda
Get-Command -CommandType cmdlet | Measure-Object #Saber la cantidad de comandos/cmdlets instalados
Get-Command -verb new #Ver todos los cmdlets con x verbo
Get-Module #Mostrar los modulos (paquetes de cmdlets/comandos en memoria), para verlos todos Get-Module -ListAvailable y para ver un modulo Get-Command -module <modulo>
Get-Module -ListAvailable | ForEach-Object { Import-Module $_.Name } #Activar todos los modulos
Get-Help Write-Host #Ver ayuda sobre un comando, mas avanzado con Get-Help -Online -Detailed -Examples -Full Write-Host
Get-Alias -Definition Get-ChildItem #Ver los alias de un cmdlet, se pueden crear nuevos con Set-Alias


Get-ChildItem . #dir
Get-ChildItem . -Recurse #dir recursivo
Get-ChildItem . | Where-Object Length -gt 100mb #dir filtrando, donde la propiedad Length sea mayor a 100mb
Write-Host "hola" #echo
$entrada = Read-Host "escribe" #Leer por teclado
Get-Location #Ver la ruta del prompt
Set-Location .. #cd
New-Item carpeta -ItemType Directory #md mkdir
New-Item archivo #Crear archivo vacio
Remove-Item carpeta -recurse #Borrar una carpeta o archivo, si es una carpeta -recursive para borrar su contenido
Rename-Item -Path ".\archivo" -NewName "archivo.txt" #ren
Copy-Item archivo.txt archivo2.txt #Copiar un archivo, si se le pone solo la ruta como segundo argumento intentara tener el mismo nombre
Get-Content archivo.txt #type
Get-ChildItem > hola.txt #Redirige la salida a un archivo (creandolo si es necesario), >> para no sobreescribir el archivo
Set-Location asidfoai 2> error.txt #Redirigir la salida de errores
Get-ChildItem | Where-Object {$_.Length -gt 100Mb} #Filtrar una lista, $_ es cada elemento y se usa para las condiciones
Get-ChildItem | Where-Object Name -like "h*" | Where-Object Length -gt 1kb #Otra manera de usar filtros
Get-ChildItem | Measure-Object #Redirige la salida de un comando a la entrada de otro, en este caso Measure-Object mide esos datos
#Get-ChildItem | Sort-Object -Descending -Property Length | Sort-Object -First 5 #Ordenar segun una propiedad de los elementos listados, o limitar a una cantidad
Get-ChildItem | Select-Object Name, Mode, @{Name="Tamaño";Expression={$.Length / 1024}} -Unique #Escoger solo ciertos atributos de la lista devuelta, se pueden especificar elementos unicos o crear campos nuevos
Get-ChildItem | Get-Member #Ver todas las propiedades posibles de la lista
Get-ChildItem | Group-Object Date #Agrupar elementos segun una propiedad en comun, se puede generar una hashtable con -AsHashTable
Get-ChildItem | Format-Table Date,Name,@{Name="Grande";Expression={if ($_.Length -gt 10mb) {"si"} else {"no"}}}# -Wrap #Generar una tabla a partir de la lista, -Wrap para esconder si el valor es muy largo
Get-ChildItem | Format-Wide Name -Column 3 -GroupBy Name #Ampliar una propiedad para que se vea bien, se puede especificar la cantidad de columnas o agrupar
Get-ChildItem | Format-List #Similar a la lista de tabla pero en lista (los format van al final)
Get-ChildItem | ForEach-Object { Write-Host $_.Name } #Ejecutar un bloque por cada elemento donde $_ es ese elemento


$variable = "hola" #Crear variable dinamica
New-Variable -Name variable2 -Value 10 -Option Constant #Crear constante
Write-Host $variable #Ver una variable
[int] $numero = 3 #Variable de tipo fijo (string, char, byte, int, single, double, decimal, datetime, bool, array, hashtable, xml)
Write-Host $numero.GetType().Name #Saber el tipo de una variable
Write-Host [int]::MaxValue #Ver el limite para los ints, se pueden ver distintas propiedades estaticas de los tipos
$variable = [string] 20 #Conversion de tipos
Write-Host ("3/11/2001" -as [DateTime]) #Otro tipo de conversion
$variable = $variable + "asdf" #Concatenacion, "$variable asdf" tambien vale
$numero = 1 + 2 - 3 * 4 / 5 * (1 + 1) % 1 #Operaciones
$numero += 2 #Autooperacoines, tambien valdria $numero++
[bool] $condicion = 1 -eq 1 #Operaciones booleanas, -eq(igual numerico) -ieq(igual con strings case-insensitive) -ceq(igual con strings case-sensitive) -ne(diferente) -it(<) -le(<=) -gt(>) -ge(>=)
$condicion = "hola" -like "ho*" #Validar segun comodines (-like -nolike) (* cualquier caracter/cantidad) (? un caracter) ([a-z] rango de caracteres ascii)
$condicion = (1 -eq 1) -and (2 -eq 2) -or (4 -eq 3) -xor (1 -eq 4) -and !(1 -eq 1) #Combinar condiciones
[array] $coleccion = @(1,2,3,"asdf",$true,$false,(1,2)) #Crear un array, tipos dinamicos
[int[]] $numeross = @(1,2,3) #Array con tipo fijo
Write-Host $coleccion[2] #Acceder a una posicion
[hashtable] $tablahash = @{"uno" = [int] 1; "dos" = [int] 2; 3 = "tres"} #Array donde cada elemento se identifica con una clave, tanto la clave como el valor tienen tipo dinamico
Write-Host $tablahash["uno"] #Acceder a un elemento, las hashtables tienen muchas propiedades y funciones igual que los arrays y los strings
$condicion = $coleccion -contains 2 #Saber si se incluye un valor en un array (-contains -notcontains)
$numero = $coleccion.Count #Los arrays tienen muchos metodos y propiedades para agnadir, quitar, leer objetos o devolver datos como la cantidad
$numero = "hola".Length + "aaab".IndexOf("b") #Los strings se comportan como arrays, tambien tienen muchos metodos y funciones
[PSCustomObject] $objeto = @{Nombre="obj";Cantidad=12} #Crear una variable con propiedades nuevas
Write-Host $objeto.Nombre #Acceder a la propiedad (no esta basado en una clase, es mas bien un struct)


#if basico
if ($condicion) {
    Write-Host "si"
} elseif (($variable -eq "hola") -or ($numero -eq 3)) {
    Write-Host "puede"
} else {
    Write-Host "no"
}
#switch basico, se pueden usar varios valores
switch ($numero, $numero * 10) {
    1 {
        Write-Host "uno"
    }
    20 {
        Write-Host "dos o veinte"
    }
    default {
        Write-Host "otro"
    }
}
switch ($numero) {
    { $_ -lt 10 } { #$_ significa el valor del switch
        Write-Host "menor que 10"
    }
    { $_ -gt 10 } {
        Write-Host "mayor que 10"
    }
}
#Opciones: wilcard(comodines) exact(que coincida exactamente con el patron) casesensitive(patron sensible a mayusculas) file(evaluar cada linea del archivo) regex(usando regex normales)
switch -wildcard -casesensitive ($variable) {
    "*r" {
        Write-Host "acaba en r"
    }
    "r*" {
        Write-Host "empieza con r"
    }
}

#Bucle while
while ($false) {
    Write-Host "vuelta"
    continue #Salta a la siguiente iteracion de cualquier bucle
    break #sale de cualquier bucle
}
#Bucle do-while, lo ejecuta al menos una vez
do {
    Write-Host "vuelta"
} while ($false)
#Bucle do-until (contrario de do-while)
do {
    Write-Host "vuelta"
} until ($true)
#Bucle for
for ($i = 0; $i -le 10; $i++) {
    Write-Host "vuelta" $i
}
#Bucle foreach, itera en una lista de elementos (grupo de archivos o array)
foreach ($e in 1,2,3,4,5) {
    Write-Host "vuelta con" $e
}
foreach ($e in $coleccion) {
    Write-Host "vuelta con" $e
}
foreach ($archivo in Get-ChildItem) {
    Write-Host $archivo.Name #En este caso se devuelve el archivo como objeto, no su nombre en si
}
#Se puede importar un csv para iterarlo en un bucle
$datosarchivo = Import-Csv -Path .\archivo.csv -Delimiter ';'
foreach ($persona in $datosarchivo) {
    Write-Host $persona.nombre $persona.apellido $persona.edad
}


