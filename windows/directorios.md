# Directorios Importantes de Windows

---

## Temario

- [Directorios Importantes de Windows](#directorios-importantes-de-windows)
  - [Temario](#temario)
  - [Directorios del sistema](#directorios-del-sistema)
  - [Directorios de usuario](#directorios-de-usuario)
  - [Directorios de programas](#directorios-de-programas)
  - [Directorios temporales y de sistema adicional](#directorios-temporales-y-de-sistema-adicional)

[Regresar a la guía principal](./../readme.md#3-windows)

---

## Directorios del sistema

Estos contienen archivos de Windows y componentes esenciales del sistema operativo:

| Directorio           | Ruta típica           | Función                                                                                             |
| -------------------- | --------------------- | --------------------------------------------------------------------------------------------------- |
| **Windows**          | `C:\Windows`          | Carpeta principal del sistema operativo. Contiene casi todo lo que Windows necesita para funcionar. |
| **System32**         | `C:\Windows\System32` | Archivos críticos del sistema, DLLs, ejecutables y utilidades de Windows.                           |
| **SysWOW64**         | `C:\Windows\SysWOW64` | Versiones de 32 bits de las librerías del sistema en sistemas Windows de 64 bits.                   |
| **WinSxS**           | `C:\Windows\WinSxS`   | Componentes del sistema y librerías para compatibilidad.                                            |
| **Temp del sistema** | `C:\Windows\Temp`     | Archivos temporales del sistema. Puede limpiarse para liberar espacio.                              |

---

## Directorios de usuario

Contienen los datos de cada usuario y configuraciones personales:

| Directorio             | Ruta típica                    | Función                                                                                         |
| ---------------------- | ------------------------------ | ----------------------------------------------------------------------------------------------- |
| **Users**              | `C:\Users`                     | Carpeta raíz de los perfiles de usuario.                                                        |
| **Perfil del usuario** | `C:\Users\<Usuario>`           | Carpeta personal de cada usuario con documentos, descargas y configuraciones.                   |
| **Documentos**         | `C:\Users\<Usuario>\Documents` | Documentos y archivos del usuario.                                                              |
| **Descargas**          | `C:\Users\<Usuario>\Downloads` | Archivos descargados de Internet.                                                               |
| **Escritorio**         | `C:\Users\<Usuario>\Desktop`   | Archivos y accesos directos visibles en el escritorio.                                          |
| **AppData**            | `C:\Users\<Usuario>\AppData`   | Archivos de configuración y datos de aplicaciones. Subcarpetas: `Local`, `LocalLow`, `Roaming`. |

---

## Directorios de programas

Donde se instalan las aplicaciones:

| Directorio                         | Ruta típica              | Función                                                          |
| ---------------------------------- | ------------------------ | ---------------------------------------------------------------- |
| **Archivos de programa (64 bits)** | `C:\Program Files`       | Instalaciones de aplicaciones de 64 bits.                        |
| **Archivos de programa (32 bits)** | `C:\Program Files (x86)` | Instalaciones de aplicaciones de 32 bits en sistemas de 64 bits. |

---

## Directorios temporales y de sistema adicional

- **Temp del usuario**: `C:\Users\<Usuario>\AppData\Local\Temp` → Archivos temporales de programas.

- **Prefetch**: `C:\Windows\Prefetch` → Optimización de arranque y ejecución de programas.

- **Recycle Bin**: `C:\$Recycle.Bin` → Papelera de reciclaje.

---

## Tips

- Nunca elimines carpetas como `System32` o `WinSxS`.

- `AppData` y `Temp` se pueden limpiar con cuidado para liberar espacio.

---

[Regresar a la guía principal](./../readme.md#3-windows)

> **Autor:** Fravelz
