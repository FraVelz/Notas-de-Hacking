#!/bin/bash

# Booleanos en Bash
: '
No existe booleanos en bash, pero si existen 
comandos que pueden devolver verdadero o falso.
true 
false
'

# Operadores condicionales
: '
Para Numeros:
-eq Igual que.
-ne Distinto que.
-lt Menor que.
-le Menor o igual que.
-gt Mayor que.
-ge Mayor o igual que.

Para cadenas de texto:
= Igual 
!= Diferente
< menor lexicograficamente
> mayor lexicograficamente
'

# If-Elif-Else

: ' 

'
if [ 3 -gt 4 ]; then 
	echo "Mayor que 4"

elif false; then 
	echo "Nunca pasar"

else 
	echo "4 o menor"
fi

# Condiciones Compuestas (&&, ||)

if [ 10 -lt 14 ] && [ 10 -gt 12 ]; then 
	echo "verdadero"
fi

if [[ 10 -lt 14  &&  10 -gt 12 ]]; then 
	echo "verdadero"
fi

# Escibir Condicionales 

: '
las 3 siguientes formas de escribir el comando de
condiciones son iguales:

test condition;
[ condition ]
[[ condition || condition ]]
'

if test 10 -eq 10; then 
	echo "10 es igual a 10"
fi

# Author: Fravelz
