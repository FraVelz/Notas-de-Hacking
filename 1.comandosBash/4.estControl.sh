#!/bin/bash

# Bucles for *************************************

for fruta in manzana mango pera; do
	echo "Me gusta la $fruta"
done

for i in {1..3}; do 
	echo "Contando: $i"
done 

for (( j=10; j>=5; j-- )) do 
	echo "Cuenta regresiva: $j"
done

# Bucles while ***********************************
i=0

while [[ $i -lt 3 ]] do 
	echo "i = $i"
	((i++))
done

# Leer archivo 

#while read line; do 
#	echo "- $line"
#done < archivo.txt

# Bucles until ***********************************

: '
igual que el while pero a diferencia de que 
mientras la condicion sea falsa se sigue 
ejecutando.
'

# Continue/break *********************************

: '
se utiliza continue para continuar en el bucle y
break para romper en el bucle como cualquier otro
lenguaje de programacion.

con excepcion de que si hay N bucles anidados y
en el interior de todos colocas un break x, 
rompera todos los N bucles anidados, siempre y 
cuando x = N, estaria rompiendo los x bucles
anidados.
'

# Case *******************************************

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

# Author: Fravelz

