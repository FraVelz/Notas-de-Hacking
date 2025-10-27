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

## 1. ¿Qué es Python?

**Python** es un lenguaje de programación:

- **Interpretado** (no necesitas compilar).
- **De alto nivel** (fácil de leer).
- **Multiparadigma** (permite programación estructurada, orientada a objetos y funcional).
- **De propósito general** (sirve para web, IA, hacking, data science, automatización, etc.).

Ejemplo básico:

``` python
print("Hola, mundo!")
```

---

## 2. Sintaxis básica

### Variables y tipos de datos

``` python
nombre = "Francisco"
edad = 17
altura = 1.75
es_estudiante = True
```

Tipos básicos:

- `int`: números enteros
- `float`: decimales
- `str`: texto
- `bool`: verdadero/falso

### Operadores

``` python
a = 5
b = 2
print(a + b)  # Suma
print(a ** b) # Potencia
print(a // b) # División entera
```

---

## 3. Control de flujo

### Condicionales

``` python
if edad >= 18:
    print("Eres adulto")
elif edad >= 13:
    print("Eres adolescente")
else:
    print("Eres niño")
```

### Bucles

``` python
for i in range(5):
    print(i)  # Imprime 0 a 4

while edad < 18:
    edad += 1
```

---

## 4. Estructuras de datos

### Listas

``` python
nombres = ["Ana", "Luis", "Carlos"]
nombres.append("Sofía")
print(nombres[0])  # "Ana"
```

### Tuplas

``` python
coordenadas = (10, 20)
```

### Conjuntos

``` python
numeros = {1, 2, 3, 3}
print(numeros)  # {1, 2, 3} (no repite)
```

### Diccionarios

``` python
persona = {"nombre": "Francisco", "edad": 17}
print(persona["nombre"])
```

---

## 5. Funciones

``` python
def saludar(nombre):
    return f"Hola, {nombre}"

print(saludar("Francisco"))
```

---

## 6. Programación orientada a objetos (POO)

``` python
class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad
    
    def saludar(self):
        print(f"Hola, soy {self.nombre}")

p1 = Persona("Francisco", 17)
p1.saludar()
```

---

## 7. Módulos y paquetes

``` python
import math
print(math.sqrt(16))  # 4.0
```

También puedes crear tus propios módulos (`mimodulo.py`) y luego:

``` python
import mimodulo
```

---

## 8. Archivos

``` python
with open("datos.txt", "w") as archivo:
    archivo.write("Hola mundo")

with open("datos.txt", "r") as archivo:
    print(archivo.read())
```

---

## 9. Librerías populares (por áreas)

| Área                         | Librerías                                                |
| ---------------------------- | -------------------------------------------------------- |
| **IA / Machine Learning**    | `numpy`, `pandas`, `scikit-learn`, `tensorflow`, `torch` |
| **Hacking / Ciberseguridad** | `scapy`, `socket`, `requests`, `paramiko`                |
| **Desarrollo web**           | `flask`, `django`, `fastapi`                             |
| **Automatización**           | `os`, `shutil`, `subprocess`, `pyautogui`, `selenium`    |
| **Ciencia de datos**         | `matplotlib`, `seaborn`, `pandas`                        |
| **Videojuegos**              | `pygame`                                                 |
| **Bots / APIs**              | `discord.py`, `telebot`, `requests`                      |

---

## 10. Conceptos avanzados

- **List comprehensions:**

  ``` python
  cuadrados = [x**2 for x in range(5)]
  ```
  
- **Funciones lambda:**

  ``` python
  doble = lambda x: x*2
  ```

- **Decoradores**
- **Generadores (`yield`)**
- **Manejo de errores (`try/except`)**
- **Multithreading y multiprocessing**
- **Expresiones regulares (`re`)**

---

## 11. Herramientas y entorno

- **Ejecutar:** `python archivo.py`
- **Gestor de paquetes:** `pip install nombre_paquete`
- **Entornos virtuales:**

  ``` bash
  python -m venv entorno
  source entorno/bin/activate  # Linux
  entorno\Scripts\activate     # Windows
  ```

---

[Regresar a la Guía Principal](./../readme.md#5-python)

> **Autor:** Fravelz
