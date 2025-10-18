# Redirecciones en Powershell (operadores lógicos y de redirección)

---

## Temario

- [Redirecciones en Powershell (operadores lógicos y de redirección)](#redirecciones-en-powershell-operadores-lógicos-y-de-redirección)
  - [Temario](#temario)
  - [Tipos de salida en PowerShell](#tipos-de-salida-en-powershell)
  - [Operadores de redirección](#operadores-de-redirección)
  - [Operadores lógicos](#operadores-lógicos)
  - [Ejemplos combinados](#ejemplos-combinados)
  - [Tip extra: usar redirecciones dentro de scripts](#tip-extra-usar-redirecciones-dentro-de-scripts)

[Regresar a la guía principal](./../readme.md#3-windows)

---

## Tipos de salida en PowerShell

PowerShell no solo maneja texto (como CMD), sino **flujos de salida (streams)**.
Cada flujo tiene un número que se usa para redirigirlo:

| Flujo | Descripción                                          | Ejemplo de redirección |
| ----- | ---------------------------------------------------- | ---------------------- |
| `1`   | **Salida estándar (Output)** — resultado del comando | `> archivo.txt`        |
| `2`   | **Errores (Error)** — mensajes de error              | `2> errores.txt`       |
| `3`   | **Mensajes de advertencia (Warning)**                | `3> advertencias.txt`  |
| `4`   | **Mensajes detallados (Verbose)**                    | `4> verbose.txt`       |
| `5`   | **Mensajes de depuración (Debug)**                   | `5> debug.txt`         |
| `6`   | **Mensajes de información (Information)**            | `6> info.txt`          |

---

## Operadores de redirección

| Operador   | Significado                                                  | Ejemplo                                        | Resultado                                                    |                                                  |
| ---------- | ------------------------------------------------------------ | ---------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------ |
| `>`        | Redirige la **salida estándar (1)** y sobrescribe el archivo | `Get-Process > salida.txt`                     | Guarda los procesos, sobrescribiendo el archivo si ya existe |                                                  |
| `>>`       | Redirige y **agrega (append)** al final del archivo          | `Get-Service >> salida.txt`                    | Agrega los servicios al final sin borrar lo anterior         |                                                  |
| `2>`       | Redirige **errores** a un archivo                            | `Get-Item archivo_inexistente 2> errores.txt`  | Guarda los errores                                           |                                                  |
| `2>>`      | Redirige errores y **agrega** al archivo                     | `Get-Item archivo_inexistente 2>> errores.txt` | No sobrescribe                                               |                                                  |
| `*>`       | Redirige **todos los flujos** a un archivo                   | `Get-Command *> todo.txt`                      | Guarda salidas, errores, advertencias, etc.                  |                                                  |
| `*>`       | También puede combinarse con `>>`                            | `*>` sobrescribe / `*>>` agrega                |                                                              |                                                  |
| `Out-File` | Envía la salida a un archivo (alternativa más potente)       | `Get-Process                                   | Out-File procesos.txt -Append`                               | Más control (codificación, ancho de línea, etc.) |

---

## Operadores lógicos

PowerShell usa operadores **lógicos** y **de control de flujo** más avanzados que CMD:

| Operador     | Descripción                                                     | Ejemplo                                        | Resultado                                                 |                        |   |                         |                                   |
| ------------ | --------------------------------------------------------------- | ---------------------------------------------- | --------------------------------------------------------- | ---------------------- | - | ----------------------- | --------------------------------- |
| `-and`       | **Y lógico** — ambas condiciones deben ser verdaderas           | `($x -gt 5) -and ($x -lt 10)`                  | Verdadero si x está entre 6 y 9                           |                        |   |                         |                                   |
| `-or`        | **O lógico** — una de las condiciones debe ser verdadera        | `($a -eq 10) -or ($b -eq 10)`                  | Verdadero si alguno es 10                                 |                        |   |                         |                                   |
| `-not` o `!` | **Negación**                                                    | `-not ($x -eq 5)` o `!($x -eq 5)`              | Verdadero si x ≠ 5                                        |                        |   |                         |                                   |
| `&&`         | **Ejecuta el siguiente comando solo si el primero fue exitoso** | `Test-Path archivo.txt && Write-Host "Existe"` | Muestra “Existe” solo si el archivo existe                |                        |   |                         |                                   |
| `            |                                                                 | `                                              | **Ejecuta el siguiente comando solo si el primero falla** | `Test-Path archivo.txt |   | Write-Host "No existe"` | Muestra “No existe” solo si falla |
| `;`          | **Separa comandos** (ejecuta ambos, sin importar si fallan)     | `dir; echo "Hecho"`                            | Siempre ejecuta ambos                                     |                        |   |                         |                                   |

---

## Ejemplos combinados

```powershell
# Guarda salida y errores en archivos diferentes
Get-ChildItem C:\ 1>salida.txt 2>errores.txt

# Guarda todo en un solo archivo
Get-ChildItem C:\ *> todo.txt

# Si un archivo existe, muestra un mensaje
Test-Path "C:\config.txt" && Write-Host "Existe" || Write-Host "No existe"

# Redirigir salida a un archivo y también verla en pantalla
Get-Process | Tee-Object -FilePath procesos.txt
```

---

## Tip extra: usar redirecciones dentro de scripts

En scripts (`.ps1`), puedes controlar redirecciones con más precisión:

```powershell
$ErrorActionPreference = "SilentlyContinue"   # Ignora errores
Get-Item "C:\noexiste.txt" *> log.txt         # Redirige todo
```

---

[Regresar a la guía principal](./../readme.md#3-windows)

> **Autor:** Fravelz
