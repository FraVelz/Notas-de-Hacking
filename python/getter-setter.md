# Getters y Setters

---

## Temario

- [Getters y Setters](#getters-y-setters)
  - [Temario](#temario)
  - [¿Qué son los getters y setters?](#qué-son-los-getters-y-setters)
  - [Ejemplo básico](#ejemplo-básico)
  - [Pero Python tiene una forma más elegante → **`@property`**](#pero-python-tiene-una-forma-más-elegante--property)
    - [Ejemplo con `@property`](#ejemplo-con-property)
  - [Ventajas de usar @property](#ventajas-de-usar-property)
  - [En resumen](#en-resumen)

[Regresar a la Guía Principal](./../readme.md#5-python)

---

## ¿Qué son los getters y setters?

- **Getter:** método que **obtiene** (lee) el valor de un atributo.

- **Setter:** método que **establece** (modifica) el valor de un atributo.

Se usan para **controlar el acceso a los atributos** de una clase, especialmente cuando son “protegidos” o “privados”.

---

## Ejemplo básico

``` python
class Persona:
    def __init__(self, nombre):
        self.__nombre = nombre  # atributo privado

    # Getter
    def get_nombre(self):
        return self.__nombre

    # Setter
    def set_nombre(self, nuevo_nombre):
        if len(nuevo_nombre) > 0:
            self.__nombre = nuevo_nombre
        else:
            print("❌ El nombre no puede estar vacío.")
```

Uso:

``` python
p = Persona("Ana")
print(p.get_nombre())  # ✅ Ana

p.set_nombre("Luis")
print(p.get_nombre())  # ✅ Luis

p.set_nombre("")  # ❌ El nombre no puede estar vacío.
```

---

## Pero Python tiene una forma más elegante → **`@property`**

Python permite crear *getters* y *setters* de manera más limpia y natural usando **decoradores**.

### Ejemplo con `@property`

``` python
class Persona:
    def __init__(self, nombre):
        self.__nombre = nombre

    @property
    def nombre(self):
        return self.__nombre

    @nombre.setter
    def nombre(self, nuevo_nombre):
        if len(nuevo_nombre) > 0:
            self.__nombre = nuevo_nombre
        else:
            print("❌ El nombre no puede estar vacío.")
```

Ahora se usa como si fuera un **atributo normal**:

``` python
p = Persona("Carlos")

print(p.nombre)   # ✅ Llama automáticamente al getter
p.nombre = "Andrés"  # ✅ Llama automáticamente al setter

print(p.nombre)   # ✅ Andrés
p.nombre = ""     # ❌ El nombre no puede estar vacío.
```

---

## Ventajas de usar @property

✅ No cambias la forma de usar los atributos.
✅ Puedes añadir validaciones sin romper el código existente.
✅ Encapsulas correctamente los datos.
✅ Evitas accesos o cambios indebidos.

---

## En resumen

| Tipo       | Decorador          | Se usa para      | Ejemplo                |
| ---------- | ------------------ | ---------------- | ---------------------- |
| **Getter** | `@property`        | Leer un valor    | `obj.atributo`         |
| **Setter** | `@atributo.setter` | Asignar un valor | `obj.atributo = valor` |

---

[Regresar a la Guía Principal](./../readme.md#5-python)

> **Autor:** Fravelz
