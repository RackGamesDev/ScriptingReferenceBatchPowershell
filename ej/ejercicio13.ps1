#Ejercicio 13
#Escribe un script en PowerShell que compruebe si hay conectividad de red con un servidorremoto, como «google.com», y muestre un mensaje indicando si la conexión se ha realizado deforma correcta o no. El comando para realizar la comprobación es Test-Connection y el nombredel archivo será ejercicio13.ps1
$dominio = "https://www.google.com"

$hostnombre = [System.Uri]::new($dominio).Host
$resultado = Test-Connection -ComputerName $hostnombre -Count 1 -BufferSize 32 -TimeToLive 64 # -ErrorAction SilentlyContinue # -Quiet
if ($resultado) {
    Write-Host "Hubo exito al conectar con $dominio"
} else {
    Write-Host "Hubo un error al conectar con $dominio"
} 
