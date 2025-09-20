¡Muy bien! 🚀 En **Bash** también puedes definir **funciones**, igual que en otros lenguajes, pero con una sintaxis más sencilla.

---

## 🔹 Definición de una función

Hay 2 formas válidas:

```bash
# Forma 1 (la más usada)
mi_funcion() {
    echo "Hola desde la función"
}

# Forma 2 (menos usada, pero funciona)
function mi_funcion {
    echo "Hola desde la función"
}
```

---

## 🔹 Llamar una función

Simplemente escribes su nombre:

```bash
mi_funcion
```

---

## 🔹 Funciones con parámetros

Dentro de una función, los argumentos se acceden como en los scripts:

* `$1` → primer argumento
* `$2` → segundo argumento
* `$@` → todos los argumentos

Ejemplo:

```bash
saludar() {
    echo "Hola $1 $2"
}

saludar "Francisco" "Vélez"
```

👉 Salida:

```
Hola Francisco Vélez
```

---

## 🔹 Valores de retorno

En Bash, una función no devuelve con `return` como en C, sino:

* `return <n>` → devuelve un **código de salida** (0 = éxito, distinto de 0 = error).
* Para devolver un **valor**, lo normal es usar `echo` y **capturarlo**.

Ejemplo:

```bash
sumar() {
    echo $(( $1 + $2 ))
}

resultado=$(sumar 5 7)
echo "La suma es: $resultado"
```

👉 Salida:

```
La suma es: 12
```

---

## 🔹 Variables dentro de funciones

Por defecto las variables son **globales**.
Si quieres que sean solo de la función, usa `local`:

```bash
contar() {
    local x=10
    echo "Dentro de la función: $x"
}

contar
echo "Fuera de la función: $x"   # vacío, porque x era local
```

---

✅ En resumen:

* Definición: `nombre() { ... }`
* Argumentos: `$1, $2, ...`
* Devolver valores: con `echo` y `$( )`
* Variables locales: `local`

---

¿Quieres que te arme un **ejemplo real de script con varias funciones** (ej. suma, resta, menú) para que veas cómo se usan en conjunto?

¡Excelente tema! 🔑 En **Bash** las **variables globales y locales** funcionan un poco diferente a otros lenguajes. Te explico paso a paso:

---

## 🔹 Variables Globales

* **Son las que creas normalmente** (sin `local`).
* Se pueden usar en cualquier parte del script, incluso dentro de funciones.
* **Problema**: si las modificas dentro de una función, cambian también afuera.

Ejemplo:

```bash
#!/bin/bash

mensaje="Hola mundo"   # variable global

cambiar() {
    mensaje="Cambiado dentro de la función"
}

echo "$mensaje"   # Hola mundo
cambiar
echo "$mensaje"   # Cambiado dentro de la función
```

👉 La función **afectó la variable global**.

---

## 🔹 Variables Locales

* Se definen con `local` **dentro de una función**.
* Solo existen **mientras se ejecuta la función**.
* Afuera no tienen efecto.

Ejemplo:

```bash
#!/bin/bash

mensaje="Hola mundo"   # variable global

cambiar() {
    local mensaje="Soy local"
    echo "Dentro de la función: $mensaje"
}

echo "Antes de la función: $mensaje"
cambiar
echo "Después de la función: $mensaje"
```

👉 Salida:

```
Antes de la función: Hola mundo
Dentro de la función: Soy local
Después de la función: Hola mundo
```

---

## 🔹 Diferencias clave

| Tipo       | Alcance                          | Vida útil                          |
| ---------- | -------------------------------- | ---------------------------------- |
| **Global** | Todo el script (y funciones)     | Hasta que termina el script        |
| **Local**  | Solo la función donde se declara | Se destruye al salir de la función |

---

📌 Reglas prácticas:

* Usa **globales** para datos compartidos.
* Usa **locales** dentro de funciones para no dañar variables globales sin querer.

---

¿Quieres que te prepare un **mini script con funciones de calculadora** (suma, resta, etc.) donde veas la diferencia entre variables locales y globales en acción?




¡Excelente tema! 🔑 En **Bash** las **variables globales y locales** funcionan un poco diferente a otros lenguajes. Te explico paso a paso:

---

## 🔹 Variables Globales

* **Son las que creas normalmente** (sin `local`).
* Se pueden usar en cualquier parte del script, incluso dentro de funciones.
* **Problema**: si las modificas dentro de una función, cambian también afuera.

Ejemplo:

```bash
#!/bin/bash

mensaje="Hola mundo"   # variable global

cambiar() {
    mensaje="Cambiado dentro de la función"
}

echo "$mensaje"   # Hola mundo
cambiar
echo "$mensaje"   # Cambiado dentro de la función
```

👉 La función **afectó la variable global**.

---

## 🔹 Variables Locales

* Se definen con `local` **dentro de una función**.
* Solo existen **mientras se ejecuta la función**.
* Afuera no tienen efecto.

Ejemplo:

```bash
#!/bin/bash

mensaje="Hola mundo"   # variable global

cambiar() {
    local mensaje="Soy local"
    echo "Dentro de la función: $mensaje"
}

echo "Antes de la función: $mensaje"
cambiar
echo "Después de la función: $mensaje"
```

👉 Salida:

```
Antes de la función: Hola mundo
Dentro de la función: Soy local
Después de la función: Hola mundo
```

---

## 🔹 Diferencias clave

| Tipo       | Alcance                          | Vida útil                          |
| ---------- | -------------------------------- | ---------------------------------- |
| **Global** | Todo el script (y funciones)     | Hasta que termina el script        |
| **Local**  | Solo la función donde se declara | Se destruye al salir de la función |

---

📌 Reglas prácticas:

* Usa **globales** para datos compartidos.
* Usa **locales** dentro de funciones para no dañar variables globales sin querer.

---

¿Quieres que te prepare un **mini script con funciones de calculadora** (suma, resta, etc.) donde veas la diferencia entre variables locales y globales en acción?

j




Perfecto 💻
Cuando hablamos de **manejo de argumentos en un script (por ejemplo en Bash)**, nos referimos a **cómo recibir y usar valores que el usuario pasa al ejecutar el script.**

---

## 📌 Pasar argumentos

Supón que tienes un script llamado `mi_script.sh`:

```bash
#!/bin/bash
echo "Hola $1"
```

Lo ejecutas así:

```bash
bash mi_script.sh Francisco
```

📌 **Salida:**

```
Hola Francisco
```

Aquí, `Francisco` es un argumento que se recibe como **\$1**.

---

## 🧠 Variables especiales de argumentos

| Variable        | Significado                                              |
| --------------- | -------------------------------------------------------- |
| `$0`            | Nombre del script                                        |
| `$1, $2, $3...` | Argumentos individuales                                  |
| `$#`            | Número total de argumentos                               |
| `$@`            | Todos los argumentos como lista                          |
| `$*`            | Todos los argumentos como una sola cadena                |
| `"$@"`          | Cada argumento de forma independiente (respeta espacios) |
| `"$*"`          | Todos los argumentos como un solo string                 |

Ejemplo:

```bash
#!/bin/bash
echo "Script: $0"
echo "Primer argumento: $1"
echo "Segundo argumento: $2"
echo "Cantidad de argumentos: $#"
echo "Todos los argumentos: $@"
```

Ejecutando:

```bash
bash mi_script.sh uno dos tres
```

📌 **Salida:**

```
Script: mi_script.sh
Primer argumento: uno
Segundo argumento: dos
Cantidad de argumentos: 3
Todos los argumentos: uno dos tres
```

---

## ⚙️ Recorrer todos los argumentos

Puedes usar un bucle `for`:

```bash
#!/bin/bash
for arg in "$@"; do
  echo "Argumento: $arg"
done
```

---

Si quieres, puedo mostrarte también **cómo validar si un argumento fue pasado o no** (para evitar errores).
¿Quieres que lo haga?







Perfecto 🚀. En Bash, cuando ejecutas un script, los argumentos que pasas se guardan en **variables especiales**:

* `$0` → nombre del script.
* `$1, $2, $3...` → primer, segundo, tercer argumento…
* `$@` → todos los argumentos.
* `$#` → cantidad de argumentos recibidos.

---

## 🔹 Ejemplo básico

```bash
#!/bin/bash

echo "Este script se llama: $0"
echo "Primer argumento: $1"
echo "Segundo argumento: $2"
echo "Número de argumentos: $#"
```

Si lo corres así:

```bash
./mi_script.sh hola mundo
```

👉 Salida:

```
Este script se llama: ./mi_script.sh
Primer argumento: hola
Segundo argumento: mundo
Número de argumentos: 2
```

---

## 🔹 Validar que se pasen argumentos

Muchas veces el script necesita **cierto número de argumentos**.
Ejemplo: pedir 2 números para sumarlos:

```bash
#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Uso: $0 num1 num2"
    exit 1
fi

suma=$(( $1 + $2 ))
echo "La suma es: $suma"
```

* `[ $# -ne 2 ]` → si el número de argumentos no es 2.
* `exit 1` → termina el script con error.

---

## 🔹 Validar que los argumentos no estén vacíos

```bash
#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: falta el primer argumento"
    exit 1
fi
```

* `-z` → verdadero si la variable está vacía.

---

## 🔹 Validar que el argumento sea un número

```bash
#!/bin/bash

if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Error: $1 no es un número"
    exit 1
fi

echo "Número válido: $1"
```

👉 Aquí usamos una **expresión regular** (`[[ ]]` con `=~`) para asegurarnos de que solo contenga dígitos.

---

✅ En resumen:

* `$#` → cuántos argumentos.
* `-z "$1"` → vacío o no.
* `[[ "$1" =~ regex ]]` → validar formato (ej. número, texto, etc.).

---

¿Quieres que te arme un **script de ejemplo completo** que valide argumentos y muestre un menú de errores según el caso (faltan, no son números, etc.)?








¡Muy buena pregunta! 🔥 `shift` es clave cuando quieres **recorrer todos los argumentos** en un script de Bash.

---

## 🔹 ¿Qué hace `shift`?

* Elimina el **primer argumento** (`$1`) y **mueve todos los demás a la izquierda**.
* El número de argumentos (`$#`) disminuye en 1.

Ejemplo:

```bash
#!/bin/bash

echo "Antes de shift:"
echo "Arg1: $1"
echo "Arg2: $2"
echo "Arg3: $3"
echo "Total: $#"

shift   # mueve todo 1 lugar a la izquierda

echo "Después de shift:"
echo "Arg1: $1"
echo "Arg2: $2"
echo "Arg3: $3"
echo "Total: $#"
```

Si corres:

```bash
./script.sh a b c
```

👉 Salida:

```
Antes de shift:
Arg1: a
Arg2: b
Arg3: c
Total: 3

Después de shift:
Arg1: b
Arg2: c
Arg3:
Total: 2
```

---

## 🔹 Recorrer todos los argumentos con `shift`

Se suele usar junto con un **while**:

```bash
#!/bin/bash

while [ $# -gt 0 ]; do
    echo "Argumento actual: $1"
    shift   # pasa al siguiente argumento
done
```

Si corres:

```bash
./script.sh uno dos tres
```

👉 Salida:

```
Argumento actual: uno
Argumento actual: dos
Argumento actual: tres
```

---

## 🔹 `shift N`

También puedes decir cuántos argumentos mover a la vez:

```bash
shift 2
```

👉 elimina `$1` y `$2`, y el nuevo `$1` será el que era `$3`.

---

✅ En resumen:

* `shift` = descartar el primer argumento y recorrer los demás.
* Útil en bucles para procesar **todos los argumentos uno a uno**.

---

¿Quieres que te prepare un **script ejemplo tipo parser** (como los de Linux: `./script.sh -a -b archivo.txt`) donde use `shift` para leer opciones y parámetros?

