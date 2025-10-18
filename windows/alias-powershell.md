# Alias en powershell

---

## Temario

- [Alias en powershell](#alias-en-powershell)
  - [Temario](#temario)
  - [Qué es un alias](#qué-es-un-alias)
  - [Alias comunes en PowerShell](#alias-comunes-en-powershell)
  - [Cmdlets relacionados con alias](#cmdlets-relacionados-con-alias)
  - [Ejemplos prácticos](#ejemplos-prácticos)
  - [Alias persistentes](#alias-persistentes)
  - [Nota importante](#nota-importante)

[Regresar a la guía principal](./../readme.md#3-windows)

---

## Qué es un alias

Un **alias** es simplemente un **nombre alternativo** para un comando existente.
Por ejemplo:

```powershell
Get-ChildItem     # Nombre completo
ls                # Alias
```

Ambos hacen lo mismo: listar archivos y carpetas.

---

## Alias comunes en PowerShell

| Alias                | Cmdlet equivalente | Descripción                                                         |
| -------------------- | ------------------ | ------------------------------------------------------------------- |
| `ls`                 | `Get-ChildItem`    | Lista archivos y carpetas.                                          |
| `dir`                | `Get-ChildItem`    | Igual que `ls` (compatibilidad con CMD).                            |
| `cd`                 | `Set-Location`     | Cambia de directorio.                                               |
| `pwd`                | `Get-Location`     | Muestra el directorio actual.                                       |
| `cat`, `type`        | `Get-Content`      | Muestra el contenido de un archivo.                                 |
| `echo`, `write`      | `Write-Output`     | Imprime texto en pantalla.                                          |
| `cls`, `clear`       | `Clear-Host`       | Limpia la pantalla.                                                 |
| `cp`, `copy`         | `Copy-Item`        | Copia archivos o carpetas.                                          |
| `mv`, `move`         | `Move-Item`        | Mueve o renombra archivos.                                          |
| `rm`, `del`, `erase` | `Remove-Item`      | Elimina archivos o carpetas.                                        |
| `man`, `help`        | `Get-Help`         | Muestra ayuda de un cmdlet.                                         |
| `ps`                 | `Get-Process`      | Lista procesos activos.                                             |
| `kill`               | `Stop-Process`     | Finaliza un proceso.                                                |
| `gcm`                | `Get-Command`      | Busca cmdlets o funciones.                                          |
| `gal`                | `Get-Alias`        | Muestra todos los alias.                                            |
| `sal`                | `Set-Alias`        | Crea un alias nuevo.                                                |
| `nal`                | `New-Alias`        | Crea un alias y lo guarda (persistente si lo defines en el perfil). |
| `pal`                | `Pop-Location`     | Vuelve al directorio anterior.                                      |
| `pushd`              | `Push-Location`    | Guarda el directorio actual en una pila.                            |

---

## Cmdlets relacionados con alias

| Cmdlet                         | Descripción                                    | Ejemplo                        |
| ------------------------------ | ---------------------------------------------- | ------------------------------ |
| `Get-Alias`                    | Muestra todos los alias definidos actualmente. | `Get-Alias`                    |
| `Get-Alias <alias>`            | Muestra el comando que representa un alias.    | `Get-Alias ls`                 |
| `Set-Alias <nombre> <comando>` | Crea un alias temporal.                        | `Set-Alias borrar Remove-Item` |
| `New-Alias <nombre> <comando>` | Crea un alias (igual que `Set-Alias`).         | `New-Alias abrir notepad`      |
| `Export-Alias <archivo>`       | Exporta todos los alias a un archivo.          | `Export-Alias alias.txt`       |
| `Import-Alias <archivo>`       | Importa alias desde un archivo.                | `Import-Alias alias.txt`       |
| `Remove-Item alias:<nombre>`   | Elimina un alias.                              | `Remove-Item alias:borrar`     |

---

## Ejemplos prácticos

```powershell
# Ver todos los alias
Get-Alias

# Crear un alias personalizado
Set-Alias editar "notepad.exe"

# Usar el alias
editar archivo.txt

# Ver qué comando ejecuta un alias
Get-Alias ls

# Eliminar un alias
Remove-Item alias:editar
```

---

## Alias persistentes

Por defecto, los alias creados con `Set-Alias` o `New-Alias` **solo duran mientras PowerShell está abierto**.

Para hacerlos **permanentes**, agrégalos al **perfil de PowerShell**:

```powershell
notepad $PROFILE
```

Luego agrega tus alias personalizados:

```powershell
Set-Alias editar notepad.exe
Set-Alias borrar Remove-Item
```

Guarda el archivo y la próxima vez que abras PowerShell, estarán disponibles.

---

## Nota importante

- Los alias **no aceptan parámetros por defecto**.
  Por ejemplo, `Set-Alias buscar "Get-ChildItem -Recurse"` ❌ no funcionará.
  En ese caso, usa una **función**:

  ```powershell
  function buscar { Get-ChildItem -Recurse @args }
  Set-Alias buscar buscar
  ```

---

[Regresar a la guía principal](./../readme.md#3-windows)

> **Autor:** Fravelz
