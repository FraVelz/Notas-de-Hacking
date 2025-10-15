# Fundamentos de Bash Script

---

## Temario

- [Fundamentos de Bash Script](#fundamentos-de-bash-script)
  - [Temario](#temario)
  - [Cabecera del Script](#cabecera-del-script)
  - [Imprimir texto y comentarios](#imprimir-texto-y-comentarios)
  - [Variables en Bash](#variables-en-bash)
    - [Variables especiales](#variables-especiales)
  - [Strings](#strings)
  - [Valores constantes](#valores-constantes)
  - [Operaciones matemáticas](#operaciones-matemáticas)
    - [Símbolos matemáticos](#símbolos-matemáticos)
  - [Leer entrada del usuario](#leer-entrada-del-usuario)
    - [Parámetros útiles](#parámetros-útiles)

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

---

## Cabecera del Script

La **cabecera** o *shebang* indica qué intérprete ejecutará el script.

``` bash
#!/bin/bash
````

---

## Imprimir texto y comentarios

Puedes imprimir texto con `echo` y escribir comentarios de varias formas.

``` bash
# Imprimir texto
echo "hola mundo !!!"    # Imprime hola mundo por consola

# Esto es un comentario de una sola línea.
```

Comentarios multilínea pueden simularse con dos métodos:

``` bash
: '
Comentario (*recomendado)
multilinea simulado
con null command con string.
'

<< 'EOF'
Comentario 
multilinea simulado
con here document descartado.
EOF
```

---

## Variables en Bash

En Bash solo existe un tipo de dato: **string** (cadena de texto). Se puede escribir **sin comillas**, o con **comillas simples** o **dobles**.

Ejemplo:

``` bash
name=Fravelz
today="10 09 2025"
message='hola $name'
```

> Importante: No deben colocarse espacios al declarar una variable. Bash es sensible a los espacios.

Para usar una variable se coloca `$` antes de su nombre:
`$variable`

### Variables especiales

| Variable        | Significado                         |
| --------------- | ----------------------------------- |
| `$0`            | Nombre del script                   |
| `$1`, `$2`, ... | Argumentos del script               |
| `$#`            | Número de argumentos                |
| `$?`            | Código de salida del último comando |
| `$$`            | PID del script actual               |

Para imprimir valores (evitando errores con espacios), se recomienda:

``` bash
echo "$variable"
```

---

## Strings

``` bash
name=Fravelz
today="10 09 2025"
message='hola $name'
```

Los strings pueden ser multilínea (guarda exactamente los saltos de líneas que tenga):

``` bash
text="
Este es un string
Multilinea :)
"
```

Llamar a variables e imprimir:

``` bash
echo "Mi nombre es $name y estamos en el year $today"
echo $message
echo $text
```

---

## Valores constantes

Usa `readonly` para declarar constantes:

``` bash
readonly PI=3.1416
```

---

## Operaciones matemáticas

Bash permite realizar operaciones aritméticas en las siguientes formas:

``` bash
a=1
b=2

echo $((a + b))      
echo $(expr $a + $b)
```

### Símbolos matemáticos

| Símbolo | Operación      |
| ------- | -------------- |
| `+`     | Suma           |
| `-`     | Resta          |
| `*`     | Multiplicación |
| `/`     | División       |
| `**`    | Exponente      |
| `%`     | Módulo (resto) |

---

## Leer entrada del usuario

El comando `read` se usa para leer datos del usuario.

### Parámetros útiles

| Parámetro | Descripción                               |
| --------- | ----------------------------------------- |
| `-s`      | Oculta la entrada (útil para contraseñas) |
| `-p`      | Muestra un mensaje en línea               |
| `-t`      | Define un límite de tiempo (timeout)      |

Ejemplo:

``` bash
echo "Cual es tu User?"
read user

echo "Cual es tu name?"
read -p name

read -t 4 -p "Escribe algo en 4 seg.:" value
echo "Ingresaste $value"
```

---

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

> **Autor:** Fravelz
