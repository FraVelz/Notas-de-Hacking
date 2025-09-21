#!/bin/bash

# Redireciones en bash ***********************************************

: '
En bash hay 3 cosas importantes, y cada uno tienen un numero que es 
un descriptor de archivos:

* (0) Entrada (lo que le das a un programa, normalmente el teclado).
* (1) Salida normal (lo que muestra el programa).
* (2) Errores (los mensajes de error).

(3,4,5,...) Son opcionales que uno puede usar pero en programas mas 
avanzados.

mayormente para llamar a un descriptor de archivo se hace algo como
2> eso pero para el 0> no es nesesario, porque se puede hacer solo 
>
'

# (1. entrada) En vez del teclado puedes dar un archivo con (<)
cat < ./4.estControl.sh

# (2. salida) Salida normal (>, >>)

# Borra el contenido de salida.txt y agrega la salida del comando.
echo "hola," > ./salida.txt 

# Solo agrega y ya.
echo "mundo!" >> ./salida.txt

# (3. errores) Errores (2>)
ls noExiste 2> errores.txt

# Juntar salida y errores
comando > todo.txt 2>&1

: '
dice: comando envia la info de su descriptor de archivo 0
(es decir la salida) al archivo todo.txt y tambien la info del 
descriptor 2 (es decir los errores) enviarlos a &1, es decir al 
archivo. 

* en simples palabras: 
“manda los errores al mismo lugar donde está yendo la salida
normal”.

Generalizando

&0 → redirigir hacia donde vaya la entrada estándar.

&1 → redirigir hacia donde vaya la salida estándar.

&2 → redirigir hacia donde vaya la salida de errores.

Entonces: &N significa “hacia donde esté apuntando el descriptor 
N”, no hacia un archivo.
'

# Pipes (|)
# En vez de enviar la salida a un archivo la envias a un comando.

ls | grep .txt

# Lista los archivos y los envia al comando grep .txt, para que 
# grep lista solo los archivos que contengan .txt.


# La forma &>
: '
&> significa: redirigir la salida normal (1) y la salida de error 
(2) al mismo archivo o destino.
'

ls carpeta_inexistente &> salida.txt




Perfecto 🚀, vamos con **`cat`** y **`tee`**, dos comandos muy usados en Bash.

---

## 🐱 `cat` (concatenate)

👉 Sirve para **mostrar o juntar archivos**.
Básicos:

1. **Mostrar un archivo en pantalla**

```bash
cat archivo.txt
```

2. **Juntar varios archivos en uno**

```bash
cat a.txt b.txt > c.txt
```

👉 El contenido de `a.txt` y `b.txt` queda en `c.txt`.

3. **Añadir contenido al final de otro archivo**

```bash
cat a.txt >> b.txt
```

4. **Escribir contenido manualmente en un archivo**

```bash
cat > nuevo.txt
Hola
Mundo
CTRL+D   # (para terminar)
```

---

## 🌊 `tee`

👉 Sirve para **redirigir salida a un archivo, pero también mostrarla en pantalla al mismo tiempo**.
(Piensa en una “T” de tubería que se divide: una rama al archivo, otra a la terminal).

1. **Guardar y mostrar a la vez**

```bash
echo "Hola mundo" | tee salida.txt
```

👉 Verás "Hola mundo" en pantalla **y** se guardará en `salida.txt`.

2. **Modo append (agregar al final, no sobrescribir)**

```bash
ls | tee -a lista.txt
```

👉 La lista de archivos se agrega al final de `lista.txt` y también aparece en pantalla.

3. **Varios archivos a la vez**

```bash
ls | tee archivo1.txt archivo2.txt
```

👉 Guarda la salida en ambos archivos y la muestra en pantalla.

---

## 📌 Diferencia rápida

* `cat` → leer/mostrar/concatenar archivos.
* `tee` → guardar la salida de un comando en un archivo **y verla en pantalla al mismo tiempo**.

---

👉 Ejemplo comparativo:

```bash
ls > lista.txt
cat lista.txt
```

* Aquí `ls` manda la salida a `lista.txt` y luego usamos `cat` para verla.

```bash
ls | tee lista.txt
```

* Aquí hacemos lo mismo, **pero en un solo paso**: la vemos y se guarda.

---

¿Quieres que te haga un **mini script `.sh` práctico** usando `cat` y `tee` para que veas cómo se usan dentro de un flujo real?








La **concatenación de archivos** consiste en **unir el contenido de varios archivos en uno solo**, o simplemente **mostrar su contenido de forma continua**. Es común en sistemas tipo Unix/Linux (con Bash).

---

## 📁 Concatenación con `cat`

El comando más usado es `cat` (de *concatenate*).

### ▶ Mostrar varios archivos juntos

```bash
cat archivo1.txt archivo2.txt
```

Esto imprime el contenido de `archivo1.txt` seguido del de `archivo2.txt` en la terminal.

---

### ▶ Guardar la concatenación en un nuevo archivo

```bash
cat archivo1.txt archivo2.txt > combinado.txt
```

* `>` redirige la salida a `combinado.txt`
* Si el archivo existe, lo **sobrescribe**

---

### ▶ Añadir el contenido de un archivo al final de otro

```bash
cat archivo2.txt >> archivo1.txt
```

* `>>` agrega al final de `archivo1.txt` sin borrar su contenido previo.

---

## 📌 Consejos útiles

* Puedes concatenar **más de dos archivos**:

  ```bash
  cat a.txt b.txt c.txt > todo.txt
  ```
* Puedes usar **comodines** para unir muchos archivos:

  ```bash
  cat *.log > logs_combinados.txt
  ```

---

Si quieres, también puedo explicarte cómo hacerlo en otros lenguajes de programación (como Python, C++, etc.).
¿Quieres que lo haga?


