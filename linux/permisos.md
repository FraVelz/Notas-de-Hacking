# Permisos en Linux

## Temario

- [Permisos en Linux](#permisos-en-linux)
  - [Temario](#temario)
  - [1. Concepto básico de permisos](#1-concepto-básico-de-permisos)
    - [Tipos de permisos](#tipos-de-permisos)
    - [Categorías](#categorías)
  - [2. Ver permisos](#2-ver-permisos)
  - [3. Cambiar permisos (`chmod`)](#3-cambiar-permisos-chmod)
    - [a) Modo simbólico](#a-modo-simbólico)
    - [b) Modo numérico](#b-modo-numérico)
  - [4. Cambiar dueño o grupo (`chown`, `chgrp`)](#4-cambiar-dueño-o-grupo-chown-chgrp)
  - [5. Permisos especiales](#5-permisos-especiales)
    - [Sticky Bit](#sticky-bit)
    - [SUID y SGID](#suid-y-sgid)
      - [SUID](#suid)
      - [SGID](#sgid)
  - [6. Atributos de archivos (`chattr`, `lsattr`)](#6-atributos-de-archivos-chattr-lsattr)
    - [Ver atributos](#ver-atributos)
    - [Cambiar atributos (`chattr`)](#cambiar-atributos-chattr)
    - [Atributos comunes](#atributos-comunes)
    - [Ejemplo práctico en script Bash](#ejemplo-práctico-en-script-bash)
  - [7. Resumen visual](#7-resumen-visual)

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

---

## 1. Concepto básico de permisos

Cada archivo o carpeta tiene **3 tipos de permisos** y **3 categorías de usuarios**:

### Tipos de permisos

| Símbolo | Significado         | Valor |
| :-----: | ------------------- | :---: |
|   `r`   | Lectura (read)      |   4   |
|   `w`   | Escritura (write)   |   2   |
|   `x`   | Ejecución (execute) |   1   |

### Categorías

| Categoría | Se aplica a         |
| :-------: | ------------------- |
|    `u`    | Usuario propietario |
|    `g`    | Grupo propietario   |
|    `o`    | Otros usuarios      |

---

## 2. Ver permisos

``` bash
ls -l
```

Ejemplo:

``` bash
-rwxr-xr--  1 francisco users 1234 oct 21  script.sh
```

Significado:

- `rwx` → usuario
- `r-x` → grupo
- `r--` → otros
- `francisco` → dueño
- `users` → grupo

---

## 3. Cambiar permisos (`chmod`)

### a) Modo simbólico

``` bash
chmod u+x script.sh     # añadir ejecución al usuario
chmod g-w script.sh     # quitar escritura al grupo
chmod o=r file.txt      # solo lectura para otros
chmod a+r file.txt      # todos pueden leer
```

### b) Modo numérico

``` bash
chmod 755 script.sh
```

| Valor | Permiso | Descripción                   |
| :---: | :-----: | ----------------------------- |
|   7   |   rwx   | lectura, escritura, ejecución |
|   6   |   rw-   | lectura, escritura            |
|   5   |   r-x   | lectura, ejecución            |
|   4   |   r--   | solo lectura                  |
|   0   |   ---   | sin permisos                  |

---

## 4. Cambiar dueño o grupo (`chown`, `chgrp`)

``` bash
chown usuario archivo
chgrp grupo archivo
chown usuario:grupo archivo
```

Ejemplo:

``` bash
sudo chown francisco:users script.sh
```

---

## 5. Permisos especiales

Existen tres permisos especiales en Linux:

| Bit                  | Valor | Se aplica a            | Efecto                                       |
| -------------------- | ----- | ---------------------- | -------------------------------------------- |
| **SUID (`s`)**       | 4000  | Archivos ejecutables   | Se ejecuta con permisos del dueño            |
| **SGID (`s`)**       | 2000  | Archivos / directorios | Hereda grupo o ejecuta con grupo del archivo |
| **Sticky bit (`t`)** | 1000  | Directorios            | Solo el dueño puede borrar sus archivos      |

### Sticky Bit

El **sticky bit** se usa en directorios **para evitar que otros borren archivos ajenos**.

``` bash
chmod +t /tmp/publico
# o modo numérico
chmod 1777 /tmp/publico
```

Ver resultado:

``` bash
ls -ld /tmp/publico
drwxrwxrwt  9 root root 4096 oct 21 09:00 /tmp/publico
```

`drwxrwxrw**t**` → el “t” final indica el sticky bit activo.

Ejemplo típico:
El directorio `/tmp` **siempre lo tiene activado**.

### SUID y SGID

#### SUID

Ejemplo:

``` bash
ls -l /usr/bin/passwd
-rwsr-xr-x 1 root root 54256 oct 21 /usr/bin/passwd
```

- La `s` en lugar de la `x` del usuario indica **SUID activo**.
- Permite ejecutar con permisos del **dueño del archivo** (en este caso, root).

Activar o desactivar manualmente:

``` bash
chmod u+s archivo   # activar
chmod u-s archivo   # desactivar
```

#### SGID

En ejecutables:

``` bash
chmod g+s archivo
```

En directorios:

``` bash
chmod g+s carpeta/
```

Efecto:

> Los nuevos archivos heredan el grupo del directorio, útil para carpetas compartidas.

---

## 6. Atributos de archivos (`chattr`, `lsattr`)

Los **atributos** controlan *cómo* se comporta un archivo, más allá de los permisos.

### Ver atributos

``` bash
lsattr archivo
```

Ejemplo:

``` bash
----i--------e-----  documento.txt
```

### Cambiar atributos (`chattr`)

Hacer un archivo **inmutable**:

``` bash
sudo chattr +i archivo.txt
```

Solo **root** puede revertirlo:

``` bash
sudo chattr -i archivo.txt
```

Modo **append-only** (solo añadir contenido):

``` bash
sudo chattr +a log.txt
```

### Atributos comunes

| Letra | Descripción     | Uso                        |
| ----- | --------------- | -------------------------- |
| `i`   | Inmutable       | Proteger archivos críticos |
| `a`   | Solo append     | Logs o auditorías          |
| `c`   | Comprimir       | Backups                    |
| `d`   | Excluir de dump | Archivos temporales        |
| `e`   | Extents (ext4)  | Normalmente activo         |
| `s`   | Borrado seguro  | Privacidad                 |
| `u`   | Recuperable     | Auditoría                  |

### Ejemplo práctico en script Bash

``` bash
#!/bin/bash
# Proteger archivos del sistema

ARCHIVOS=("/etc/passwd" "/etc/shadow" "/etc/fstab")

for f in "${ARCHIVOS[@]}"; do
  if [ -f "$f" ]; then
    sudo chattr +i "$f"
    echo "Protegido: $f"
  fi
done

lsattr "${ARCHIVOS[@]}"
```

---

## 7. Resumen visual

| Permiso            | Valor | Aplica a             | Efecto                                       |
| ------------------ | ----- | -------------------- | -------------------------------------------- |
| SUID (`u+s`)       | 4000  | Archivos ejecutables | Ejecuta con permisos del dueño               |
| SGID (`g+s`)       | 2000  | Archivos / carpetas  | Hereda grupo o ejecuta con grupo del archivo |
| Sticky (`+t`)      | 1000  | Directorios          | Solo el dueño puede borrar sus archivos      |
| Inmutable (`+i`)   | —     | Archivos             | No se puede modificar ni borrar              |
| Append-only (`+a`) | —     | Archivos             | Solo se puede añadir contenido               |

---

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

> **Autor:** Fravelz
