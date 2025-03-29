#Ejercicio 6
#Escribe un pequegno script en PowerShell llamado ejercicio6.ps1 que cuente el número de archivosen un directorio y sus subdirectorios agrupados por extensión
Get-ChildItem -Recurse -File | Group-Object Extension | Measure-Object
