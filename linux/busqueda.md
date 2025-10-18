# Comandos de Gestión de Búsqueda

---

## Temario

- [Comandos de Gestión de Búsqueda](#comandos-de-gestión-de-búsqueda)
  - [Temario](#temario)
  - [1. Buscar archivos y directorios](#1-buscar-archivos-y-directorios)
    - [`find`](#find)
  - [2. Buscar texto dentro de archivos](#2-buscar-texto-dentro-de-archivos)
    - [`grep`](#grep)
  - [3. Buscar archivos rápidamente](#3-buscar-archivos-rápidamente)
    - [`locate`](#locate)
  - [4. Buscar comandos o ejecutables](#4-buscar-comandos-o-ejecutables)
    - [`which`, `whereis`, `type`](#which-whereis-type)
  - [5. Buscar en el historial o procesos](#5-buscar-en-el-historial-o-procesos)
    - [Buscar en historial](#buscar-en-historial)
    - [Buscar procesos en ejecución](#buscar-procesos-en-ejecución)
  - [6. Buscar dentro de archivos comprimidos o binarios](#6-buscar-dentro-de-archivos-comprimidos-o-binarios)

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

---

## 1. Buscar archivos y directorios

### `find`

Busca archivos y carpetas según nombre, tipo, tamaño, fecha, etc.

``` bash
# Buscar por nombre (en todo el sistema)
find / -name "archivo.txt"

# Buscar sin importar mayúsculas/minúsculas
find /home -iname "foto.png"

# Buscar solo directorios
find /home -type d -name "Documentos"

# Buscar archivos mayores de 10 MB
find / -type f -size +10M

# Ejecutar un comando sobre los resultados
find /tmp -name "*.log" -exec rm {} \;
```

---

## 2. Buscar texto dentro de archivos

### `grep`

Busca texto dentro del contenido de archivos.

``` bash
# Buscar una palabra en un archivo
grep "error" archivo.log

# Buscar en todos los archivos de una carpeta
grep "main" *.cpp

# Buscar recursivamente (en subcarpetas)
grep -r "usuario" /etc/

# Mostrar el número de línea
grep -n "config" settings.conf

# Ignorar mayúsculas/minúsculas
grep -i "Warning" archivo.log

# Mostrar solo el nombre del archivo donde se encuentra
grep -l "root" /etc/*
```

> Tip: Usa `grep -rni "palabra" .` para buscar en todo el directorio actual con número de línea y sin distinguir mayúsculas/minúsculas.

---

## 3. Buscar archivos rápidamente

### `locate`

Usa una base de datos indexada (más rápido que `find`).

``` bash
# Buscar archivos por nombre
locate archivo.txt

# Buscar archivos que contengan una palabra
locate config

# Actualizar la base de datos de locate
sudo updatedb
```

---

## 4. Buscar comandos o ejecutables

### `which`, `whereis`, `type`

Sirven para ubicar programas instalados o saber cómo se ejecutan.

``` bash
# Ver ruta del ejecutable de un comando
which python3

# Mostrar archivos binarios, man pages, etc.
whereis bash

# Mostrar tipo de comando
type ls
```

---

## 5. Buscar en el historial o procesos

### Buscar en historial

``` bash
# Buscar un comando usado anteriormente
history | grep "ssh"
```

### Buscar procesos en ejecución

``` bash
ps aux | grep firefox
```

---

## 6. Buscar dentro de archivos comprimidos o binarios

``` bash
# Buscar dentro de un .tar.gz
tar -tzf archivo.tar.gz | grep "config"

# Buscar dentro de un binario (si tiene texto legible)
strings archivo.bin | grep "password"
```

---

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

> **Autor**: Fravelz
