# Resolución problemas básicos de Bandit

---

## Temario

- [Resolución problemas básicos de Bandit](#resolución-problemas-básicos-de-bandit)
  - [Temario](#temario)
  - [Información](#información)
  - [Bandit0](#bandit0)
  - [Bandit1](#bandit1)
  - [Bandit2](#bandit2)
  - [Bandit3](#bandit3)
  - [Bandit4](#bandit4)
  - [Bandit5](#bandit5)
  - [Bandit6 (contiene clave siguiente)](#bandit6-contiene-clave-siguiente)
  - [Bandit7](#bandit7)
  - [Bandit8](#bandit8)
  - [Bandit9](#bandit9)
  - [Bandit10 (contiene clave para el siguiente)](#bandit10-contiene-clave-para-el-siguiente)
  - [Bandit11 (contiene clave para el siguiente)](#bandit11-contiene-clave-para-el-siguiente)
  - [Bandit12](#bandit12)
  - [Bandit13](#bandit13)
  - [Bandit14](#bandit14)
  - [Bandit15](#bandit15)

---

## Información

Página para practicar, comandos linux, desde la terminal.

Página Web: https://overthewire.org/wargames/bandit/

SSH Información

Host:

``` bash
bandit.labs.overthewire.org
```

``` bash
Port: 2220
```

Comando para cambiar de terminal y habilitar el comando clear:

``` bash
export TERM=xterm
```

<details>
  <summary>Comando ssh para conectarse a bandit</summary>
  Para conectarse a bandit0 se puede hacer con el siguiente comando:

  ``` bash
  ssh bandit0@bandit.labs.overthewire.org -p 2220
  ```

  Después de conectarte al servicio, bandit te pedirá una contraseña, en este caso la contraseña es

  ``` bash
  bandit0
  ```

  En vez de colocar bandit0 colocas bandit1 para el siguiente nivel, en cada nivel debes obtener una contraseña, que se dará las instrucciones en la página web ([Ir a página web (overthewire, bandit)](https://overthewire.org/wargames/bandit/)), para completar cada nivel y obtener dicha contraseña del siguiente nivel.
</details>

El propósito de este archivo, es dar pistas sencillas en español de los niveles, y además tener a mano la solución en dado, caso de querer saltar algún nivel, para luego estudiarlo.

Aunque, en la página oficial, ya hay material, para aprender, y pistas de como resolver los ejercicios (todo en ingles).

| Rango               | Dificultad y Temática                           |
| ------------------- | ----------------------------------------------- |
| bandit0 a bandit6   | fácil, conceptos básicos y filtrado de archivos |
| bandit6 a bandit7   | fácil, filtrado de texto en archivos            |
| bandit10 a bandit13 | fácil-intermedio, decodificación                |

Página web:

![Imagen de página web de bandit](./../images/bandit-overthewire.png)

Terminal:

![Imagen de terminal de bandit](./../images/terminal-overthewire.png)

---

## Bandit0

**Pista:** Solo hay que leer.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  cat readme.md
  ```

</details>

---

## Bandit1

**Pista:** solo hay que leer de otra forma.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  cat ./-
  ```

  Se indica que en el directorio actual existe un archivo que se llama `-` y lo muestra.

</details>

---

## Bandit2

**Pista:** solo hay que leer igual que el anterior pero con unas cosas extras.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  cat "./--spaces in this filename--"
  ```

  Indica que con `"`, que en el repositorio actual existe un archivo con espacios de línea y `-` guiones, y lo muestra.

</details>

---

## Bandit3

**Pista:** Igual que la anterior, pero solo hay un directorio con un archivo oculto.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  cat "inhere/...Hiding-From-You"
  ```

  Indica con `"` el texto como tal aparece, es la ruta y nombre del archivo, en el repositorio, y lo muestra.

</details>

---

## Bandit4

**Pista:** el archivo que sea tipo texto es el que tendrá la clave.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  find ./inhere/ -type f | xargs file
  ```

  Busca en la carpeta `inhere`, busca los archivos `-type f`, y muestra el tipo de datos que contenga `xargs file` cada archivo.

  El archivo que sea ascii text, es el que contendrá la clave para el siguiente nivel.

</details>

---

## Bandit5

**Pista:**

- legible para humanos
- 1033 bytes de tamaño
- no ejecutable

<details>
  <summary>Posible solucion</summary>

  ``` bash
  find ./inhere/ -type f -size 1033c
  ```

  Busca en `inhere` un archivo `-type f` que contenga un tamaño de 1033 bytes `-size 1033c`.

  Dará la ruta del archivo que cumpla con los requisitos de tamaño si hay solo 1, ese tendrá la clave.

</details>

---

## Bandit6 (contiene clave siguiente)

**Pista:**

- Propiedad del usuario bandit7
- Propiedad del grupo bandit6
- Tamaño: 33 bytes

<details>
  <summary>Posible solucion</summary>

  ``` bash
  find / -user bandit7 -group bandit6 -size 33c 2>/dev/null
  ```

  Busca desde `/` archivo o carpeta que contenga, como permisos de usuario bandit7 `-user bandit7`, como grupo `-group bandit6`, y que contenga un tamaño de 33 bytes `-size 33c`, habrán archivos que cumplan los requerimientos, pero no serán accesibles y darán error, entonces esos archivos no lo mostramos en la terminal con `2>/dev/null`.

  Mostrará la dirección del archivo que tendrá la clave.

</details>

<details>
  <summary>Clave para el siguiente</summary>

  ``` bash
  morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj
  ```

</details>

---

## Bandit7

**Pista:** La contraseña para el siguiente nivel se almacena en el archivo data.txt junto a la palabra "millionth".

<details>
  <summary>Posible solucion</summary>

  ``` bash
  cat data.txt | grep millionth
  ```

  Muestra el archivo `cat data.txt` y filtra todo el texto para solo mostrar la línea que contenga `millionth`, `grep millionth`.

</details>

---

## Bandit8

**Pista:** La contraseña para el siguiente nivel se almacena en el archivo data.txt y es la única línea de texto que aparece solo una vez.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  cat data.txt | sort | uniq -u
  ```

  Organizar las líneas del archivo, para que hagan líneas consecutivas repetidas `sort`, luego con `uniq -u`, elimina todas las líneas consecutivas repetidas y solo muestra las que no tiene repeticiones.

</details>

---

## Bandit9

**Pista:** La contraseña para el siguiente nivel se almacena en el archivo data.txt en una de las pocas cadenas legibles por humanos, precedida por varios caracteres ‘=’.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  cat data.txt | grep -a === | awk 'NF{print $NF}'
  ```

  Filtra por líneas que contengan `===`, pero como el archivo contiene caracteres binarios indicamos al filtrado que queremos procesar todo como texto `grep -a`, y luego obtenemos, solo lo que nos interesa quitando las cosas extras, colocando solo la última palabra de cada línea con una conciencia `awk 'NF{print $NF}'`.

</details>

---

## Bandit10 (contiene clave para el siguiente)

**Pista:** La contraseña para el siguiente nivel se almacena en el archivo data.txt, que contiene datos codificados en base64.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  base64 -d data.txt
  ```

  Utilizamos el comando `base64 -d` para decodificar el archivo `data.txt`.

</details>

<details>
  <summary>Clave para el siguiente</summary>

  ``` bash
  dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr
  ```

</details>

---

## Bandit11 (contiene clave para el siguiente)

**Pista:** La contraseña para el siguiente nivel se almacena en el archivo data.txt, donde todas las letras minúsculas (a-z) y mayúsculas (A-Z) se han rotado 13 posiciones.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  cat data.txt | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'
  ```

  La información de `data.txt` con tr remplaza los caracteres de mayúscula y minúscula, a los mismos caracteres pero rotados 13 veces, como un cifrado cesar, para descifrar en este caso.

</details>

<details>
  <summary>Clave para el siguiente</summary>

  ``` bash
  7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
  ```

</details>

---

## Bandit12

**Pista:** La contraseña para el siguiente nivel está en el archivo data.txt, que es un volcado hexadecimal de un archivo comprimido repetidamente.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  cat data.txt | xxd -r > data_new
  ```

  El contenido del archivo `data.txt` lo redirige al comando `xxd -r` que convierte datos binarios, a un texto decimal legible, y el resultado lo redirige a un nuevo archivo llamado `data_new`.

  Luego te salen puros archivos comprimidos, para descomprimirlos en general sin utilizar la herramienta específica para descomprimir un archivo de cada tipo puedes utilizar:

  ``` bash
  7z x data_new
  ```

  Te sale un nuevo archivo comprimido, y vuelves a repetir el anterior comando para descomprimir, así sucesivamente hasta que te salga el archivo de texto con la clave.

  O Utilizar bash script con un bucle...

</details>

---

## Bandit13

**Pista:** La contraseña para el siguiente nivel se almacena en /etc/bandit_pass/bandit14 y solo puede ser leída por el usuario bandit14. Para este nivel, no se obtiene la siguiente contraseña, sino una clave SSH privada que permite iniciar sesión en el siguiente nivel. Nota: localhost es un nombre de host que se refiere a la máquina en la que se está trabajando.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  chmod 600 bandit14.key
  ssh -i bandit14.key bandit14@bandit.labs.overthewire.org -p 2220
  ```

  Se dan los permisos correspondientes, donde la clave no debe ser accesible para otros, y luego se utiliza el comando ssh todo igual, pero agregando la línea `-i nombre_clave`.

  Ya estarías en el nivel bandit14.

</details>

---

## Bandit14

**Pista:** La contraseña para el siguiente nivel se puede recuperar enviando la contraseña del nivel actual al puerto 30000 en localhost.

<details>
  <summary>Posible solucion</summary>

  Primero buscas la clave, del usuario actual donde se mencionó anteriormente, y la copias:

  ``` bash
  nc localhost 30000
  ```

  Contectando al protocolo `locahost` y puerto `30000`, luego pegas la clave y te pasara la clave, del siguiente nivel.
  
</details>

---

## Bandit15

**Pista:** ...

<details>
  <summary>Posible solucion</summary>

  ``` bash
  ...
  ```

  ...

</details>

---

...

---

> **Autor:** Fravelz
