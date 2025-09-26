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


# comando 'cat' (concatenate) ****************************************
# Sirve para mostrar o juntar archivos.


# 1. Mostrar un archivo en pantalla
cat /1.comandosBash/5.EntradaYSalida.sh

# 2. Juntar varios archivos en uno
cat a.txt b.txt > c.txt

# 3. Añadir contenido (a.txt) al final de otro archivo (b.txt)
cat a.txt >> b.txt

# 4. Escribir contenido manualmente en un archivo

: '
cat > nuevo.txt
Hola
Mundo
CTRL+D # (para terminar)
'

# Comando tee ********************************************************

: '
Sirve para redirigir salida a un archivo, pero también mostrarla en 
pantalla al mismo tiempo.
'

# 1. Guardar y mostrar a la vez
echo "Hola mundo" | tee salida.txt

# 2. Modo append (agregar al final, no sobrescribir)
ls | tee -a lista.txt

# 3. Varios archivos a la vez
# Guarda la salida en ambos archivos y la muestra en pantalla.
ls | tee archivo1.txt archivo2.txt

# Author: Fravelz
