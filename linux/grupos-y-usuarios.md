# Grupos y Usuarios

---

## Temario

- [Grupos y Usuarios](#grupos-y-usuarios)
  - [Temario](#temario)
  - [1. Gestión de usuarios](#1-gestión-de-usuarios)
    - [`useradd` vs `adduser`](#useradd-vs-adduser)
      - [1. `useradd` (programa básico del sistema)](#1-useradd-programa-básico-del-sistema)
      - [2. `adduser` (script de alto nivel)](#2-adduser-script-de-alto-nivel)
      - [Comparación directa](#comparación-directa)
      - [En resumen (gestión de usuarios)](#en-resumen-gestión-de-usuarios)
  - [2. Grupos](#2-grupos)
    - [Gestión de grupos](#gestión-de-grupos)
    - [¿Qué es un grupo en Linux?](#qué-es-un-grupo-en-linux)
    - [Ejemplo simple](#ejemplo-simple)
    - [Cada usuario tiene](#cada-usuario-tiene)
    - [Ver los grupos de un usuario](#ver-los-grupos-de-un-usuario)
    - [Archivos donde se guardan los grupos](#archivos-donde-se-guardan-los-grupos)
    - [En resumen (gestión de grupos)](#en-resumen-gestión-de-grupos)
  - [3. Archivos importantes del sistema](#3-archivos-importantes-del-sistema)
  - [4. Ejemplos prácticos comunes](#4-ejemplos-prácticos-comunes)
  - [Utilidad de grupos y usuarios](#utilidad-de-grupos-y-usuarios)
    - [1. Cuando hay varios usuarios](#1-cuando-hay-varios-usuarios)
    - [2. Cuando eres el único usuario](#2-cuando-eres-el-único-usuario)
      - [a) Seguridad interna](#a-seguridad-interna)
      - [b) Servicios y procesos del sistema](#b-servicios-y-procesos-del-sistema)
      - [c) Control de dispositivos y permisos especiales](#c-control-de-dispositivos-y-permisos-especiales)
        - [En resumen (utilidad de grupos y usuarios)](#en-resumen-utilidad-de-grupos-y-usuarios)
    - [3. Otros](#3-otros)
      - [1. Cuando creas o manejas máquinas (virtuales o reales)](#1-cuando-creas-o-manejas-máquinas-virtuales-o-reales)
      - [2. En ciberseguridad o administración](#2-en-ciberseguridad-o-administración)
      - [3. En desarrollo o automatización](#3-en-desarrollo-o-automatización)
      - [En resumen (otros)](#en-resumen-otros)

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

---

## 1. Gestión de usuarios

| Comando           | Descripción                                                      | Ejemplo                                                 |
| ----------------- | ---------------------------------------------------------------- | ------------------------------------------------------- |
| `useradd`         | Crea un nuevo usuario.                                           | `sudo useradd francisco`                                |
| `adduser`         | Variante más amigable de `useradd` (usa asistentes).             | `sudo adduser francisco`                                |
| `passwd`          | Asigna o cambia la contraseña de un usuario.                     | `sudo passwd francisco`                                 |
| `usermod`         | Modifica las propiedades de un usuario existente.                | `sudo usermod -aG sudo francisco` (añadir a grupo sudo) |
| `userdel`         | Elimina un usuario (sin borrar su carpeta personal).             | `sudo userdel francisco`                                |
| `sudo userdel -r` | Elimina un usuario y **su directorio home**.                     | `sudo userdel -r francisco`                             |
| `id`              | Muestra el ID del usuario y sus grupos.                          | `id francisco`                                          |
| `whoami`          | Muestra el nombre del usuario actual.                            | `whoami`                                                |
| `su`              | Cambia de usuario (abre una sesión de otro usuario).             | `su francisco`                                          |
| `sudo`            | Ejecuta un comando como superusuario o con privilegios elevados. | `sudo apt update`                                       |

### `useradd` vs `adduser`

#### 1. `useradd` (programa básico del sistema)

- Es el **comando original** de bajo nivel de Linux para crear usuarios.
- Pertenece al paquete **`passwd`** o **`shadow`** (dependiendo de la distro).
- No crea automáticamente todo lo necesario (por ejemplo, la carpeta personal).
- Solo ejecuta **una instrucción directa al sistema**, sin preguntar nada.
- Se usa mucho en **scripts o administración avanzada**.

**Ejemplo:**

``` bash
sudo useradd francisco
```

Esto **solo** crea la entrada en `/etc/passwd`, pero:

- No crea `/home/francisco`
- No copia archivos de configuración por defecto (`.bashrc`, etc.)
- No asigna contraseña

Tendrías que hacer todo manualmente:

``` bash
sudo mkdir /home/francisco
sudo cp -r /etc/skel/. /home/francisco
sudo chown -R francisco:francisco /home/francisco
sudo passwd francisco
```

#### 2. `adduser` (script de alto nivel)

- Es un **script en Perl** que usa internamente `useradd`, pero con **asistentes interactivos**.
- **Crea automáticamente:**

  - Carpeta personal (`/home/usuario`)
  - Archivos de configuración inicial
  - Grupo con el mismo nombre
  - Permisos correctos
  - Pide la contraseña y otros datos de forma interactiva
- Está pensado para **uso cotidiano y comodidad del administrador**.

**Ejemplo:**

``` bash
sudo adduser francisco
```

Esto:

- Crea `/home/francisco`
- Crea el grupo `francisco`
- Copia los archivos de `/etc/skel`
- Asigna contraseña (te la pide)
- Te deja todo listo en un paso

#### Comparación directa

| Característica                       | `useradd`                                     | `adduser`                           |
| ------------------------------------ | --------------------------------------------- | ----------------------------------- |
| Tipo de programa                     | Binario del sistema                           | Script en Perl                      |
| Nivel                                | Bajo nivel (más técnico)                      | Alto nivel (más amigable)           |
| Interactivo                          | ❌ No                                          | ✅ Sí                                |
| Crea carpeta `/home` automáticamente | ❌ No (debes usar `-m`)                        | ✅ Sí                                |
| Crea grupo automáticamente           | ❌ No (debes usar `-g`)                        | ✅ Sí                                |
| Solicita contraseña                  | ❌ No                                          | ✅ Sí                                |
| Ideal para                           | Scripts, automatización, distros minimalistas | Uso diario, administración sencilla |

#### En resumen (gestión de usuarios)

- Usa **`adduser`** cuando creas usuarios manualmente (más seguro y rápido).
- Usa **`useradd`** en **scripts o configuraciones personalizadas**, donde controlas cada detalle.

---

## 2. Grupos

### Gestión de grupos

| Comando       | Descripción                                        | Ejemplo                                      |
| ------------- | -------------------------------------------------- | -------------------------------------------- |
| `groupadd`    | Crea un nuevo grupo.                               | `sudo groupadd desarrolladores`              |
| `groupdel`    | Elimina un grupo.                                  | `sudo groupdel desarrolladores`              |
| `usermod -aG` | Añade un usuario a un grupo.                       | `sudo usermod -aG desarrolladores francisco` |
| `gpasswd -d`  | Elimina un usuario de un grupo.                    | `sudo gpasswd -d francisco desarrolladores`  |
| `groups`      | Muestra los grupos a los que pertenece un usuario. | `groups francisco`                           |
| `newgrp`      | Cambia temporalmente el grupo activo en la sesión. | `newgrp desarrolladores`                     |

### ¿Qué es un grupo en Linux?

Un **grupo** es un conjunto de usuarios que **comparten ciertos permisos**.
Sirve para **organizar quién puede hacer qué** con los archivos, carpetas o procesos del sistema.

Piensa que un grupo es como un “equipo” dentro del sistema operativo.

### Ejemplo simple

Imagina que tienes tres usuarios:

``` bash
juan
maria
pedro
```

Y quieres que **solo juan y maria puedan entrar** a una carpeta llamada `/proyecto`.

En lugar de dar permisos a cada uno individualmente, puedes crear un grupo:

``` bash
sudo groupadd proyecto
```

Luego agregas a los usuarios al grupo:

``` bash
sudo usermod -aG proyecto juan
sudo usermod -aG proyecto maria
```

Después haces que la carpeta pertenezca a ese grupo:

``` bash
sudo chown :proyecto /proyecto
```

Y le das permisos solo al grupo:

``` bash
sudo chmod 770 /proyecto
```

Ahora:

- Juan ✅ puede entrar.
- María ✅ puede entrar.
- Pedro ❌ no puede.

### Cada usuario tiene

1. **Un grupo principal (primario):**
   Se crea automáticamente con el mismo nombre que el usuario.
   Ejemplo: el usuario `francisco` pertenece al grupo `francisco`.

2. **Grupos secundarios (suplementarios):**
   Son grupos extra a los que puede pertenecer.
   Ejemplo:

   ``` bash
   sudo usermod -aG sudo,video,audio francisco
   ```

   Aquí el usuario pertenece a los grupos:

   - `sudo` → puede usar comandos como administrador
   - `video` → puede acceder a la cámara o GPU
   - `audio` → puede usar el micrófono o altavoces

### Ver los grupos de un usuario

``` bash
groups francisco
```

Salida posible:

``` bash
francisco : francisco sudo video audio
```

### Archivos donde se guardan los grupos

- `/etc/group` → lista todos los grupos del sistema.
  Ejemplo de líneas:

  ``` bash
  root:x:0:
  sudo:x:27:francisco
  proyecto:x:1002:juan,maria
  ```

### En resumen (gestión de grupos)

| Concepto               | Significado                                               |
| ---------------------- | --------------------------------------------------------- |
| **Grupo**              | Conjunto de usuarios que comparten permisos.              |
| **Grupo primario**     | Grupo principal que tiene cada usuario por defecto.       |
| **Grupos secundarios** | Otros grupos a los que el usuario pertenece.              |
| **Ventaja**            | Facilita administrar permisos a varios usuarios a la vez. |

---

## 3. Archivos importantes del sistema

| Archivo        | Contiene                                                             |
| -------------- | -------------------------------------------------------------------- |
| `/etc/passwd`  | Información básica de todos los usuarios.                            |
| `/etc/shadow`  | Contraseñas cifradas de los usuarios.                                |
| `/etc/group`   | Información sobre los grupos del sistema.                            |
| `/etc/sudoers` | Usuarios que tienen permisos de superusuario (editado con `visudo`). |

---

## 4. Ejemplos prácticos comunes

- **Crear un usuario con carpeta personal y shell bash:**

  ``` bash
  sudo useradd -m -s /bin/bash francisco
  ```

- **Cambiar nombre de usuario:**

  ``` bash
  sudo usermod -l nuevo_nombre francisco
  ```

- **Bloquear/desbloquear usuario:**

  ``` bash
  sudo usermod -L francisco    # Bloquear
  sudo usermod -U francisco    # Desbloquear
  ```

- **Ver todos los usuarios del sistema:**

  ``` bash
  cut -d: -f1 /etc/passwd
  ```

---

## Utilidad de grupos y usuarios

### 1. Cuando hay varios usuarios

Ahí es donde **más se nota su función**.

Ejemplo:
En un servidor o una universidad, hay muchos usuarios distintos:

- Cada uno tiene su cuenta (`/home/juan`, `/home/maria`, etc.)
- Cada uno solo puede entrar a su carpeta
- Los administradores (grupo `sudo`) pueden cambiar configuraciones del sistema
- Otros grupos controlan quién puede acceder a redes, dispositivos USB, cámaras, etc.

Así, Linux mantiene la **seguridad y el orden** entre todos los usuarios.

---

### 2. Cuando eres el único usuario

Incluso así, **sigue siendo muy útil** por estas razones:

#### a) Seguridad interna

- El sistema separa procesos y permisos por usuario.
- Ejemplo: si un programa malicioso se ejecuta como “usuario normal”, **no puede dañar el sistema**, porque no tiene permisos de administrador.

Tu usuario normal pertenece a su propio grupo (por ejemplo, `francisco:francisco`), y no puede tocar archivos del sistema (`/etc`, `/usr`, etc.) sin usar `sudo`.

---

#### b) Servicios y procesos del sistema

Linux trata **cada servicio como si fuera un usuario separado** para aislarlos.

Por ejemplo:

``` bash
root       → superusuario
mysql      → usuario del servicio MySQL
www-data   → usuario del servidor web Apache o Nginx
nobody     → usuario “vacío” usado por procesos sin privilegios
```

Así, si un servicio (como un servidor web) es hackeado, el atacante **no puede controlar todo el sistema**, solo ese usuario limitado.

---

#### c) Control de dispositivos y permisos especiales

Los grupos también controlan **qué puede hacer tu usuario con el hardware**, incluso si eres el único:

- `audio` → para reproducir sonido
- `video` → para usar la cámara
- `network` → para cambiar redes
- `docker`, `kvm`, `vboxusers`, etc. → para manejar máquinas virtuales, contenedores, etc.

Si no estás en esos grupos, el sistema simplemente **no te deja usar esos recursos**.

---

##### En resumen (utilidad de grupos y usuarios)

| Situación                | ¿Por qué sirven usuarios y grupos?                              |
| ------------------------ | --------------------------------------------------------------- |
| Varios usuarios en un PC | Controlan el acceso y los permisos entre personas distintas.    |
| Solo un usuario en el PC | Protegen el sistema, los servicios y los recursos del hardware. |

---

### 3. Otros

#### 1. Cuando creas o manejas máquinas (virtuales o reales)

Cada máquina (por ejemplo, una que instalas con VirtualBox, KVM o Docker) tiene su propio **sistema Linux**, y dentro de él **todo funciona con usuarios y grupos**.

Si no los entiendes:

- No sabrás **por qué un programa no puede acceder a un archivo.**
- No podrás **dar permisos** a scripts, servidores o procesos.
- No entenderás **por qué “root” puede hacerlo todo** y tu usuario no.

En máquinas virtuales o servidores, *la seguridad y estabilidad dependen directamente de esos permisos.*

#### 2. En ciberseguridad o administración

Si quieres aprender hacking ético, pentesting o proteger sistemas, necesitas dominar esto porque:

- Los atacantes intentan **escapar del usuario limitado** (por ejemplo, `www-data`) y conseguir permisos de `root`.
- Los administradores deben **configurar correctamente los grupos y permisos** para que eso no sea posible.

Ejemplo:
Si un servicio web corre como usuario `www-data`, no debería poder leer `/etc/shadow` (donde están las contraseñas).
Ese aislamiento lo logran los **usuarios y grupos**.

#### 3. En desarrollo o automatización

Cuando haces tus propias máquinas, scripts o aplicaciones:

- Puedes crear **usuarios específicos para cada proceso** (por seguridad).
- Asignar **grupos** para definir qué scripts pueden acceder a ciertos archivos.
- Controlar **permisos de ejecución (`rwx`)** para evitar errores o accesos indebidos.

Ejemplo real:

``` bash
sudo useradd -r -s /bin/false servidor_web
```

Esto crea un usuario “de sistema” sin acceso a terminal, usado solo para ejecutar un servicio.

#### En resumen (otros)

| Área                                  | ¿Por qué es importante manejar usuarios y grupos?   |
| ------------------------------------- | --------------------------------------------------- |
| **Ciberseguridad**                    | Aísla procesos, evita escaladas de privilegios.     |
| **Sistemas / servidores**             | Controla accesos, protege servicios.                |
| **Programación / DevOps**             | Permite ejecutar procesos con seguridad.            |
| **Máquinas virtuales / contenedores** | Cada entorno tiene sus propios usuarios y permisos. |

En palabras simples:

> Si no entiendes cómo Linux maneja usuarios, grupos y permisos, nunca tendrás **control real** de una máquina.
> Pero cuando lo dominas, puedes **construir, romper y proteger sistemas** a tu gusto.

---

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

> **Autor:** Fravelz
