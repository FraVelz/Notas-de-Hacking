# Comandos y cmdlets de ayuda y soporte

---

## Temario

- [Comandos y cmdlets de ayuda y soporte](#comandos-y-cmdlets-de-ayuda-y-soporte)
  - [Temario](#temario)
  - [1. Comandos de ayuda y soporte en CMD](#1-comandos-de-ayuda-y-soporte-en-cmd)
  - [2. Cmdlets de ayuda y soporte en PowerShell](#2-cmdlets-de-ayuda-y-soporte-en-powershell)
  - [3. Ayuda interactiva y documentación](#3-ayuda-interactiva-y-documentación)
  - [Sugerencia práctica](#sugerencia-práctica)

[Regresar a la guía principal](./../readme.md#3-windows)

---

## 1. Comandos de ayuda y soporte en CMD

| Comando           | Descripción                                                                | Ejemplo                       |
| ----------------- | -------------------------------------------------------------------------- | ----------------------------- |
| `help`            | Muestra todos los comandos disponibles de CMD.                             | `help`                        |
| `help <comando>`  | Muestra información sobre un comando específico.                           | `help dir`                    |
| `<comando> /?`    | Muestra la ayuda de un comando. Es equivalente a `help <comando>`.         | `ipconfig /?`                 |
| `systeminfo`      | Muestra información detallada del sistema (versión, RAM, BIOS, red, etc.). | `systeminfo`                  |
| `hostname`        | Muestra el nombre del equipo.                                              | `hostname`                    |
| `ver`             | Muestra la versión de Windows.                                             | `ver`                         |
| `set`             | Lista todas las variables de entorno.                                      | `set`                         |
| `echo %VARIABLE%` | Muestra el valor de una variable de entorno.                               | `echo %PATH%`                 |
| `driverquery`     | Lista los controladores instalados.                                        | `driverquery /v`              |
| `tasklist`        | Muestra los procesos en ejecución.                                         | `tasklist`                    |
| `taskkill`        | Cierra un proceso por nombre o PID.                                        | `taskkill /IM notepad.exe /F` |
| `sfc /scannow`    | Escanea y repara archivos del sistema dañados.                             | `sfc /scannow`                |
| `chkdsk`          | Verifica y repara errores en el disco.                                     | `chkdsk C: /f`                |
| `ipconfig /all`   | Muestra toda la información de red.                                        | `ipconfig /all`               |
| `ping`            | Comprueba la conectividad con un host.                                     | `ping google.com`             |
| `tracert`         | Muestra la ruta que sigue un paquete hasta un destino.                     | `tracert google.com`          |
| `netstat`         | Muestra conexiones de red activas.                                         | `netstat -an`                 |
| `systemreset`     | Abre el asistente para restablecer Windows.                                | `systemreset`                 |

---

## 2. Cmdlets de ayuda y soporte en PowerShell

| Cmdlet                                | Descripción                                                    | Ejemplo                                   |
| ------------------------------------- | -------------------------------------------------------------- | ----------------------------------------- |
| `Get-Help`                            | Muestra ayuda general o detallada sobre un cmdlet.             | `Get-Help Get-Process`                    |
| `Get-Command`                         | Lista todos los cmdlets disponibles.                           | `Get-Command`                             |
| `Get-Alias`                           | Muestra los alias (atajos) de comandos.                        | `Get-Alias`                               |
| `Get-Process`                         | Lista los procesos activos.                                    | `Get-Process`                             |
| `Stop-Process`                        | Termina un proceso.                                            | `Stop-Process -Name notepad -Force`       |
| `Get-Service`                         | Lista los servicios del sistema.                               | `Get-Service`                             |
| `Restart-Service`                     | Reinicia un servicio.                                          | `Restart-Service -Name Spooler`           |
| `Get-EventLog`                        | Muestra eventos del sistema, aplicación o seguridad.           | `Get-EventLog -LogName System -Newest 10` |
| `Get-ComputerInfo`                    | Información detallada del sistema (hardware, BIOS, red, etc.). | `Get-ComputerInfo`                        |
| `Test-Connection`                     | Versión avanzada de `ping`.                                    | `Test-Connection google.com -Count 4`     |
| `Get-HotFix`                          | Muestra actualizaciones instaladas.                            | `Get-HotFix`                              |
| `Get-WmiObject Win32_OperatingSystem` | Información avanzada del sistema operativo.                    | `Get-WmiObject Win32_OperatingSystem`     |
| `Get-ChildItem Env:`                  | Lista las variables de entorno.                                | `Get-ChildItem Env:`                      |
| `$Env:PATH`                           | Muestra una variable de entorno.                               | `$Env:PATH`                               |
| `Clear-Host`                          | Limpia la consola (equivalente a `cls`).                       | `Clear-Host`                              |
| `Get-EventViewer` *(nuevo en PS 7+)*  | Acceso más directo al Visor de Eventos.                        | `Get-EventViewer -LogName Application`    |

---

## 3. Ayuda interactiva y documentación

- En **CMD**:

  - `help` → lista básica.
  - `<comando> /?` → manual rápido.

- En **PowerShell**:

  - `Update-Help` → descarga la ayuda más reciente (requiere conexión).
  - `Get-Help <cmdlet> -Detailed` → descripción, parámetros y ejemplos.
  - `Get-Help <cmdlet> -Online` → abre la documentación oficial en el navegador.

---

## Sugerencia práctica

Para explorar PowerShell como un pro:

```powershell
Get-Command | Out-GridView
```

Te abre una ventana interactiva donde puedes **buscar, filtrar y explorar** todos los cmdlets disponibles.

---

[Regresar a la guía principal](./../readme.md#3-windows)

> **Autor:** Fravelz
