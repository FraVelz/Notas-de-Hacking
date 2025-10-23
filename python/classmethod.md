# Decorador @classmethod

`@classmethod` permite crear funciones que pueden **acceder o modificar el estado de la clase**, sin necesidad de crear un objeto.

---

## Temario

- [Decorador @classmethod](#decorador-classmethod)
  - [Temario](#temario)
  - [Ejemplo](#ejemplo)
  - [Diferencias entre tipos de métodos](#diferencias-entre-tipos-de-métodos)
  - [En resumen](#en-resumen)

[Regresar a la Guía Principal](./../readme.md#5-python)

---

## Ejemplo

``` python
class Persona:
    poblacion = 0  # Atributo de clase

    def __init__(self, nombre):
        self.nombre = nombre
        Persona.poblacion += 1

    @classmethod
    def cuantos_hay(cls):
        return f"Hay {cls.poblacion} personas registradas."

# Podemos llamar al método sin crear objetos:
print(Persona.cuantos_hay())  # Hay 0 personas registradas.

# Crear algunos objetos:
p1 = Persona("Ana")
p2 = Persona("Luis")

# Llamar de nuevo:
print(Persona.cuantos_hay())  # Hay 2 personas registradas.
```

---

## Diferencias entre tipos de métodos

| Tipo de método      | Primer parámetro | Accede a atributos de instancia | Accede a atributos de clase | Se llama sin crear objeto |
| ------------------- | ---------------- | ------------------------------- | --------------------------- | ------------------------- |
| **Normal (`def`)**  | `self`           | ✅ Sí                            | ✅ (vía `self.__class__`)    | ❌ No                      |
| **`@classmethod`**  | `cls`            | ❌ No                            | ✅ Sí                        | ✅ Sí                      |
| **`@staticmethod`** | ninguno          | ❌ No                            | ❌ No                        | ✅ Sí                      |

---

## En resumen

- `@staticmethod`: método **independiente**, solo usa los parámetros que se le pasen.

- `@classmethod`: método **ligado a la clase**, puede **usar o modificar atributos de la clase** y se puede llamar sin crear una instancia.

---

[Regresar a la Guía Principal](./../readme.md#5-python)

> **Autor:** Fravelz
