# Comandos y cmdlets de gestión de usuarios

---

## Temario

- [Comandos y cmdlets de gestión de usuarios](#comandos-y-cmdlets-de-gestión-de-usuarios)
  - [Temario](#temario)
  - [1. Comandos de gestión de usuarios en CMD](#1-comandos-de-gestión-de-usuarios-en-cmd)
  - [2. Cmdlets de gestión de usuarios en PowerShell](#2-cmdlets-de-gestión-de-usuarios-en-powershell)
    - [Usuarios locales](#usuarios-locales)
    - [Grupos locales](#grupos-locales)
    - [Información y autenticación](#información-y-autenticación)
    - [Active Directory (solo si tienes AD instalado)](#active-directory-solo-si-tienes-ad-instalado)
  - [3. Comandos útiles para entornos mixtos (CMD + PowerShell)](#3-comandos-útiles-para-entornos-mixtos-cmd--powershell)

[Regresar a la guía principal](./../readme.md#3-windows)

---

## 1. Comandos de gestión de usuarios en CMD

> Estos comandos funcionan directamente desde **Símbolo del sistema (cmd)** con permisos de administrador.

| Comando                                    | Descripción                                                         | Ejemplo                                    |                            |
| ------------------------------------------ | ------------------------------------------------------------------- | ------------------------------------------ | -------------------------- |
| `net user`                                 | Muestra todos los usuarios locales.                                 | `net user`                                 |                            |
| `net user <usuario>`                       | Muestra información sobre un usuario.                               | `net user Francisco`                       |                            |
| `net user <usuario> <contraseña> /add`     | Crea un nuevo usuario.                                              | `net user Juan 1234 /add`                  |                            |
| `net user <usuario> /delete`               | Elimina un usuario.                                                 | `net user Juan /delete`                    |                            |
| `net user <usuario> *`                     | Cambia la contraseña del usuario (la pedirá).                       | `net user Francisco *`                     |                            |
| `net user <usuario> /active:yes            | no`                                                                 | Activa o desactiva una cuenta.             | `net user Juan /active:no` |
| `net localgroup`                           | Muestra los grupos locales.                                         | `net localgroup`                           |                            |
| `net localgroup <grupo>`                   | Muestra los usuarios del grupo.                                     | `net localgroup Administradores`           |                            |
| `net localgroup <grupo> <usuario> /add`    | Agrega un usuario a un grupo.                                       | `net localgroup Administradores Juan /add` |                            |
| `net localgroup <grupo> <usuario> /delete` | Quita un usuario de un grupo.                                       | `net localgroup Usuarios Juan /delete`     |                            |
| `whoami`                                   | Muestra el usuario actual.                                          | `whoami`                                   |                            |
| `echo %username%`                          | Muestra el nombre de usuario desde variable de entorno.             | `echo %username%`                          |                            |
| `control userpasswords2`                   | Abre la interfaz avanzada de gestión de usuarios.                   | `control userpasswords2`                   |                            |
| `lusrmgr.msc`                              | Abre la consola de usuarios y grupos locales (solo en Windows Pro). | `lusrmgr.msc`                              |                            |

---

## 2. Cmdlets de gestión de usuarios en PowerShell

> Estos cmdlets forman parte de los módulos **Microsoft.PowerShell.LocalAccounts** o **ActiveDirectory** (si está instalado).

### Usuarios locales

| Cmdlet              | Descripción                             | Ejemplo                                                                         |
| ------------------- | --------------------------------------- | ------------------------------------------------------------------------------- |
| `Get-LocalUser`     | Lista los usuarios locales.             | `Get-LocalUser`                                                                 |
| `New-LocalUser`     | Crea un nuevo usuario local.            | `New-LocalUser -Name "Juan" -Password (Read-Host -AsSecureString "Contraseña")` |
| `Remove-LocalUser`  | Elimina un usuario local.               | `Remove-LocalUser -Name "Juan"`                                                 |
| `Set-LocalUser`     | Modifica las propiedades de un usuario. | `Set-LocalUser -Name "Juan" -Description "Usuario de prueba"`                   |
| `Enable-LocalUser`  | Activa un usuario.                      | `Enable-LocalUser -Name "Juan"`                                                 |
| `Disable-LocalUser` | Desactiva un usuario.                   | `Disable-LocalUser -Name "Juan"`                                                |

---

### Grupos locales

| Cmdlet                    | Descripción                                 | Ejemplo                                                                      |
| ------------------------- | ------------------------------------------- | ---------------------------------------------------------------------------- |
| `Get-LocalGroup`          | Lista los grupos locales.                   | `Get-LocalGroup`                                                             |
| `New-LocalGroup`          | Crea un grupo nuevo.                        | `New-LocalGroup -Name "Desarrolladores" -Description "Equipo de desarrollo"` |
| `Remove-LocalGroup`       | Elimina un grupo.                           | `Remove-LocalGroup -Name "Desarrolladores"`                                  |
| `Get-LocalGroupMember`    | Muestra los miembros de un grupo.           | `Get-LocalGroupMember -Group "Administradores"`                              |
| `Add-LocalGroupMember`    | Agrega un usuario o grupo a un grupo local. | `Add-LocalGroupMember -Group "Administradores" -Member "Juan"`               |
| `Remove-LocalGroupMember` | Quita un usuario de un grupo local.         | `Remove-LocalGroupMember -Group "Usuarios" -Member "Juan"`                   |

---

### Información y autenticación

| Cmdlet                                                           | Descripción                                            | Ejemplo                             |
| ---------------------------------------------------------------- | ------------------------------------------------------ | ----------------------------------- |
| `whoami`                                                         | Muestra el usuario actual (también en CMD).            | `whoami`                            |
| `[System.Security.Principal.WindowsIdentity]::GetCurrent().Name` | Muestra el usuario actual con más detalle.             | *(copiar y ejecutar en PowerShell)* |
| `Get-ChildItem Env:USERNAME`                                     | Muestra el nombre de usuario como variable de entorno. | `Get-ChildItem Env:USERNAME`        |

---

### Active Directory (solo si tienes AD instalado)

| Cmdlet              | Descripción                                     | Ejemplo                                                                                                                       |
| ------------------- | ----------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `Get-ADUser`        | Muestra información de usuarios del dominio.    | `Get-ADUser -Filter *`                                                                                                        |
| `New-ADUser`        | Crea un nuevo usuario en el dominio.            | `New-ADUser -Name "Carlos" -SamAccountName "carlos" -AccountPassword (Read-Host -AsSecureString "Contraseña") -Enabled $true` |
| `Set-ADUser`        | Modifica propiedades de un usuario del dominio. | `Set-ADUser carlos -Title "Administrador"`                                                                                    |
| `Enable-ADAccount`  | Activa una cuenta de AD.                        | `Enable-ADAccount carlos`                                                                                                     |
| `Disable-ADAccount` | Desactiva una cuenta de AD.                     | `Disable-ADAccount carlos`                                                                                                    |
| `Get-ADGroup`       | Muestra los grupos de dominio.                  | `Get-ADGroup -Filter *`                                                                                                       |

---

## 3. Comandos útiles para entornos mixtos (CMD + PowerShell)

| Tarea                      | CMD                                        | PowerShell                                                     |
| -------------------------- | ------------------------------------------ | -------------------------------------------------------------- |
| Ver usuario actual         | `whoami`                                   | `whoami` o `$Env:USERNAME`                                     |
| Crear usuario              | `net user Juan 1234 /add`                  | `New-LocalUser -Name "Juan"`                                   |
| Eliminar usuario           | `net user Juan /delete`                    | `Remove-LocalUser -Name "Juan"`                                |
| Agregar usuario a grupo    | `net localgroup Administradores Juan /add` | `Add-LocalGroupMember -Group "Administradores" -Member "Juan"` |
| Ver miembros de grupo      | `net localgroup Administradores`           | `Get-LocalGroupMember -Group "Administradores"`                |
| Activar/desactivar usuario | `net user Juan /active:yes`                | `Enable-LocalUser -Name "Juan"`                                |

---

[Regresar a la guía principal](./../readme.md#3-windows)

> **Autor:** Fravelz
