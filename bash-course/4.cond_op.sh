#! /bin/bash
age=10

# -ge: >= : Mayor o igual a
# -eq: == : Igual a 
# -le: <= : Menor o igual a

#if [ $age -eq 10 ]
if (( $age == 10 ))
then
	echo "El numero es igual :)"
elif (( $age >= 18 ))
then
	echo "Eres mayor de edad"
else
	echo "El numero no es igual :("
fi

