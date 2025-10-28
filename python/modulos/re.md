# Re en Python (expreciones regulares)

---

## Temario

- [Re en Python (expreciones regulares)](#re-en-python-expreciones-regulares)
  - [Temario](#temario)
  - [¿Qué es re?](#qué-es-re)
  - [FUNCIONES PRINCIPALES](#funciones-principales)
    - [1. re.match(patrón, texto)](#1-rematchpatrón-texto)
    - [2. re.search(patrón, texto)](#2-researchpatrón-texto)
    - [3. re.findall(patrón, texto)](#3-refindallpatrón-texto)
    - [4. re.finditer(patrón, texto)](#4-refinditerpatrón-texto)
    - [5. re.sub(patrón, reemplazo, texto, count=0)](#5-resubpatrón-reemplazo-texto-count0)
    - [6. re.split(patrón, texto, maxsplit=0)](#6-resplitpatrón-texto-maxsplit0)
    - [7. re.compile(patrón, flags=0)](#7-recompilepatrón-flags0)
  - [OBJETOS Match](#objetos-match)
  - [METACARACTERES MÁS IMPORTANTES](#metacaracteres-más-importantes)
  - [SECUENCIAS ESPECIALES](#secuencias-especiales)
  - [FLAGS COMUNES](#flags-comunes)
  - [EJEMPLOS PRÁCTICOS](#ejemplos-prácticos)
    - [1. Validar un correo electrónico](#1-validar-un-correo-electrónico)
    - [2. Extraer números de un texto](#2-extraer-números-de-un-texto)
    - [3. Reemplazar palabras](#3-reemplazar-palabras)
    - [4. Separar texto por comas o espacios](#4-separar-texto-por-comas-o-espacios)
  - [Buenas prácticas](#buenas-prácticas)
  - [Ejercicio rápido](#ejercicio-rápido)

[Regresar a la Guía Principal](./../../readme.md#5-python)

---

## ¿Qué es re?

El módulo **`re`** (de *regular expressions*, expresiones regulares) permite **buscar, reemplazar y analizar texto mediante patrones**.

Se importa con:

``` python
import re
```

---

## FUNCIONES PRINCIPALES

### 1. re.match(patrón, texto)

Busca **solo al inicio del texto**.

``` python
import re
m = re.match(r"Hola", "Hola mundo")
print(m.group())  # Hola
```

---

### 2. re.search(patrón, texto)

Busca **en cualquier parte** del texto (la primera coincidencia).

``` python
re.search(r"mundo", "Hola mundo").group()  # mundo
```

---

### 3. re.findall(patrón, texto)

Devuelve **todas las coincidencias** en una lista.

``` python
re.findall(r"\d+", "Edad 17 años, código 2025")  # ['17', '2025']
```

---

### 4. re.finditer(patrón, texto)

Devuelve un **iterador** con objetos `Match` (útil para posiciones).

``` python
for m in re.finditer(r"\d+", "x=5 y=10 z=20"):
    print(m.group(), m.start(), m.end())
```

---

### 5. re.sub(patrón, reemplazo, texto, count=0)

**Reemplaza** coincidencias por otro texto.

``` python
re.sub(r"\d+", "X", "Tengo 2 perros y 3 gatos")  # 'Tengo X perros y X gatos'
```

---

### 6. re.split(patrón, texto, maxsplit=0)

**Divide el texto** usando el patrón como separador.

``` python
re.split(r"\s+", "uno   dos tres")  # ['uno', 'dos', 'tres']
```

---

### 7. re.compile(patrón, flags=0)

Compila el patrón para reutilizarlo muchas veces (más eficiente).

``` python
patron = re.compile(r"\d+")
print(patron.findall("a1b22c333"))  # ['1', '22', '333']
```

---

## OBJETOS Match

Cuando haces `match()` o `search()`, obtienes un objeto con información útil:

``` python
m = re.search(r"(\d+)", "Edad: 25 años")
print(m.group())    # '25'
print(m.start())    # 6
print(m.end())      # 8
print(m.span())     # (6, 8)
```

Si hay **grupos** (entre paréntesis):

``` python
m = re.search(r"(\d+)\s*(años)", "Edad: 25 años")
print(m.groups())   # ('25', 'años')
print(m.group(1))   # '25'
print(m.group(2))   # 'años'
```

---

## METACARACTERES MÁS IMPORTANTES

| Símbolo | Significado                     | Ejemplo                       |
| ------- | ------------------------------- | ----------------------------- |
| `.`     | Cualquier carácter excepto `\n` | `a.b` → "acb", "arb"          |
| `^`     | Inicio de línea                 | `^Hola`                       |
| `$`     | Fin de línea                    | `mundo$`                      |
| `*`     | 0 o más repeticiones            | `a*` → "", "aaa"              |
| `+`     | 1 o más repeticiones            | `a+` → "a", "aaa"             |
| `?`     | 0 o 1 repetición                | `colou?r` → "color", "colour" |
| `{n}`   | Exactamente n repeticiones      | `\d{4}` → "2025"              |
| `{n,}`  | n o más                         | `\d{2,}`                      |
| `{n,m}` | entre n y m                     | `\d{2,4}`                     |
| `[]`    | Conjunto de caracteres          | `[aeiou]`, `[0-9]`            |
| `       | `                               | Alternativa (OR) `gato|perro` |
| `()`    | Grupo de captura                | `(abc)+`                      |
| `\`     | Escape o secuencia especial     | `\d`, `\s`, `\w`              |

---

## SECUENCIAS ESPECIALES

| Secuencia | Significado                  | Ejemplo       |
| --------- | ---------------------------- | ------------- |
| `\d`      | Dígito `[0-9]`               | `\d+` → "123" |
| `\D`      | No dígito                    | `\D+` → "abc" |
| `\s`      | Espacio, tab, salto de línea | `\s+`         |
| `\S`      | No espacio                   | `\S+`         |
| `\w`      | Alfanumérico `[A-Za-z0-9_]`  | `\w+`         |
| `\W`      | No alfanumérico              | `\W+`         |
| `\b`      | Límite de palabra            | `\bpalabra\b` |
| `\B`      | No límite de palabra         | `\Bpalabra\B` |

---

## FLAGS COMUNES

| Flag                     | Descripción                              |
| ------------------------ | ---------------------------------------- |
| `re.IGNORECASE` o `re.I` | Ignora mayúsculas/minúsculas             |
| `re.MULTILINE` o `re.M`  | `^` y `$` funcionan por línea            |
| `re.DOTALL` o `re.S`     | `.` incluye saltos de línea              |
| `re.VERBOSE` o `re.X`    | Permite comentar y dar formato al patrón |

Ejemplo:

``` python
patron = re.compile(r"""
    ^\d{4}     # 4 dígitos al inicio
    -\d{2}     # guion y 2 dígitos
    -\d{2}$    # guion y 2 dígitos al final
""", re.VERBOSE)
print(bool(patron.match("2025-10-27")))  # True
```

---

## EJEMPLOS PRÁCTICOS

### 1. Validar un correo electrónico

``` python
import re
patron = r"^[\w\.-]+@[\w\.-]+\.\w+$"
print(bool(re.match(patron, "usuario@mail.com")))  # True
```

---

### 2. Extraer números de un texto

``` python
re.findall(r"\d+", "ID123, edad 45, año 2025")  # ['123', '45', '2025']
```

---

### 3. Reemplazar palabras

``` python
texto = "Hola mundo cruel"
nuevo = re.sub(r"cruel", "hermoso", texto)
print(nuevo)  # Hola mundo hermoso
```

---

### 4. Separar texto por comas o espacios

``` python
re.split(r"[, ]+", "rojo, verde azul,amarillo")  # ['rojo', 'verde', 'azul', 'amarillo']
```

---

## Buenas prácticas

✅ Usa `r"..."` (raw strings) para no tener que escapar `\`.
✅ Compila patrones que usarás muchas veces con `re.compile()`.
✅ Usa `re.fullmatch()` si necesitas que toda la cadena coincida.
✅ Usa `?` después de `*` o `+` para **modo no codicioso** (lazy).

``` python
re.findall(r"<.*?>", "<a><b>")  # ['<a>', '<b>']
```

---

## Ejercicio rápido

Extrae todos los nombres de usuario de correos:

``` python
import re
texto = "Correos: ana@mail.com, juan123@dominio.org"
print(re.findall(r"(\w+)@", texto))  # ['ana', 'juan123']
```

---

[Regresar a la Guía Principal](./../../readme.md#5-python)

> **Autor:** Fravelz
