#Ejercicio 8
#Crea un script en PowerShell de nombre ejercicio8.ps1 que genere contraseñas aleatorias con unalongitud específica y que cumplan con ciertos criterios de complejidad, como incluir al menos unaletra mayúscula, una letra minúscula, un número y un carácter especial

$simbolos = "!@#$%^&*()-_=+[]{}|;:,.<>?/"
$digitos = "0123456789"
$mayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
$minusculas = "abcdefghijklmnopqrstuvwxyz"
$longitud = 8

$contrasegna = $simbolos[(Get-Random -Minimum 0 -Maximum ($simbolos.Length - 1))] + $digitos[(Get-Random -Minimum 0 -Maximum ($digitos.Length - 1))] + $mayusculas[(Get-Random -Minimum 0 -Maximum ($mayusculas.Length - 1))] + $minusculas[(Get-Random -Minimum 0 -Maximum ($minusculas.Length - 1))]

for ($i = 4; $i -le $longitud; $i++) {
    $caracter = Get-Random -Minimum 0 -Maximum 3
    switch ($caracter) {
        0 {
            $contrasegna += $simbolos[(Get-Random -Minimum 0 -Maximum ($simbolos.Length - 1))]
        }
        1 {
            $contrasegna += $digitos[(Get-Random -Minimum 0 -Maximum ($digitos.Length - 1))]
        }
        2 {
            $contrasegna += $mayusculas[(Get-Random -Minimum 0 -Maximum ($mayusculas.Length - 1))]
        }
        3 {
            $contrasegna += $minusculas[(Get-Random -Minimum 0 -Maximum ($minusculas.Length - 1))]
        }

    }
}

Write-Host $contrasegna