# Variables protegidas y privadas en clases

---

## Temario

- [Variables protegidas y privadas en clases](#variables-protegidas-y-privadas-en-clases)
  - [Temario](#temario)
  - [1. self.\_variable (un guion bajo)](#1-self_variable-un-guion-bajo)
  - [2. self.\_\_variable (doble guion bajo)](#2-self__variable-doble-guion-bajo)
  - [En resumen](#en-resumen)

[Regresar a la Guía Principal](./../readme.md#5-python)

---

## 1. self._variable (un guion bajo)

Por **convención**, el **guion bajo simple `_`** indica que el atributo es **“protegido” (protected)**, o sea:

> “No lo uses directamente fuera de la clase, aunque *puedes- hacerlo si realmente quieres”.

Python **no bloquea** su acceso; es solo una **advertencia entre programadores**.

``` python
class Persona:
    def __init__(self, nombre):
        self._nombre = nombre  # protegido

p = Persona("Ana")
print(p._nombre)  # 😅 Funciona, pero no deberías accederlo así
```

---

## 2. self.__variable (doble guion bajo)

El **doble guion bajo `__`** activa el mecanismo de **name mangling** o “ofuscación de nombre”.

Eso significa que Python **cambia internamente el nombre del atributo** para evitar que se sobrescriba o se acceda fácilmente desde fuera de la clase.

Por ejemplo:

``` python
class Persona:
    def __init__(self, nombre):
        self.__nombre = nombre  # privado (name mangling)

p = Persona("Luis")

print(p.__nombre)  # ❌ Error: AttributeError
```

Pero internamente Python lo guarda así

``` python
print(p._Persona__nombre)  # ✅ Luis
```

En otras palabras:

- No lo vuelve *totalmente privado*, pero **dificulta** su acceso externo.
- Se usa para **evitar colisiones de nombres** en clases hijas (herencia) y **proteger la integridad interna**.

---

## En resumen

| Notación          | Nombre                  | Protección      | Accesible desde fuera           | Uso común                                             |
| ----------------- | ----------------------- | --------------- | ------------------------------- | ----------------------------------------------------- |
| `self.variable`   | Pública                 | ❌ No protegida  | ✅ Sí                            | Atributos normales                                    |
| `self._variable`  | Protegida               | ⚠️ Semiprivada  | ✅ Sí (por convención, no tocar) | Uso interno o en subclases                            |
| `self.__variable` | Privada (name mangling) | ✅ Más protegida | 🚫 No directamente              | Evitar acceso desde fuera o sobrescritura en herencia |

---

[Regresar a la Guía Principal](./../readme.md#5-python)

> **Autor:** Fravelz
