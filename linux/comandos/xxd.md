# Xxd en Linux

---

## Temario

- [Xxd en Linux](#xxd-en-linux)
  - [Temario](#temario)
  - [Que es el comando xxd](#que-es-el-comando-xxd)
  - [Sintaxis básica](#sintaxis-básica)
  - [Ejemplos comunes](#ejemplos-comunes)
    - [1. Ver un archivo en formato hexadecimal](#1-ver-un-archivo-en-formato-hexadecimal)
    - [2. Convertir de binario a texto hexadecimal](#2-convertir-de-binario-a-texto-hexadecimal)
    - [3. Convertir de texto hexadecimal a binario](#3-convertir-de-texto-hexadecimal-a-binario)
    - [4. Mostrar solo los bytes (sin dirección ni texto ASCII)](#4-mostrar-solo-los-bytes-sin-dirección-ni-texto-ascii)
    - [5. Ver solo los primeros bytes](#5-ver-solo-los-primeros-bytes)
  - [En resumen](#en-resumen)

[Regresar a la Guía Principal](./../../readme.md#5-python)

---

## Que es el comando xxd

El comando `xxd` en Linux (y otros sistemas Unix) **convierte datos binarios en una representación hexadecimal** y también puede hacer lo contrario (convertir de hexadecimal a binario).
Es muy útil para inspeccionar o editar archivos binarios, ver bytes en formato legible o reconstruir archivos desde texto hexadecimal.

---

## Sintaxis básica

``` bash
xxd [opciones] [archivo]
```

---

## Ejemplos comunes

### 1. Ver un archivo en formato hexadecimal

``` bash
xxd archivo.bin
```

➡️ Muestra el contenido de `archivo.bin` así:

``` bash
00000000: 486f 6c61 206d 756e 646f          Hola mundo
```

- La primera columna (`00000000`) es el desplazamiento (offset) en hexadecimal.

- Luego vienen los bytes en formato hex.

- A la derecha aparece la interpretación ASCII (si los bytes son imprimibles).

---

### 2. Convertir de binario a texto hexadecimal

``` bash
cat archivo | xxd
```

➡️ Convierte los bytes de la entrada estándar en texto hexadecimal.

---

### 3. Convertir de texto hexadecimal a binario

``` bash
cat archivo_hex.txt | xxd -r > archivo_original
```

- `-r` significa **reverse** (revertir).
- Esto toma una representación en hex (por ejemplo, hecha por `xxd`) y reconstruye el archivo binario original.

---

### 4. Mostrar solo los bytes (sin dirección ni texto ASCII)

``` bash
xxd -p archivo.bin
```

Salida “plana” (plain):

``` txt
486f6c61206d756e646f
```

Perfecta para copiar y pegar en scripts o codificaciones.

---

### 5. Ver solo los primeros bytes

``` bash
xxd -l 16 archivo.bin
```

➡️ Muestra solo los primeros 16 bytes.

---

## En resumen

| Modo              | Comando              | Descripción                |
| ----------------- | -------------------- | -------------------------- |
| Hex dump          | `xxd archivo`        | Ver bytes en hex y ASCII   |
| Hex plano         | `xxd -p archivo`     | Solo bytes hex sin formato |
| Binario desde hex | `xxd -r archivo_hex` | Reconstruir archivo        |
| Limitar bytes     | `xxd -l N archivo`   | Muestra solo N bytes       |

---

[Regresar a la Guía Principal](./../../readme.md#5-python)

> **Autor:** Fravelz
