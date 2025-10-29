# Wc en Linux

---

## Temario

- [Wc en Linux](#wc-en-linux)
  - [Temario](#temario)
  - [wc — word count (resumen rápido)](#wc--word-count-resumen-rápido)
    - [Sintaxis básica](#sintaxis-básica)
    - [Opciones útiles](#opciones-útiles)
    - [Ejemplos](#ejemplos)
    - [Notas importantes](#notas-importantes)

[Regresar a la Guía Principal](./../../readme.md#5-python)

---

## wc — word count (resumen rápido)

`wc` es una utilidad de Unix/Linux que **cuenta** cosas en archivos o en la entrada estándar: **líneas, palabras, bytes o caracteres**, y también la longitud de la línea más larga.

### Sintaxis básica

``` bash
wc [opciones] [archivo...]
```

Si no le pasas archivo lee desde la entrada estándar (útil con pipes).

### Opciones útiles

- `-l` → cuenta **líneas**.
- `-w` → cuenta **palabras**.
- `-c` → cuenta **bytes**.
- `-m` → cuenta **caracteres** (útil si hay multi-byte/UTF-8).
- `-L` → muestra la longitud de la **línea más larga**.

### Ejemplos

``` bash
wc archivo.txt
# salida:   10  45  320 archivo.txt
# significa: 10 líneas, 45 palabras, 320 bytes

wc -l archivo.txt
# muestra sólo el número de líneas

cat archivo.txt | wc -w
# cuenta las palabras de la salida del cat (ej. en un pipe)

grep -R "TODO" src/ | wc -l
# cuenta cuántas líneas contienen "TODO" en todo el árbol src/
```

### Notas importantes

- `-c` cuenta **bytes**, no caracteres — en archivos UTF-8 algunos caracteres ocupan varios bytes. Usa `-m` para contar caracteres visibles.

- Si pasas varios archivos, `wc` muestra conteos por archivo y un `total` final.

- `wc -l` se usa mucho para contar líneas/entradas (por ejemplo, cantidad de archivos listados por `ls`, coincidencias de `grep`, etc.).

--

[Regresar a la Guía Principal](./../../readme.md#5-python)

> **Autor:** Fravelz
