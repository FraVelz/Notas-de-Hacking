# Estructuras de Control en Bash Script

Este documento explica cómo usar **bucles**, **estructuras de control** y el comando **case** en Bash.  
Incluye ejemplos prácticos y comentarios explicativos.

---

## Temario

- [Estructuras de Control en Bash Script](#estructuras-de-control-en-bash-script)
	- [Temario](#temario)
	- [Bucle `for`](#bucle-for)
	- [Bucle `while`](#bucle-while)
	- [Bucle `until`](#bucle-until)
	- [Comandos `continue` y `break`](#comandos-continue-y-break)
	- [Estructura `case`](#estructura-case)

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

---

## Bucle `for`

El bucle `for` permite ejecutar una serie de comandos repetidamente para una lista de valores o rangos numéricos.

**Ejemplo 1: Lista de elementos:**

``` bash
for fruta in manzana mango pera; do
	echo "Me gusta la $fruta"
done
````

> Recorre una lista de palabras (en este caso, frutas) y ejecuta el bloque `do ... done` para cada elemento.

**Ejemplo 2: Rango de números:**

``` bash
for i in {1..3}; do 
	echo "Contando: $i"
done
```

> `{1..3}` genera una secuencia del 1 al 3.

**Ejemplo 3: Sintaxis estilo C**

``` bash
for (( j=10; j>=5; j-- )) do 
	echo "Cuenta regresiva: $j"
done
```

> Esta forma usa la sintaxis tradicional tipo C:
>
> ```bash
> for (( inicialización; condición; incremento ))
> ```

---

## Bucle `while`

Ejecuta un bloque de código **mientras una condición sea verdadera**.

``` bash
i=0

while [[ $i -lt 3 ]] do 
	echo "i = $i"
	((i++))
done
```

> En este ejemplo, el bucle incrementa `i` desde 0 hasta que ya no sea menor que 3.

**Leer líneas desde un archivo:**

Puedes usar `while` junto con `read` para leer archivos línea por línea.

``` bash
while read line; do 
    echo "- $line"
done < archivo.txt
```

> Esto imprimirá cada línea del archivo precedida por un guion.

---

## Bucle `until`

El bucle `until` funciona igual que `while`, pero **se ejecuta mientras la condición sea falsa**.

``` bash
contador=1

until [[ $contador -gt 5 ]]; do
  echo "Contando: $contador"
  ((contador++))
done
'
```

> En este ejemplo, el bucle incrementa `i` desde 1 hasta 5.

---

## Comandos `continue` y `break`

Los comandos `continue` y `break` sirven para **controlar el flujo dentro de los bucles**.

``` bash
contador=0

while true; do
  ((contador++))
  
  # Si el contador es 3, saltar esta vuelta
  if [[ $contador -eq 3 ]]; then
    echo "Saltando el número 3..."
    continue
  fi

  echo "Número: $contador"
  
  # Si el contador llega a 5, terminar el bucle
  if [[ $contador -eq 5 ]]; then
    echo "Se alcanzó el 5. Saliendo..."
    break
  fi
done
```

> `break n` rompe `n` niveles de bucles anidados.  
> `continue` salta directamente a la siguiente iteración.

---

## Estructura `case`

La estructura `case` permite comparar una variable con múltiples patrones, similar al `switch` en otros lenguajes.

``` bash
num=10

case $num in 
	1)
		echo "Elegiste uno"
		;;
	2)
		echo "Elegiste dos"
		;;
	*)
		echo "Numero desconocido :v"
		;;
esac
```

> Cada bloque se cierra con `;;` y el comodín `*` actúa como **caso por defecto**.

---

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

> **Autor:** Fravelz
