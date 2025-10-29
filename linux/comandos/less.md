# Less en Linux

---

## Temario

- [Less en Linux](#less-en-linux)
  - [Temario](#temario)
    - [¿Qué hace exactamente?](#qué-hace-exactamente)
    - [Controles básicos dentro de `less`](#controles-básicos-dentro-de-less)
    - [Ejemplos útiles](#ejemplos-útiles)
    - [En resumen](#en-resumen)

[Regresar a la Guía Principal](./../readme.md#5-python)

--

### ¿Qué hace exactamente?

`less` muestra el contenido **por páginas**, no todo de golpe.
Esto es muy útil cuando el archivo es largo (como logs, código, o configuraciones grandes).

Ejemplo:

``` bash
less archivo.txt
```

---

### Controles básicos dentro de `less`

Una vez abierto el archivo:

| Tecla           | Acción                        |
| --------------- | ----------------------------- |
| ↓ o **Espacio** | Avanza una página             |
| ↑ o **b**       | Retrocede una página          |
| **g**           | Ir al principio del archivo   |
| **G**           | Ir al final del archivo       |
| **/texto**      | Buscar “texto” hacia adelante |
| **n**           | Repetir la búsqueda siguiente |
| **N**           | Repetir la búsqueda anterior  |
| **q**           | Salir                         |

---

### Ejemplos útiles

Ver varios archivos:

``` bash
less *.txt
```

(Mueve con `:n` para siguiente archivo y `:p` para anterior)

Ver salida de un comando largo (por ejemplo, un `ls` con muchos resultados):

``` bash
ls -l | less
```

Buscar dentro de un log:

``` bash
less /var/log/syslog
# Luego escribe /error para buscar la palabra "error"
```

---

### En resumen

`less`:

- **No edita archivos**, solo los muestra.
- **Carga rápido**, aunque el archivo sea enorme.
- **Permite búsqueda y navegación avanzada**.

---

[Regresar a la Guía Principal](./../readme.md#5-python)

> **Autor:** Fravelz
