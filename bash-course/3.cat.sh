#! /bin/bash

# Delimitar de  cat (cualquier nombre se le puede colocar)
# Imprime un texto de varias lineas con cat
cat << myText 
Esto es un texto
de varias lineas
myText

echo " [+] cual es tu edad: "
read age
echo " >>> Esta es tu edad: $age edad"

