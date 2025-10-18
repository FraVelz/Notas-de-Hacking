# Comandos y cmdlets de gestión de permisos

---

## Temario

- [Comandos y cmdlets de gestión de permisos](#comandos-y-cmdlets-de-gestión-de-permisos)
  - [Temario](#temario)
  - [CMD — Comandos de Gestión de Permisos](#cmd--comandos-de-gestión-de-permisos)
  - [PowerShell — Cmdlets de Gestión de Permisos](#powershell--cmdlets-de-gestión-de-permisos)
  - [Ejemplos prácticos](#ejemplos-prácticos)
    - [CMD](#cmd)
    - [PowerShell](#powershell)

[Regresar a la guía principal](./../readme.md#3-windows)

---

## CMD — Comandos de Gestión de Permisos

| Comando                                                | Descripción                                                                                                       |
| ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------- |
| `icacls <ruta>`                                        | Muestra, modifica, guarda o restaura las listas de control de acceso (ACL) de archivos y carpetas.                |
| `icacls <ruta> /grant <usuario>:<permisos>`            | Concede permisos a un usuario. Ejemplo: `icacls C:\archivo.txt /grant Juan:(R,W)`                                 |
| `icacls <ruta> /deny <usuario>:<permisos>`             | Deniega permisos específicos.                                                                                     |
| `icacls <ruta> /remove <usuario>`                      | Quita los permisos de un usuario.                                                                                 |
| `icacls <ruta> /inheritance:r`                         | Desactiva la herencia de permisos.                                                                                |
| `icacls <ruta> /save permisos.txt /t`                  | Guarda los permisos actuales de una carpeta y subcarpetas.                                                        |
| `icacls <ruta> /restore permisos.txt`                  | Restaura permisos desde un archivo guardado.                                                                      |
| `cacls <ruta>`                                         | (Obsoleto, reemplazado por `icacls`) – mostraba y modificaba permisos NTFS.                                       |
| `takeown /f <ruta>`                                    | Toma posesión de un archivo o carpeta.                                                                            |
| `attrib <archivo> [+/-r] [+/-h] [+/-s]`                | Cambia atributos de solo lectura (R), oculto (H), o de sistema (S).                                               |
| `net share <nombre>=<ruta> /grant:<usuario>,<permiso>` | Comparte una carpeta con permisos específicos en red. Ejemplo: `net share Recursos=C:\Recursos /grant:Todos,READ` |

---

## PowerShell — Cmdlets de Gestión de Permisos

| Cmdlet                                                                                                   | Descripción                                                                      |
| -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `Get-Acl <ruta>`                                                                                         | Obtiene la lista de control de acceso (ACL) de un archivo, carpeta u objeto.     |
| `Set-Acl <ruta> <objetoACL>`                                                                             | Aplica una ACL modificada a un recurso.                                          |
| `$acl = Get-Acl <ruta>`                                                                                  | Guarda la ACL actual en una variable.                                            |
| `$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Usuario","FullControl","Allow")` | Crea una nueva regla de permisos.                                                |
| `$acl.AddAccessRule($rule)`                                                                              | Agrega la regla creada al objeto ACL.                                            |
| `Set-Acl <ruta> $acl`                                                                                    | Aplica los cambios.                                                              |
| `icacls`                                                                                                 | También disponible desde PowerShell (puedes usar los mismos comandos de CMD).    |
| `Get-ItemProperty -Path <ruta>`                                                                          | Muestra propiedades de un archivo o carpeta (incluye permisos en algunos casos). |
| `Grant-SmbShareAccess -Name <nombre> -AccountName <usuario> -AccessRight Full -Force`                    | Concede permisos de acceso a un recurso compartido SMB.                          |
| `Revoke-SmbShareAccess -Name <nombre> -AccountName <usuario>`                                            | Revoca permisos de acceso a un recurso compartido.                               |
| `Get-SmbShareAccess -Name <nombre>`                                                                      | Muestra los permisos actuales de un recurso compartido.                          |

---

## Ejemplos prácticos

### CMD

```bash
icacls "C:\Proyecto" /grant Juan:(R,W)
takeown /f "C:\Proyecto\archivo.txt"
```

### PowerShell

```powershell
$acl = Get-Acl "C:\Proyecto"
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Juan","Modify","Allow")
$acl.AddAccessRule($rule)
Set-Acl "C:\Proyecto" $acl
```

---

[Regresar a la guía principal](./../readme.md#3-windows)

> **Autor:** Fravelz
