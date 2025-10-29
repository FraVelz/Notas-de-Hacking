# Diff en Linux

---

## Temario

- [Diff en Linux](#diff-en-linux)
  - [Temario](#temario)
    - [En resumen](#en-resumen)
    - [Ejemplo básico](#ejemplo-básico)
    - [Símbolos principales](#símbolos-principales)
    - [Opciones útiles](#opciones-útiles)
    - [Usos comunes](#usos-comunes)

[Regresar a la Guía Principal](./../../readme.md#5-python)

---

### En resumen

El comando `diff` en Linux/Unix se usa para **comparar dos archivos (o carpetas)** línea por línea y mostrar **las diferencias entre ellos**. 🔍

``` bash
diff archivo1 archivo2
```

👉 Muestra qué líneas **cambian, se agregan o eliminan** de un archivo respecto al otro.

---

### Ejemplo básico

Supongamos que tienes dos archivos:

**archivo1.txt:**

``` txt
hola
mundo
como estas
```

**archivo2.txt:**

``` txt
hola
mundo!!!
como estas
```

Si ejecutas:

``` bash
diff archivo1.txt archivo2.txt
```

La salida será:

``` diff
2c2
< mundo
---
> mundo!!!
```

🔍 Significa:

- En la **línea 2** (`2c2` → *línea 2 cambiada*),
- `mundo` fue reemplazado por `mundo!!!`.

---

### Símbolos principales

| Símbolo | Significado                                   |
| ------- | --------------------------------------------- |
| `<`     | línea que **solo está en el primer archivo**  |
| `>`     | línea que **solo está en el segundo archivo** |
| `a`     | “add” — se agregó algo                        |
| `d`     | “delete” — se eliminó algo                    |
| `c`     | “change” — cambió algo                        |

---

### Opciones útiles

| Opción | Descripción                                                                     |
| ------ | ------------------------------------------------------------------------------- |
| `-u`   | Muestra diferencias en **formato unificado** (más legible, usado por Git).      |
| `-y`   | Muestra los archivos **lado a lado**.                                           |
| `-q`   | Solo indica si los archivos **son diferentes o iguales**, sin mostrar detalles. |
| `-r`   | Compara **directorios recursivamente**.                                         |

Ejemplo:

``` bash
diff -u archivo1.txt archivo2.txt
```

Salida tipo “Git”:

``` diff
--- archivo1.txt
+++ archivo2.txt
@@ -1,3 +1,3 @@
 hola
-mundo
+mundo!!!
 como estas
```

---

### Usos comunes

- Ver qué cambió entre dos versiones de un archivo.
- Comparar archivos de configuración.
- Analizar diferencias en código fuente.
- Generar *parches* con `diff` y aplicarlos con `patch`.

---

[Regresar a la Guía Principal](./../../readme.md#5-python)

> **Autor:** Fravelz
