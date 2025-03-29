#Ejercicio 9
#Escribe un script llamado ejercicio9.ps1 en PowerShell que renombre todos los archivos en un directorio agregando la fecha de creación al principio del nombre del archivo
Get-ChildItem | ForEach-Object { 
    $nombre = $_.BaseName + $_.CreationTime.ToString("_yyyy-MM-dd") + $_.Extension
    Rename-Item $_ -NewName $nombre
}
Get-ChildItem
