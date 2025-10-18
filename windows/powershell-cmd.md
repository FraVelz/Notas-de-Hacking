# Diferencias entre Powershell y CMD

---

## Temario

- [Diferencias entre Powershell y CMD](#diferencias-entre-powershell-y-cmd)
  - [Temario](#temario)
  - [CMD (Command Prompt)](#cmd-command-prompt)
  - [PowerShell](#powershell)
  - [Diferencias clave en práctica](#diferencias-clave-en-práctica)
  - [Ejemplo](#ejemplo)

[Regresar a la guía principal](./../readme.md#3-windows)

---

## CMD (Command Prompt)

- **Origen**: Basado en MS-DOS, presente en Windows desde versiones muy antiguas.

- **Lenguaje**: Usa un lenguaje de comandos muy básico, llamado *batch*.

- **Funciones principales**:

  - Ejecutar comandos simples del sistema (`dir`, `copy`, `del`, etc.).

  - Automatizar tareas básicas con archivos `.bat`.

- **Limitaciones**:

  - Manejo de objetos muy limitado: CMD trabaja con **texto plano**, no con objetos.

  - Automatización avanzada complicada.

  - Funciones modernas de Windows (como administración de registros o servicios) son más difíciles de hacer.

---

## PowerShell

- **Origen**: Introducido en 2006 como una herramienta moderna de administración de Windows.

- **Lenguaje**: Basado en .NET, orientado a objetos.

- **Funciones principales**:

  - No solo ejecuta comandos, sino que devuelve **objetos completos**, no solo texto.

    - Ejemplo: `Get-Process` devuelve un objeto de proceso con propiedades (`Id`, `CPU`, `Memory`, etc.) que se pueden filtrar o manipular.

  - Automatización avanzada: scripts `.ps1` pueden hacer casi cualquier cosa en Windows, desde tareas de administración hasta manipulación de servicios, registro, Active Directory, etc.

  - Combinación de cmdlets (comandos especializados de PowerShell) para tareas complejas.

- **Compatibilidad**: Puede ejecutar casi todos los comandos de CMD, y mucho más.

- **Multiplataforma**: PowerShell 7+ funciona en Windows, Linux y macOS.

---

## Diferencias clave en práctica

| Característica            | CMD           | PowerShell               |
| ------------------------- | ------------- | ------------------------ |
| Lenguaje                  | Batch / texto | Basado en objetos / .NET |
| Salida de comandos        | Texto plano   | Objetos                  |
| Automatización            | Básica        | Avanzada                 |
| Scripts                   | `.bat`        | `.ps1`                   |
| Administración de Windows | Limitada      | Completa                 |
| Multiplataforma           | Solo Windows  | Windows, Linux, macOS    |

---

## Ejemplo

- CMD:

```cmd
dir | find "archivo.txt"
```

- PowerShell:

```powershell
Get-ChildItem | Where-Object { $_.Name -eq "archivo.txt" }
```

> En PowerShell trabajas con objetos (`$_.Name`) y no solo con texto, lo que te da muchísima más flexibilidad.

---

[Regresar a la guía principal](./../readme.md#3-windows)

> **Autor:** Fravelz
