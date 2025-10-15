# Entradas y Salidas en Bash Script

Este documento explica como usar la **redirección de contenido en bash script** de (entradas y salidas y errores en bash).

---

## Temario

- [Entradas y Salidas en Bash Script](#entradas-y-salidas-en-bash-script)
  - [Temario](#temario)
  - [Descriptores de archivos](#descriptores-de-archivos)
    - [1 Entrada: redirigir desde un archivo `<`](#1-entrada-redirigir-desde-un-archivo-)
    - [2 Salida: redirigir la salida normal `>` y `>>`](#2-salida-redirigir-la-salida-normal--y-)
    - [3 Errores: redirigir errores `2>`](#3-errores-redirigir-errores-2)
  - [Juntar salida y errores](#juntar-salida-y-errores)
  - [Pipes (`|`)](#pipes-)
  - [Redirección combinada `&>`](#redirección-combinada-)
  - [Comando `cat` (concatenate)](#comando-cat-concatenate)
  - [Comando `tee`](#comando-tee)
    - [Resumen rápido](#resumen-rápido)

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

---

## Descriptores de archivos

En Bash hay **3 descriptores de archivos principales**:

| Descriptor | Nombre           | Descripción                                           |
| ---------- | ---------------- | ----------------------------------------------------- |
| **0**      | Entrada estándar | Lo que le das a un programa (normalmente el teclado). |
| **1**      | Salida estándar  | Lo que muestra el programa.                           |
| **2**      | Error estándar   | Mensajes de error.                                    |

Los descriptores **3, 4, 5, ...** son opcionales y se usan en programas más avanzados. Para referirse a un descriptor se usa su número (por ejemplo `2> archivo`). Para el descriptor **1**, el número puede omitirse (`>` equivale a `1>`).

### 1 Entrada: redirigir desde un archivo `<`

``` bash
cat < ./4.estControl.sh
````

### 2 Salida: redirigir la salida normal `>` y `>>`

``` bash
echo "hola," > ./salida.txt    # Sobrescribe el archivo
echo "mundo!" >> ./salida.txt  # Agrega al final
```

### 3 Errores: redirigir errores `2>`

``` bash
ls noExiste 2> errores.txt
```

---

## Juntar salida y errores

``` bash
comando > todo.txt 2>&1
```

Esto significa:

- El descriptor **1 (salida estándar)** se envía al archivo `todo.txt`.

- El descriptor **2 (errores)** se redirige hacia donde va la salida estándar (`&1`).

En resumen:

> “Manda los errores al mismo lugar donde está yendo la salida normal”.

| Símbolo | Significado                           |
| ------- | ------------------------------------- |
| `&0`    | Hacia donde vaya la entrada estándar  |
| `&1`    | Hacia donde vaya la salida estándar   |
| `&2`    | Hacia donde vaya la salida de errores |

---

## Pipes (`|`)

``` bash
ls | grep .txt
```

Envía la salida de `ls` al comando `grep`, que muestra solo los archivos `.txt`.

---

## Redirección combinada `&>`

``` bash
ls carpeta_inexistente &> salida.txt
```

Equivale a:

``` bash
ls carpeta_inexistente > salida.txt 2>&1
```

---

## Comando `cat` (concatenate)

``` bash
cat ./1.comandosBash/5.EntradaYSalida.sh    # Mostrar un archivo
cat a.txt b.txt > c.txt                     # Unir archivos
cat a.txt >> b.txt                          # Añadir uno al final del otro
```

También puedes crear un archivo nuevo escribiendo directamente:

``` bash
cat > nuevo.txt
Hola
Mundo
# (Presiona CTRL+D para terminar)
```

---

## Comando `tee`

El comando `tee` **guarda la salida en archivos y también la muestra en pantalla**.

``` bash
echo "Hola mundo" | tee salida.txt          # Guardar y mostrar
ls | tee -a lista.txt                       # Modo append
ls | tee archivo1.txt archivo2.txt          # Guardar en varios archivos
```

---

### Resumen rápido

| Operador.| Descripción                         |
| -------- | ----------------------------------- |
| `<`      | Leer desde archivo                  |
| `>`      | Escribir (sobrescribir)             |
| `>>`     | Escribir (agregar al final)         |
| `2>`     | Redirigir errores                   |
| `2>&1`   | Unir errores con salida normal      |
| `&>`     | Redirigir ambos (salida y errores)  |
| `        | Pipe (enviar salida a otro comando) |

---

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

> **Autor:** Fravelz
