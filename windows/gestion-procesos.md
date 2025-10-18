# Comandos y cmdlets de gestión de procesos

## Temario

- [Comandos y cmdlets de gestión de procesos](#comandos-y-cmdlets-de-gestión-de-procesos)
  - [Temario](#temario)
  - [1. Comandos de gestión de procesos en CMD](#1-comandos-de-gestión-de-procesos-en-cmd)
  - [2. Cmdlets de gestión de procesos en PowerShell](#2-cmdlets-de-gestión-de-procesos-en-powershell)
  - [3. Comparativa rápida CMD vs PowerShell](#3-comparativa-rápida-cmd-vs-powershell)
  - [4. Comandos gráficos y herramientas integradas](#4-comandos-gráficos-y-herramientas-integradas)
  - [Ejemplos útiles de PowerShell](#ejemplos-útiles-de-powershell)

---

## 1. Comandos de gestión de procesos en CMD

> Todos estos se ejecutan en **Símbolo del sistema (cmd)**, preferiblemente con permisos de administrador.

| Comando                                                | Descripción                                                                    | Ejemplo                                               |
| ------------------------------------------------------ | ------------------------------------------------------------------------------ | ----------------------------------------------------- |
| `tasklist`                                             | Muestra todos los procesos en ejecución con su PID (identificador de proceso). | `tasklist`                                            |
| `tasklist /v`                                          | Muestra información más detallada (ventana, usuario, tiempo, etc.).            | `tasklist /v`                                         |
| `tasklist /fi "imagename eq notepad.exe"`              | Filtra procesos por nombre.                                                    | `tasklist /fi "imagename eq chrome.exe"`              |
| `tasklist /fi "pid eq 1234"`                           | Filtra por PID.                                                                | `tasklist /fi "pid eq 4567"`                          |
| `taskkill /im <nombre>`                                | Cierra un proceso por su nombre.                                               | `taskkill /im notepad.exe`                            |
| `taskkill /pid <id>`                                   | Cierra un proceso por su PID.                                                  | `taskkill /pid 4567`                                  |
| `taskkill /f /im <nombre>`                             | Fuerza el cierre de un proceso.                                                | `taskkill /f /im chrome.exe`                          |
| `taskkill /f /t /im <nombre>`                          | Cierra el proceso y todos sus procesos hijos.                                  | `taskkill /f /t /im explorer.exe`                     |
| `wmic process list brief`                              | Lista los procesos (más resumido).                                             | `wmic process list brief`                             |
| `wmic process where name="notepad.exe" get processid`  | Muestra el PID de un proceso específico.                                       | `wmic process where name="chrome.exe" get processid`  |
| `wmic process where name="notepad.exe" call terminate` | Termina un proceso específico.                                                 | `wmic process where name="chrome.exe" call terminate` |
| `wmic process get name,processid,priority`             | Muestra procesos con su prioridad.                                             | `wmic process get name,processid,priority`            |
| `systeminfo`                                           | Información general del sistema, incluyendo tiempo de ejecución.               | `systeminfo`                                          |

---

## 2. Cmdlets de gestión de procesos en PowerShell

> PowerShell ofrece control total sobre los procesos, con más detalle y opciones que CMD.

| Cmdlet                               | Descripción                                         | Ejemplo                                                  |                                           |
| ------------------------------------ | --------------------------------------------------- | -------------------------------------------------------- | ----------------------------------------- |
| `Get-Process`                        | Muestra todos los procesos en ejecución.            | `Get-Process`                                            |                                           |
| `Get-Process <nombre>`               | Muestra información de un proceso específico.       | `Get-Process notepad`                                    |                                           |
| `Get-Process                         | Sort-Object CPU -Descending`                        | Ordena procesos por uso de CPU.                          | *(muestra los que más consumen CPU)*      |
| `Stop-Process -Name <nombre>`        | Detiene un proceso por nombre.                      | `Stop-Process -Name "notepad"`                           |                                           |
| `Stop-Process -Id <PID>`             | Detiene un proceso por ID.                          | `Stop-Process -Id 4567`                                  |                                           |
| `Stop-Process -Name <nombre> -Force` | Fuerza la detención de un proceso.                  | `Stop-Process -Name "chrome" -Force`                     |                                           |
| `Start-Process <ruta o nombre>`      | Inicia un nuevo proceso.                            | `Start-Process notepad`                                  |                                           |
| `Start-Process <ruta> -Verb RunAs`   | Ejecuta un proceso como administrador.              | `Start-Process "cmd.exe" -Verb RunAs`                    |                                           |
| `Wait-Process -Name <nombre>`        | Espera a que un proceso termine antes de continuar. | `Wait-Process -Name "notepad"`                           |                                           |
| `Debug-Process -Name <nombre>`       | Inicia depuración de un proceso (avanzado).         | `Debug-Process -Name "notepad"`                          |                                           |
| `Get-WmiObject Win32_Process`        | Obtiene información avanzada de los procesos.       | `Get-WmiObject Win32_Process                             | Select-Object Name,ProcessId,ThreadCount` |
| `Get-Process                         | Where-Object {$_.CPU -gt 50}`                       | Filtra procesos que consumen más de cierto valor de CPU. | *(personalizable)*                        |

---

## 3. Comparativa rápida CMD vs PowerShell

| Tarea                      | CMD                                      | PowerShell                                     |
| -------------------------- | ---------------------------------------- | ---------------------------------------------- |
| Ver todos los procesos     | `tasklist`                               | `Get-Process`                                  |
| Ver un proceso específico  | `tasklist /fi "imagename eq chrome.exe"` | `Get-Process chrome`                           |
| Terminar un proceso        | `taskkill /im notepad.exe`               | `Stop-Process -Name notepad`                   |
| Terminar un proceso por ID | `taskkill /pid 4567`                     | `Stop-Process -Id 4567`                        |
| Forzar cierre              | `taskkill /f /im chrome.exe`             | `Stop-Process -Name chrome -Force`             |
| Iniciar un proceso         | *(no hay comando directo)*               | `Start-Process notepad`                        |
| Ver prioridad              | `wmic process get name,priority`         | `(Get-Process notepad).PriorityClass`          |
| Cambiar prioridad          | *(usando wmic o scripts)*                | `(Get-Process notepad).PriorityClass = "High"` |

---

## 4. Comandos gráficos y herramientas integradas

| Comando        | Descripción                                                                |
| -------------- | -------------------------------------------------------------------------- |
| `taskmgr`      | Abre el **Administrador de tareas**.                                       |
| `resmon`       | Abre el **Monitor de recursos** (más detallado que el Administrador).      |
| `perfmon`      | Abre el **Monitor de rendimiento**.                                        |
| `msconfig`     | Permite gestionar procesos de inicio.                                      |
| `services.msc` | Abre la consola de servicios (algunos procesos se inician como servicios). |

---

## Ejemplos útiles de PowerShell

```powershell
# Ver los 5 procesos que más consumen CPU
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5

# Ver todos los procesos de un usuario específico
Get-WmiObject Win32_Process | Where-Object { $_.GetOwner().User -eq "Francisco" }

# Cerrar todos los procesos de Notepad
Get-Process notepad | Stop-Process -Force

# Abrir el Bloc de notas como administrador
Start-Process "notepad.exe" -Verb RunAs
```

---

[Regresar a la guía principal](./../readme.md#3-windows)

> **Autor:** Fravelz
