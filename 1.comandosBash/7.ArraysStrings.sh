¡Perfecto! 🚀 En **Bash**, los **arrays** son muy útiles para guardar y manejar listas de valores. A diferencia de otros lenguajes, en Bash los arrays son **unidimensionales** (pero puedes simular multidimensionales).

Aquí tienes una guía **completa**:

---

# 🔹 1. Definir arrays

```bash
# Array con valores
nombres=("Ana" "Luis" "Pedro")

# Otra forma (asignando por índice)
numeros[0]=10
numeros[1]=20
numeros[2]=30
```

---

# 🔹 2. Acceder a elementos

```bash
echo "${nombres[0]}"   # Ana
echo "${nombres[2]}"   # Pedro
```

Si usas un índice que no existe:

```bash
echo "${nombres[5]}"   # vacío
```

---

# 🔹 3. Mostrar todos los elementos

```bash
echo "${nombres[@]}"   # Ana Luis Pedro
echo "${numeros[*]}"   # 10 20 30
```

---

# 🔹 4. Tamaño del array

```bash
echo "${#nombres[@]}"  # 3
```

---

# 🔹 5. Recorrer arrays

### Con `for`:

```bash
for nombre in "${nombres[@]}"; do
    echo "Hola $nombre"
done
```

👉 Salida:

```
Hola Ana
Hola Luis
Hola Pedro
```

### Con índices:

```bash
for i in "${!nombres[@]}"; do
    echo "Índice: $i → Valor: ${nombres[$i]}"
done
```

---

# 🔹 6. Añadir y modificar elementos

```bash
nombres+=("Carla")      # Agregar al final
nombres[1]="Lucía"      # Modificar el índice 1
```

---

# 🔹 7. Eliminar elementos

```bash
unset nombres[1]       # Elimina solo el índice 1
unset nombres          # Borra todo el array
```

---

# 🔹 8. Subarrays (rebanadas)

```bash
echo "${nombres[@]:1:2}"   # desde índice 1, tomar 2 elementos
```

---

# 🔹 9. Arrays asociativos (tipo diccionario)

Disponibles en **Bash 4+**.

```bash
declare -A capitales
capitales[Colombia]="Bogotá"
capitales[México]="CDMX"
capitales[España]="Madrid"

echo "${capitales[Colombia]}"   # Bogotá

# Recorrer claves y valores
for pais in "${!capitales[@]}"; do
    echo "$pais → ${capitales[$pais]}"
done
```

👉 Salida:

```
México → CDMX
España → Madrid
Colombia → Bogotá
```

---

# 🔹 10. Cosas útiles

* **Índice del último elemento**:

  ```bash
  echo "${!nombres[@]}"  # muestra todos los índices
  ```
* **Ordenar un array**:

  ```bash
  numeros=(5 3 8 1)
  sorted=($(printf "%s\n" "${numeros[@]}" | sort -n))
  echo "${sorted[@]}"   # 1 3 5 8
  ```

---

✅ En resumen:

* `array=(val1 val2 val3)` → define.
* `${array[i]}` → acceder.
* `${array[@]}` → todos los valores.
* `declare -A` → arrays asociativos.

---

¿Quieres que te prepare un **mini script `.sh` de ejemplo** que use **arrays normales + asociativos** para simular, por ejemplo, un registro de alumnos con notas?








¡Buenísima! 🔥 La **manipulación de strings en Bash** es enorme, porque todo en Bash al final son cadenas.
Aquí te hago una guía **completa, ordenada y con ejemplos prácticos**:

---

# 🔹 1. Definir strings

```bash
cadena="Hola Mundo"
```

* Siempre usar **comillas** si hay espacios.
* No existen tipos como en otros lenguajes, todo es texto.

---

# 🔹 2. Longitud de un string

```bash
echo "${#cadena}"   # 10
```

---

# 🔹 3. Substrings

```bash
echo "${cadena:0:4}"   # Hola (desde índice 0, tomar 4)
echo "${cadena:5}"     # Mundo (desde índice 5 hasta el final)
```

---

# 🔹 4. Reemplazos dentro de un string

```bash
texto="banana"

echo "${texto/na/NA}"    # baNAna (primer reemplazo)
echo "${texto//na/NA}"   # baNANA (todos los reemplazos)

echo "${texto/na/}"      # baana   (borra primer "na")
echo "${texto//na/}"     # baa     (borra todos "na")
```

---

# 🔹 5. Eliminar prefijos y sufijos

```bash
archivo="documento.txt"

echo "${archivo%.txt}"   # documento  (quita sufijo .txt)
echo "${archivo#doc}"    # umento.txt (quita prefijo doc)

# Con doble signo borra lo más largo
ruta="/home/user/docs/file.txt"
echo "${ruta##*/}"       # file.txt  (quita todo hasta el último /)
echo "${ruta%%/*}"       # vacío     (quita todo desde el primer /)
```

---

# 🔹 6. Concatenar strings

```bash
nombre="Francisco"
saludo="Hola, $nombre"
echo "$saludo"
```

También:

```bash
full="Hola" 
full+=" Mundo"
echo "$full"   # Hola Mundo
```

---

# 🔹 7. Convertir mayúsculas / minúsculas (Bash 4+)

```bash
texto="hola mundo"

echo "${texto^^}"   # HOLA MUNDO
echo "${texto,,}"   # hola mundo
```

---

# 🔹 8. Buscar dentro de un string

```bash
cadena="programacion"
if [[ "$cadena" == *"grama"* ]]; then
    echo "Contiene 'grama'"
fi
```

---

# 🔹 9. Dividir un string (split)

Con `IFS` (Internal Field Separator):

```bash
frase="uno dos tres"
IFS=" " read -r -a palabras <<< "$frase"

echo "${palabras[0]}"  # uno
echo "${palabras[1]}"  # dos
echo "${palabras[2]}"  # tres
```

---

# 🔹 10. Juntar un array en string

```bash
lista=("a" "b" "c")
echo "${lista[*]}"   # a b c
echo "${lista[@]}"   # a b c
```

Con separador personalizado:

```bash
IFS=","; echo "${lista[*]}"   # a,b,c
```

---

# 🔹 11. Expresiones regulares en strings

```bash
cadena="abc123"
if [[ "$cadena" =~ ^[a-z]+[0-9]+$ ]]; then
    echo "Coincide con letras seguidas de números"
fi
```

---

# 🔹 12. Lectura carácter por carácter

```bash
texto="Hola"
for (( i=0; i<${#texto}; i++ )); do
    echo "${texto:$i:1}"
done
```

👉 Imprime cada letra en una línea.

---

✅ **En resumen**:

* `${#str}` → longitud
* `${str:pos:len}` → substring
* `${str/patrón/reemplazo}` → reemplazo
* `${str%patrón}` / `${str#patrón}` → quitar prefijo/sufijo
* `${str^^}` / `${str,,}` → mayúsculas/minúsculas
* `IFS` + `read -a` → split

---

¿Quieres que te arme un **script práctico con un menú** (ej: contar caracteres, cortar, reemplazar, convertir mayúsculas, etc.) para practicar todos estos casos?

