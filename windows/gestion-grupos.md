# Comandos y cmdlets de grupos

---

## Temario

- [Comandos y cmdlets de grupos](#comandos-y-cmdlets-de-grupos)
  - [Temario](#temario)
  - [1. Comandos de gestión de grupos en CMD](#1-comandos-de-gestión-de-grupos-en-cmd)
  - [2. Cmdlets de gestión de grupos en PowerShell](#2-cmdlets-de-gestión-de-grupos-en-powershell)
    - [Grupos locales](#grupos-locales)
    - [Grupos de dominio (Active Directory)](#grupos-de-dominio-active-directory)
  - [3. Comparativa CMD vs PowerShell](#3-comparativa-cmd-vs-powershell)
  - [4. Atajos y comandos gráficos](#4-atajos-y-comandos-gráficos)

[Regresar a la guía principal](./../readme.md#3-windows)

---

## 1. Comandos de gestión de grupos en CMD

> Todos estos comandos se ejecutan en **Símbolo del sistema (CMD)** con permisos de administrador.

| Comando                                           | Descripción                                          | Ejemplo                                       |
| ------------------------------------------------- | ---------------------------------------------------- | --------------------------------------------- |
| `net localgroup`                                  | Muestra todos los grupos locales del equipo.         | `net localgroup`                              |
| `net localgroup <nombre_grupo>`                   | Muestra los miembros del grupo.                      | `net localgroup Administradores`              |
| `net localgroup <nombre_grupo> /add`              | Crea un nuevo grupo local.                           | `net localgroup Desarrolladores /add`         |
| `net localgroup <nombre_grupo> /delete`           | Elimina un grupo local.                              | `net localgroup Desarrolladores /delete`      |
| `net localgroup <nombre_grupo> <usuario> /add`    | Agrega un usuario al grupo.                          | `net localgroup Administradores Juan /add`    |
| `net localgroup <nombre_grupo> <usuario> /delete` | Elimina un usuario del grupo.                        | `net localgroup Administradores Juan /delete` |
| `net user <usuario>`                              | Muestra los grupos a los que pertenece el usuario.   | `net user Juan`                               |
| `net group`                                       | (En redes de dominio) Muestra los grupos de dominio. | `net group`                                   |
| `net group <nombre_grupo>`                        | Muestra los miembros del grupo de dominio.           | `net group Ventas`                            |
| `net group <nombre_grupo> /add`                   | Crea un grupo de dominio (solo en AD).               | `net group Finanzas /add`                     |
| `net group <nombre_grupo> /delete`                | Elimina un grupo de dominio.                         | `net group Finanzas /delete`                  |
| `net group <nombre_grupo> <usuario> /add`         | Agrega un usuario a un grupo del dominio.            | `net group Finanzas Juan /add`                |

---

## 2. Cmdlets de gestión de grupos en PowerShell

> Estos cmdlets pertenecen al módulo **Microsoft.PowerShell.LocalAccounts** (para grupos locales).
> Si usas Active Directory, también hay cmdlets del módulo **ActiveDirectory**.

---

### Grupos locales

| Cmdlet                          | Descripción                                   | Ejemplo                                                                      |
| ------------------------------- | --------------------------------------------- | ---------------------------------------------------------------------------- |
| `Get-LocalGroup`                | Muestra todos los grupos locales del sistema. | `Get-LocalGroup`                                                             |
| `Get-LocalGroup -Name <nombre>` | Muestra información detallada de un grupo.    | `Get-LocalGroup -Name "Administradores"`                                     |
| `New-LocalGroup`                | Crea un grupo local nuevo.                    | `New-LocalGroup -Name "Desarrolladores" -Description "Equipo de desarrollo"` |
| `Remove-LocalGroup`             | Elimina un grupo local.                       | `Remove-LocalGroup -Name "Desarrolladores"`                                  |
| `Get-LocalGroupMember`          | Muestra los miembros de un grupo local.       | `Get-LocalGroupMember -Group "Administradores"`                              |
| `Add-LocalGroupMember`          | Agrega un usuario o grupo a un grupo local.   | `Add-LocalGroupMember -Group "Administradores" -Member "Juan"`               |
| `Remove-LocalGroupMember`       | Quita un usuario o grupo de un grupo local.   | `Remove-LocalGroupMember -Group "Usuarios" -Member "Juan"`                   |

---

### Grupos de dominio (Active Directory)

*(solo si tienes instalado el módulo `ActiveDirectory` y estás en un dominio)*

| Cmdlet                 | Descripción                                     | Ejemplo                                                                                      |
| ---------------------- | ----------------------------------------------- | -------------------------------------------------------------------------------------------- |
| `Get-ADGroup`          | Lista los grupos del dominio.                   | `Get-ADGroup -Filter *`                                                                      |
| `Get-ADGroupMember`    | Muestra los miembros de un grupo del dominio.   | `Get-ADGroupMember -Identity "Ventas"`                                                       |
| `New-ADGroup`          | Crea un grupo en Active Directory.              | `New-ADGroup -Name "Finanzas" -GroupScope Global -Path "OU=Departamentos,DC=empresa,DC=com"` |
| `Remove-ADGroup`       | Elimina un grupo del dominio.                   | `Remove-ADGroup -Identity "Finanzas"`                                                        |
| `Add-ADGroupMember`    | Agrega usuarios o grupos a un grupo de dominio. | `Add-ADGroupMember -Identity "Finanzas" -Members "Juan","Maria"`                             |
| `Remove-ADGroupMember` | Elimina miembros de un grupo de dominio.        | `Remove-ADGroupMember -Identity "Finanzas" -Members "Juan"`                                  |
| `Set-ADGroup`          | Modifica propiedades de un grupo.               | `Set-ADGroup -Identity "Finanzas" -Description "Grupo del área contable"`                    |

---

## 3. Comparativa CMD vs PowerShell

| Tarea                    | CMD                                           | PowerShell                                                        |
| ------------------------ | --------------------------------------------- | ----------------------------------------------------------------- |
| Ver grupos locales       | `net localgroup`                              | `Get-LocalGroup`                                                  |
| Ver miembros de un grupo | `net localgroup Administradores`              | `Get-LocalGroupMember -Group "Administradores"`                   |
| Crear un grupo           | `net localgroup Desarrolladores /add`         | `New-LocalGroup -Name "Desarrolladores"`                          |
| Eliminar un grupo        | `net localgroup Desarrolladores /delete`      | `Remove-LocalGroup -Name "Desarrolladores"`                       |
| Agregar usuario a grupo  | `net localgroup Administradores Juan /add`    | `Add-LocalGroupMember -Group "Administradores" -Member "Juan"`    |
| Quitar usuario del grupo | `net localgroup Administradores Juan /delete` | `Remove-LocalGroupMember -Group "Administradores" -Member "Juan"` |
| Listar grupos de dominio | `net group`                                   | `Get-ADGroup -Filter *`                                           |
| Crear grupo en dominio   | `net group Ventas /add`                       | `New-ADGroup -Name "Ventas" -GroupScope Global`                   |

---

## 4. Atajos y comandos gráficos

| Comando                                      | Descripción                                                                             |
| -------------------------------------------- | --------------------------------------------------------------------------------------- |
| `lusrmgr.msc`                                | Abre la consola gráfica de **Usuarios y Grupos locales** (solo Windows Pro y superior). |
| `control userpasswords2`                     | Permite administrar usuarios y grupos de forma avanzada.                                |
| `compmgmt.msc` → “Usuarios y grupos locales” | Alternativa para versiones Pro.                                                         |

---

[Regresar a la guía principal](./../readme.md#3-windows)

> **Autor:** Fravelz
