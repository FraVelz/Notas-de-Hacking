# Python

---

## Temario

- [Python](#python)
  - [Temario](#temario)
  - [1. ¿Qué es Python?](#1-qué-es-python)
  - [2. Sintaxis básica](#2-sintaxis-básica)
    - [Variables y tipos de datos](#variables-y-tipos-de-datos)
    - [Operadores](#operadores)
  - [3. Control de flujo](#3-control-de-flujo)
    - [Condicionales](#condicionales)
    - [Bucles](#bucles)
  - [4. Estructuras de datos](#4-estructuras-de-datos)
    - [Listas](#listas)
    - [Tuplas](#tuplas)
    - [Conjuntos](#conjuntos)
    - [Diccionarios](#diccionarios)
  - [5. Funciones](#5-funciones)
  - [6. Programación orientada a objetos (POO)](#6-programación-orientada-a-objetos-poo)
  - [7. Módulos y paquetes](#7-módulos-y-paquetes)
  - [8. Archivos](#8-archivos)
  - [9. Librerías populares (por áreas)](#9-librerías-populares-por-áreas)
  - [10. Conceptos avanzados](#10-conceptos-avanzados)
  - [11. Herramientas y entorno](#11-herramientas-y-entorno)

[Regresar a la Guía Principal](./../readme.md#5-python)

---
Perfecto — aquí tienes **TODO** sobre el módulo **`sys`** en Python: qué es, las funciones/atributos más útiles, ejemplos prácticos y buenas prácticas. Lo dejo organizado para que puedas usarlo como referencia rápida o guía de estudio. 🚀

# ¿Qué es `sys`?

`sys` es un módulo integrado que ofrece **interfaz con el intérprete de Python** y el entorno donde corre (argumentos de línea de comandos, rutas, streams estándar, información de la plataforma, manejo de errores, configuración del intérprete, etc.).
Se importa con:

```python
import sys
```

# Uso básico y más común

### `sys.argv`

Lista de argumentos pasados al script (el elemento 0 es el nombre del script).

```python
# ejemplo.py
import sys
print(sys.argv)
# Ejecuta: python ejemplo.py a b -> ['ejemplo.py', 'a', 'b']
```

### `sys.exit([code|message])`

Termina el intérprete lanzando `SystemExit`. `code=0` indica éxito; cualquier int distinto a 0 indica error. También puedes pasar un string (se imprime).

```python
if len(sys.argv) < 2:
    sys.exit("falta argumento")
```

### `sys.path`

Lista de rutas donde Python busca módulos. Puedes modificarla en tiempo de ejecución (útil para scripts).

```python
import sys
sys.path.append("/mi/carpeta/lib")
```

### `sys.modules`

Diccionario de módulos cargados en memoria (`name -> module`). Útil para inspección o recarga.

```python
import importlib
import mi_modulo
importlib.reload(sys.modules['mi_modulo'])
```

### `sys.stdout`, `sys.stderr`, `sys.stdin`

Streams estándar. Permiten redirigir o manipular entrada/salida.

```python
sys.stdout.write("hola\n")
sys.stderr.write("error!\n")
data = sys.stdin.read()
```

También puedes usar `sys.stdout.buffer` para I/O binaria.

### `sys.version` y `sys.version_info`

Información de la versión de Python.

```python
print(sys.version)          # string completa
print(sys.version_info)     # tupla nombrada (major, minor, micro, ...)
if sys.version_info < (3,10):
    print("actualiza python")
```

### `sys.platform`

Cadena que indica la plataforma (e.g., `'linux'`, `'darwin'`, `'win32'`).

```python
if sys.platform.startswith("win"):
    print("Windows")
```

### `sys.maxsize`

Entero que normalmente indica el tamaño máximo práctico de estructuras (32/64-bit).

```python
print(sys.maxsize)
```

### `sys.getsizeof(obj[, default])`

Devuelve el tamaño en bytes del objeto (solo tamaño del objeto, no profundidad).

```python
x = [1,2,3]
print(sys.getsizeof(x))  # tamaño del objeto lista en memoria (superficial)
```

### `sys.getrecursionlimit()` / `sys.setrecursionlimit(n)`

Leer y ajustar el límite de recursión del intérprete.

```python
print(sys.getrecursionlimit())
sys.setrecursionlimit(2000)
```

Usar con cuidado: un límite demasiado alto puede provocar segfault.

### `sys.exc_info()`

Información sobre la excepción actual: `(exc_type, exc_value, traceback)`.

```python
try:
    1/0
except:
    print(sys.exc_info())
```

### `sys.excepthook`

Función que maneja excepciones no capturadas. Puedes reemplazarla para logging personalizado.

```python
def mi_handler(exc_type, exc, tb):
    print("Excepción no manejada:", exc_type, exc)
sys.excepthook = mi_handler
```

### `sys.getdefaultencoding()` y `sys.getfilesystemencoding()`

Codificaciones por defecto (útil para I/O y compatibilidad entre plataformas).

```python
print(sys.getdefaultencoding(), sys.getfilesystemencoding())
```

### `sys.byteorder`

Orden de bytes de la máquina: `'little'` o `'big'`.

```python
print(sys.byteorder)
```

### `sys.implementation`

Información sobre la implementación de Python (CPython, PyPy, etc.)

```python
print(sys.implementation)
```

### `sys.flags`

Namespace con banderas con las que arrancó el intérprete (`optimize`, `debug`, `interactive`, etc.).

```python
print(sys.flags)
```

### `sys.getwindowsversion()` (solo Windows)

Disponible solo en Windows; usar `hasattr(sys, "getwindowsversion")` para comprobar.

### `sys.getswitchinterval()` / `sys.setswitchinterval()`

Controla la frecuencia de cambio de contexto entre threads (CPython).

# Ejemplos prácticos

### 1) Script que procesa CLI simple

```python
# procesador.py
import sys

def main():
    if len(sys.argv) < 2:
        print("uso: python procesador.py archivo.txt")
        sys.exit(1)
    nombre = sys.argv[1]
    with open(nombre, "r", encoding="utf-8") as f:
        print(f.read())

if __name__ == "__main__":
    main()
```

### 2) Redirigir salida a un archivo

```python
import sys
with open("salida.log", "w", encoding="utf-8") as log:
    old_stdout = sys.stdout
    sys.stdout = log
    print("esto va al archivo")
    sys.stdout = old_stdout
```

### 3) Manejo global de excepciones (logging)

```python
import sys, traceback, logging
logging.basicConfig(filename="errores.log", level=logging.ERROR)

def mi_excepthook(exc_type, exc_value, exc_tb):
    logging.error("".join(traceback.format_exception(exc_type, exc_value, exc_tb)))

sys.excepthook = mi_excepthook
# cualquier excepción no capturada irá a errores.log
```

### 4) Comprobar versión de Python antes de correr

```python
import sys
if sys.version_info < (3,8):
    sys.exit("Este script requiere Python 3.8+")
```

# Buenas prácticas y advertencias

* **No abuses de `sys.path.append()`** en producción; usa paquetes instalables o `PYTHONPATH`/virtualenvs.
* `sys.getsizeof()` da tamaño superficial; para medir memoria profunda usa `pympler` o `tracemalloc`.
* Cambiar el límite de recursión con `setrecursionlimit()` solo si entiendes el riesgo.
* `sys.exit()` en bibliotecas es mala idea: las bibliotecas deben lanzar excepciones, no terminar el proceso.
* Evita escribir directamente a `sys.stdout` si usas frameworks que gestionan I/O (mejor usar logging).

# Debugging y profiling

* `sys.setrecursionlimit()` para debugging de recursión (con cuidado).
* Para profiling de memoria/ejecución usa módulos especializados (`tracemalloc`, `profile`, `cProfile`), no `sys` directamente.

# Mini-proyectos / ejercicios sugeridos

1. Script CLI con `argparse` que use `sys.argv` como fallback y registre errores en `sys.stderr`.
2. Programa que redirija `sys.stdout` a un archivo y luego restaure la salida normal.
3. Wrapper que compruebe `sys.version_info` y ejecute un comportamiento alterno para versiones antiguas.
4. Logger global usando `sys.excepthook` para capturar excepciones no manejadas.
5. Herramienta que inspeccione `sys.modules` para listar módulos cargados y su ruta (`module.__file__`).

---

Si quieres, te preparo **una hoja de referencia en un solo archivo `.py`** con ejemplos listos para ejecutar (con comentarios) o **3 ejercicios resueltos paso a paso** usando `sys` (por ejemplo: CLI + logging + manejo de excepciones). ¿Cuál prefieres?

---

[Regresar a la Guía Principal](./../readme.md#5-python)

> **Autor:** Fravelz

