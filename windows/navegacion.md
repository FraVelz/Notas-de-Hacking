# Comandos de Navegación

---

## Temario

- [Comandos de Navegación](#comandos-de-navegación)
  - [Temario](#temario)
  - [1. Windows CMD (Command Prompt)](#1-windows-cmd-command-prompt)
    - [Navegación por directorios](#navegación-por-directorios)
    - [Gestión de archivos](#gestión-de-archivos)
    - [Gestión de carpetas](#gestión-de-carpetas)
  - [2. PowerShell (cmdlets)](#2-powershell-cmdlets)
    - [Navegación por directorios (cmdlets)](#navegación-por-directorios-cmdlets)
    - [Gestión de archivos (cmdlets)](#gestión-de-archivos-cmdlets)
    - [Gestión de carpetas (cmdlets)](#gestión-de-carpetas-cmdlets)

[Regresar a la guía principal](./../readme.md#3-windows)

---

## 1. Windows CMD (Command Prompt)

### Navegación por directorios

| Comando        | Función                                               |
| -------------- | ----------------------------------------------------- |
| `cd` o `chdir` | Cambiar de directorio. Ej: `cd C:\Usuarios\Francisco` |
| `cd ..`        | Subir un nivel de carpeta                             |
| `cd \`         | Ir al directorio raíz de la unidad actual             |
| `dir`          | Listar archivos y carpetas del directorio actual      |
| `tree`         | Mostrar la estructura de carpetas en forma de árbol   |

### Gestión de archivos

| Comando                      | Función                                            |
| ---------------------------- | -------------------------------------------------- |
| `copy origen destino`        | Copiar archivos. Ej: `copy archivo.txt D:\Backup\` |
| `xcopy origen destino /s /e` | Copiar directorios con subcarpetas                 |
| `move origen destino`        | Mover archivos o cambiar nombre                    |
| `del archivo`                | Borrar un archivo                                  |
| `ren archivo nuevo_nombre`   | Cambiar nombre de un archivo                       |

### Gestión de carpetas

| Comando                                      | Función                                |
| -------------------------------------------- | -------------------------------------- |
| `mkdir nombre_carpeta` o `md nombre_carpeta` | Crear carpeta                          |
| `rmdir nombre_carpeta` o `rd nombre_carpeta` | Eliminar carpeta vacía                 |
| `rmdir /s nombre_carpeta`                    | Eliminar carpeta con todo su contenido |

---

## 2. PowerShell (cmdlets)

PowerShell tiene cmdlets más potentes y consistentes. Se escriben en formato **Verbo-Sustantivo**.

### Navegación por directorios (cmdlets)

| Cmdlet                    | Función                                                         |
| ------------------------- | --------------------------------------------------------------- |
| `Set-Location` o `cd`     | Cambiar de directorio. Ej: `Set-Location C:\Usuarios\Francisco` |
| `Get-Location` o `pwd`    | Mostrar la ruta actual                                          |
| `Get-ChildItem` o `ls`    | Listar archivos y carpetas                                      |
| `Push-Location` o `pushd` | Guardar directorio actual y moverse a otro                      |
| `Pop-Location` o `popd`   | Volver al directorio guardado                                   |

### Gestión de archivos (cmdlets)

| Cmdlet        | Función                                                            |
| ------------- | ------------------------------------------------------------------ |
| `Copy-Item`   | Copiar archivos o carpetas. Ej: `Copy-Item archivo.txt D:\Backup\` |
| `Move-Item`   | Mover archivos o cambiar nombre                                    |
| `Remove-Item` | Eliminar archivos o carpetas (`-Recurse` para contenido)           |
| `Rename-Item` | Cambiar nombre de archivo o carpeta                                |

### Gestión de carpetas (cmdlets)

| Cmdlet                                        | Función                      |
| --------------------------------------------- | ---------------------------- |
| `New-Item -ItemType Directory -Name "Nombre"` | Crear carpeta                |
| `Remove-Item -Recurse "Nombre"`               | Eliminar carpeta y contenido |

**Opciones útiles de `Get-ChildItem`**

- `-Recurse` → listar recursivamente subdirectorios
- `-File` → solo archivos
- `-Directory` → solo carpetas
- `-Filter "*.txt"` → filtrar por extensión

---

[Regresar a la guía principal](./../readme.md#3-windows)

> **Autor:** Fravelz
