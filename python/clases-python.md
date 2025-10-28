# Clases en Python

---

## Temario

- [Clases en Python](#clases-en-python)
  - [Temario](#temario)
  - [¿Qué es una clase en Python?](#qué-es-una-clase-en-python)
  - [Sintaxis básica](#sintaxis-básica)
    - [Explicación](#explicación)
  - [Atributos](#atributos)
    - [1. De instancia](#1-de-instancia)
    - [2. De clase](#2-de-clase)
  - [Métodos](#métodos)
    - [Método de instancia](#método-de-instancia)
    - [Método de clase](#método-de-clase)
    - [Método estático](#método-estático)
  - [Herencia](#herencia)
  - [Polimorfismo](#polimorfismo)
  - [Encapsulación](#encapsulación)
  - [Propiedades (@property)](#propiedades-property)
  - [Composición](#composición)
  - [Ejemplo completo](#ejemplo-completo)
  - [Resumen rápido](#resumen-rápido)

[Regresar a la Guía Principal](./../readme.md#5-python)

---

## ¿Qué es una clase en Python?

Una **clase** es una **plantilla o molde** para crear **objetos** (instancias) que agrupan **datos (atributos)** y **funciones (métodos)** relacionados.

Los **objetos** son las copias o instancias creadas a partir de esa clase.

---

## Sintaxis básica

``` python
class Persona:
    def __init__(self, nombre, edad):  # Constructor
        self.nombre = nombre           # Atributos
        self.edad = edad

    def saludar(self):                 # Método
        print(f"Hola, soy {self.nombre} y tengo {self.edad} años")

# Crear objeto
p1 = Persona("Francisco", 17)
p1.saludar()
```

### Explicación

- `class Persona:` → define la clase.
- `__init__` → **constructor**, se ejecuta al crear el objeto.
- `self` → referencia al **objeto actual** (similar a `this` en otros lenguajes).
- `p1` → **instancia** de la clase `Persona`.

---

## Atributos

### 1. De instancia

Son únicos para cada objeto:

``` python
class Coche:
    def __init__(self, marca):
        self.marca = marca
```

### 2. De clase

Son **compartidos por todas las instancias**:

``` python
class Coche:
    ruedas = 4  # atributo de clase
    def __init__(self, marca):
        self.marca = marca
```

``` python
a = Coche("Toyota")
b = Coche("Honda")
print(a.ruedas, b.ruedas)  # ambos tienen 4
```

---

## Métodos

### Método de instancia

Opera sobre el objeto (`self`).

``` python
def mostrar(self):
    print(self.nombre)
```

### Método de clase

Opera sobre la clase, no sobre un objeto.

``` python
@classmethod
def crear_desde_edad(cls, edad):
    return cls("Desconocido", edad)
```

### Método estático

No usa `self` ni `cls`. Funciona como una función normal dentro de la clase.

``` python
@staticmethod
def es_mayor(edad):
    return edad >= 18
```

---

## Herencia

Permite crear una clase nueva basada en otra (reutiliza código).

``` python
class Animal:
    def hablar(self):
        print("El animal hace un sonido")

class Perro(Animal):  # Hereda de Animal
    def hablar(self):
        print("Guau")

p = Perro()
p.hablar()
```

✔️ La clase hija **sobrescribe** métodos de la clase padre.
✔️ Se puede usar `super()` para llamar métodos del padre.

---

## Polimorfismo

Diferentes clases pueden usar el mismo método con comportamientos distintos:

``` python
class Gato:
    def hablar(self): print("Miau")

class Perro:
    def hablar(self): print("Guau")

for animal in [Gato(), Perro()]:
    animal.hablar()
```

---

## Encapsulación

Controla la visibilidad de los atributos/métodos.

| Tipo      | Ejemplo       | Acceso                  |
| --------- | ------------- | ----------------------- |
| Público   | `self.nombre` | libre                   |
| Protegido | `_nombre`     | interno/subclases       |
| Privado   | `__nombre`    | solo dentro de la clase |

``` python
class Persona:
    def __init__(self, nombre):
        self.__nombre = nombre  # privado

    def mostrar(self):
        print(self.__nombre)
```

---

## Propiedades (@property)

Permiten acceder a métodos como si fueran atributos.

``` python
class Rectangulo:
    def __init__(self, base, altura):
        self.base = base
        self.altura = altura

    @property
    def area(self):
        return self.base * self.altura

r = Rectangulo(4, 5)
print(r.area)  # No se usa paréntesis
```

---

## Composición

Una clase contiene objetos de otras clases:

``` python
class Motor:
    def arrancar(self):
        print("Motor encendido")

class Coche:
    def __init__(self):
        self.motor = Motor()

c = Coche()
c.motor.arrancar()
```

---

## Ejemplo completo

``` python
class CuentaBancaria:
    tasa_interes = 0.05  # atributo de clase

    def __init__(self, titular, saldo=0):
        self.titular = titular
        self.__saldo = saldo  # privado

    def depositar(self, cantidad):
        self.__saldo += cantidad

    def retirar(self, cantidad):
        if cantidad <= self.__saldo:
            self.__saldo -= cantidad
        else:
            print("Fondos insuficientes")

    @property
    def saldo(self):
        return self.__saldo

# Uso
cuenta = CuentaBancaria("Francisco", 1000)
cuenta.depositar(500)
cuenta.retirar(200)
print(cuenta.saldo)
```

---

## Resumen rápido

| Concepto                        | Descripción                              |
| ------------------------------- | ---------------------------------------- |
| `class`                         | Define una clase                         |
| `__init__`                      | Constructor                              |
| `self`                          | Referencia al objeto actual              |
| Atributos                       | Datos de objeto o clase                  |
| Métodos                         | Funciones dentro de la clase             |
| `@classmethod`, `@staticmethod` | Métodos especiales                       |
| Herencia                        | Reutilización de código                  |
| Encapsulación                   | Control de acceso                        |
| Polimorfismo                    | Mismo método, distinto comportamiento    |
| `@property`                     | Acceso elegante a métodos como atributos |

---

[Regresar a la Guía Principal](./../readme.md#5-python)

> **Autor:** Fravelz
