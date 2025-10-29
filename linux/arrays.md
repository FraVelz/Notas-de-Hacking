# Arrays en bash script

---

## Temario

- [Arrays en bash script](#arrays-en-bash-script)
  - [Temario](#temario)
  - [1. Definir arrays](#1-definir-arrays)
  - [2. Acceder a elementos](#2-acceder-a-elementos)
  - [3. Mostrar todos los elementos](#3-mostrar-todos-los-elementos)
  - [4. Tamaño del array](#4-tamaño-del-array)
  - [5. Recorrer arrays](#5-recorrer-arrays)
    - [Con for](#con-for)
    - [Con índices](#con-índices)
  - [6. Añadir y modificar elementos](#6-añadir-y-modificar-elementos)
  - [7. Eliminar elementos](#7-eliminar-elementos)
  - [8. Subarrays (rebanadas)](#8-subarrays-rebanadas)
  - [9. Arrays asociativos (tipo diccionario)](#9-arrays-asociativos-tipo-diccionario)
  - [10. Cosas útiles](#10-cosas-útiles)

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

---

## 1. Definir arrays

``` bash
# Array con valores
nombres=("Ana" "Luis" "Pedro")

# Otra forma (asignando por índice)
numeros[0]=10
numeros[1]=20
numeros[2]=30
```

---

## 2. Acceder a elementos

``` bash
echo "${nombres[0]}"   # Ana
echo "${nombres[2]}"   # Pedro
```

Si usas un índice que no existe:

``` bash
echo "${nombres[5]}"   # vacío
```

---

## 3. Mostrar todos los elementos

``` bash
echo "${nombres[@]}"   # Ana Luis Pedro
echo "${numeros[*]}"   # 10 20 30
```

---

## 4. Tamaño del array

``` bash
echo "${#nombres[@]}"  # 3
```

---

## 5. Recorrer arrays

### Con for

```bash
for nombre in "${nombres[@]}"; do
    echo "Hola $nombre"
done
```

Salida:

``` txt
Hola Ana
Hola Luis
Hola Pedro
```

### Con índices

``` bash
for i in "${!nombres[@]}"; do
    echo "Índice: $i → Valor: ${nombres[$i]}"
done
```

---

## 6. Añadir y modificar elementos

``` bash
nombres+=("Carla")      # Agregar al final
nombres[1]="Lucía"      # Modificar el índice 1
```

---

## 7. Eliminar elementos

``` bash
unset nombres[1]       # Elimina solo el índice 1
unset nombres          # Borra todo el array
```

---

## 8. Subarrays (rebanadas)

``` bash
echo "${nombres[@]:1:2}"   # desde índice 1, tomar 2 elementos
```

---

## 9. Arrays asociativos (tipo diccionario)

Disponibles en **Bash 4+**.

``` bash
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

Salida:

``` txt
México → CDMX
España → Madrid
Colombia → Bogotá
```

---

## 10. Cosas útiles

- **Índice del último elemento**:

  ``` bash
  echo "${!nombres[@]}"  # muestra todos los índices
  ```

- **Ordenar un array**:

  ``` bash
  numeros=(3 8 1)
  sorted=($(printf "%s\n" "${numeros[@]}" | sort -n))
  echo "${sorted[@]}"   # 1 3 5 8
  ```

---

En resumen:

- `array=(val1 val2 val3)` → define.
- `${array[i]}` → acceder.
- `${array[@]}` → todos los valores.
- `declare -A` → arrays asociativos.

---

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

> **Autor:** Fravelz
