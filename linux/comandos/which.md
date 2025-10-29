# Which en Linux

---

## Temario

- [Which en Linux](#which-en-linux)
  - [Temario](#temario)
  - [¿Que es el comando which?](#que-es-el-comando-which)
    - [Ejemplo básico](#ejemplo-básico)
    - [Otro ejemplo](#otro-ejemplo)
    - [Si el comando no existe](#si-el-comando-no-existe)
    - [Ver qué versión se usa si hay varias instaladas](#ver-qué-versión-se-usa-si-hay-varias-instaladas)
    - [En resumen](#en-resumen)

[Regresar a la Guía Principal](./../../readme.md#5-python)

---

## ¿Que es el comando which?

El comando `which` en Linux (y otros sistemas Unix) sirve para **mostrar la ruta completa del ejecutable** que se ejecutará cuando llamas a un comando.

🔹 **En pocas palabras:**
Te dice **dónde está ubicado** el programa que se ejecutará cuando escribes algo como `python`, `ls`, `gcc`, etc.

### Ejemplo básico

``` bash
which python
```

📤 **Salida posible:**

``` bash
/usr/bin/python
```

➡️ Significa que cuando escribes `python` en la terminal, se ejecuta el archivo `/usr/bin/python`.

---

### Otro ejemplo

``` bash
which ls
```

📤 Resultado:

``` bash
/bin/ls
```

➡️ `ls` está en la carpeta `/bin`.

---

### Si el comando no existe

``` bash
which pepe
```

📤 Resultado:

``` bash
pepe not found
```

---

### Ver qué versión se usa si hay varias instaladas

``` bash
which -a python
```

📤 Resultado:

``` bash
/usr/bin/python
/usr/local/bin/python
```

➡️ Te muestra **todas** las ubicaciones posibles que coinciden, en orden de prioridad según tu `$PATH`.

---

### En resumen

| Opción             | Descripción                                                       |
| ------------------ | ----------------------------------------------------------------- |
| `which comando`    | Muestra la ruta del ejecutable que se ejecuta al usar ese comando |
| `which -a comando` | Muestra todas las rutas donde se encuentra ese comando            |

--

[Regresar a la Guía Principal](./../../readme.md#5-python)

> **Autor:** Fravelz
