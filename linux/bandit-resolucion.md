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
  - [Bandit15 (contiene clave para el siguiente)](#bandit15-contiene-clave-para-el-siguiente)
  - [Bandit16](#bandit16)
  - [Bandit17](#bandit17)
  - [Bandit18](#bandit18)
  - [Bandit19 (contiene clave para el siguiente)](#bandit19-contiene-clave-para-el-siguiente)
  - [Bandit20](#bandit20)
  - [Bandit21](#bandit21)
  - [Bandit22](#bandit22)
  - [Bandit23 (contiene clave para el siguiente)](#bandit23-contiene-clave-para-el-siguiente)
  - [Bandit24](#bandit24)
  - [Bandit25](#bandit25)
  - [Bandit26](#bandit26)
  - [Bandit27 (contiene clave propia)](#bandit27-contiene-clave-propia)
  - [Bandit28](#bandit28)
  - [Bandit29](#bandit29)
  - [Bandit30](#bandit30)
  - [Bandit31](#bandit31)
  - [Bandit32](#bandit32)

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

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
| bandit7 a bandit9   | fácil, filtrado de texto en archivos            |
| bandit10 a bandit13 | fácil-intermedio, decodificación                |
| bandit14 a ...      | fácil-intermedio, redes                         |
| ...                 | ...                                             |

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

  Se dan los permisos correspondientes, donde la clave solo pueda ser leída, y manipulada por el usuario, y luego se utiliza el comando ssh todo igual, pero agregando la línea `-i nombre_clave`.

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

  Conectando al protocolo `locahost` y puerto `30000`, luego pegas la clave y te pasara la clave, del siguiente nivel.
  
</details>

---

## Bandit15 (contiene clave para el siguiente)

**Pista:** La contraseña del siguiente nivel se puede recuperar enviando la contraseña del nivel actual al puerto 30001 del host local mediante cifrado SSL/TLS.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  ncat --ssl 127.0.0.1 30001
  ```

  Y pegas la clave del usuario actual, te dará la clave para el siguiente.

  ...

</details>

<details>
  <summary>Clave para el siguiente</summary>

  ``` bash
  kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx
  ```

</details>

---

## Bandit16

**Pista:** Las credenciales para el siguiente nivel se pueden recuperar mediante la presentación de la Contraseña del nivel actual a un puerto en localhost en el rango 31000 a 32000. Primero averigüe cuál de estos puertos tiene un servidor Escuchándolos. A continuación, averigüe cuáles de ellos hablan SSL/TLS y cuáles No lo hagas. Solo hay 1 servidor que dará las siguientes credenciales, el Otros simplemente te enviarán lo que sea que le envíes.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  nmap --open -T5 -v -n -p31000-32000 127.0.0.1
  ```

  Por el protocolo tcp, buscar puertos abiertos (`nmap --open`), controlar el temporizador y rendimiento del escaneo `-T5` existen (`-T0` lento, pero revisa bien, hasta, `-T5` rápido para el escaneo) `-v` modo verbose que sirve para que vaya mostrando el resultado antes de mostrar todo por consola, `-n` para no aplicar resolución dns, `-p31000-32000` el rango, y el `127.0.0.1` es el puerto.
  
  ``` bash
  ncat --ssl 127.0.0.1 <puerto>
  ```

  Para conectarse con cifrado a dicho puertos, pegando la clave, y alguno de ellos dará la clave para el siguiente nivel.

</details>

---

## Bandit17

**Pista:** En el directorio principal hay dos archivos: passwords.old y passwords.new. La contraseña para el siguiente nivel se encuentra en passwords.new y es la única línea que ha cambiado entre passwords.old y passwords.new.

**NOTA:** Si has resuelto este nivel y ves «¡Adiós!» al intentar iniciar sesión en bandit18, esto se debe al siguiente nivel, bandit19.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  diff passwords.old passwords.new
  ```

  Muestra las diferencias entre los dos archivos.

</details>

---

## Bandit18

**Pista:** La contraseña para el siguiente nivel se almacena en un archivo "readme" en el directorio personal. Lamentablemente, alguien modificó .bashrc para cerrar sesión al iniciar sesión con SSH.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  entrar al con ssh pero agregando al final bash para ejecutar la terminal bash
  ```

  Esto es como una especie de inyección de código antes que se ejecute el .bashrc

</details>

---

## Bandit19 (contiene clave para el siguiente)

**Pista:** Para acceder al siguiente nivel, debes usar el binario setuid en tu directorio personal. Ejecútalo sin argumentos para ver cómo usarlo. La contraseña para este nivel se encuentra en la ubicación habitual (/etc/bandit_pass), después de haber usado el binario setuid.

<details>
  <summary>Posible solucion</summary>

  ``` bash
  entrar al con ssh pero agregando al final bash para ejecutar la terminal bash
  ```

  Esto es como una especie de inyección de código antes que se ejecute el .bashrc, y leer el `readme`.

</details>

<details>
  <summary>Clave para el siguiente</summary>

  ``` bash
  0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO
  ```

</details>

---

## Bandit20

**Pista:** En el directorio personal hay un binario setuid que realiza lo siguiente: se conecta a localhost en el puerto que especifiques como argumento de línea de comandos. Luego, lee una línea de texto de la conexión y la compara con la contraseña del nivel anterior (bandit20). Si la contraseña es correcta, transmite la contraseña del siguiente nivel (bandit21).

**NOTA:** Intenta conectarte a tu propio demonio de red para comprobar si funciona como esperas.

<details>
  <summary>Posible solucion</summary>

  Abres 2 terminales.

  ``` bash
  ./archivo
  ```

  En una ejecutas el archivo y en la otra ejecutas el comando para abrir un puerto con el comando nc y envías la clave anterior en este comando.

  ``` bash
  nc -nlvp 1234
  ```

  Te debería devolver el archivo donde ejecutaste esta clave.

</details>

---

## Bandit21

**Pista:** Un programa se ejecuta automáticamente a intervalos regulares mediante cron, el programador de tareas basado en tiempo. Consulte el archivo /etc/cron.d/ para ver la configuración y comprobar qué comando se está ejecutando.

<details>
  <summary>Posible solucion</summary>

  Entrar al directorio, ver el código de los archivos y ver el archivo relacionado con el siguiente nivel, dentro de ese archivo hay un script, ver el script y verás que ese script copia la clave de un archivo que no tienes permisos para leer a otro que sí.

</details>

---

## Bandit22

**Pista:** Un programa se ejecuta automáticamente a intervalos regulares mediante cron, el programador de tareas basado en tiempo. Consulte el archivo /etc/cron.d/ para ver la configuración y el comando que se está ejecutando.

**NOTA:** Analizar scripts de shell escritos por otros es una habilidad muy útil. El script de este nivel está diseñado para ser fácil de leer. Si tiene problemas para comprender su funcionamiento, intente ejecutarlo para ver la información de depuración que muestra.

<details>
  <summary>Posible solucion</summary>
  Lo mismo que el anterior nivel, pero jugar un poco con bash, y donde esta la variable del usuario colocar el usuario futuro que es bandit23.
</details>

---

## Bandit23 (contiene clave para el siguiente)

**Pista:** Un programa se ejecuta automáticamente a intervalos regulares mediante cron, el programador de tareas basado en tiempo. Consulta el archivo /etc/cron.d/ para ver la configuración y el comando que se está ejecutando.

**NOTA:** Este nivel requiere que crees tu primer script de shell. ¡Es un gran paso y deberías sentirte orgulloso/a cuando lo logres!

**NOTA 2:** Ten en cuenta que tu script de shell se elimina una vez ejecutado, así que quizá quieras guardar una copia.

<details>
  <summary>Posible solucion</summary>

  Analizar el script del usuario, y crear un archivo en una ruta temporal `mktemp -p`, y copiarla donde el script ejecuta los archivos.

</details>

<details>
  <summary>Clave para el siguiente</summary>

  ``` bash
  gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8
  ```

</details>

---

## Bandit24

**Pista:** Un demonio está escuchando en el puerto 30002 y te proporcionará la contraseña de bandit25 si le das la contraseña de bandit24 y un código PIN secreto de 4 dígitos. No hay forma de obtener el código PIN excepto probando las 10 000 combinaciones posibles, un método conocido como fuerza bruta.

No necesitas crear nuevas conexiones cada vez.

<details>
  <summary>Posible solucion</summary>

  crear un bucle para hacer todas las combinaciones posibles y redirigirlas a un archivo, el archivo (en directorio temporar) lo rediriges, a `nc` utilizando la informacion dada, y filtrar para eliminar las opciones que tengan `Wrong`.

</details>

[Web para practicar expresiones tareas Cron](https://www.site24x7.com/es/tools/crontab/cron-generator.html)

---

## Bandit25

**Pista:** Iniciar sesión en bandit26 desde bandit25 debería ser bastante sencillo… El shell del usuario bandit26 no es /bin/bash, sino otro. Averigua cuál es, cómo funciona y cómo salir de él.

NOTA: Si eres usuario de Windows y normalmente usas PowerShell para conectarte por SSH a bandit, ten en cuenta que PowerShell suele causar problemas con la solución propuesta para este nivel. Deberías usar la línea de comandos.

<details>
  <summary>Posible solucion</summary>

  Entrar en el modo visual del archivo more, que se ejecuta y con `:set shell=/bin/bash` y `:shell` obtener la shell.

</details>

---

## Bandit26

**Pista:** ¡Buen trabajo consiguiendo una shell! ¡Ahora date prisa y consigue la contraseña para bandit27!

<details>
  <summary>Posible solucion</summary>

  el nivel es similar a uno en el pasado, pero ahora busca utilizar `cat` directamente.

</details>

---

## Bandit27 (contiene clave propia)

**Pista:** Existe un repositorio Git en `ssh://bandit27-git@bandit.labs.overthewire.org/home/bandit27-git/repo` a través del puerto 2220. La contraseña del usuario bandit27-git es la misma que la del usuario bandit27.

Clona el repositorio y busca la contraseña para el siguiente nivel.

``` bash
ssh://bandit27-git@bandit.labs.overthewire.org:2220/home/bandit27-git/repo
```

<details>
  <summary>Posible solucion</summary>

  Puede que la conexión no funcione desde la terminal de bandit en el formato `protocolo://usuario@url:puerto/ruta`, tienes que clonar en un terminal personal, y luego colocar la clave del nivel actual, luego en el archivo readme estará la clave del siguiente nivel.

</details>

<details>
  <summary>Clave Propia</summary>

  ``` bash
  upsNCc7vzaRDx6oZC6GiR6ERwe1MowGB
  ```

</details>

---

## Bandit28

**Pista:** Existe un repositorio Git en ssh://bandit28-git@bandit.labs.overthewire.org/home/bandit28-git/repo a través del puerto 2220. La contraseña del usuario bandit28-git es la misma que la del usuario bandit28.

Clona el repositorio y busca la contraseña para el siguiente nivel.

``` bash
ssh://bandit28-git@bandit.labs.overthewire.org/home/bandit28-git/repo
```

<details>
  <summary>Posible solucion</summary>

  Clonar repo, colocar la clave, y revisar commits pasados.

  Comandos importantes:

  ``` bash
  git log
  git show <identificador>
  ```

</details>

---

## Bandit29

**Pista:** Existe un repositorio Git en ssh://bandit29-git@bandit.labs.overthewire.org/home/bandit29-git/repo a través del puerto 2220. La contraseña del usuario bandit29-git es la misma que la del usuario bandit29.

Clona el repositorio y busca la contraseña para el siguiente nivel.

``` bash
ssh://bandit29-git@bandit.labs.overthewire.org/home/bandit29-git/repo
```

<details>
  <summary>Posible solucion</summary>

  Buscar ramas, y mirar ramas según el enunciado, viendo el archivo readme.

  Comandos importantes:

  ``` bash
  git branch
  git switch <rama>
  ```

</details>

---

## Bandit30

**Pista:** Existe un repositorio Git en ssh://bandit30-git@bandit.labs.overthewire.org/home/bandit30-git/repo a través del puerto 2220. La contraseña del usuario bandit30-git es la misma que la del usuario bandit30.

Clona el repositorio y busca la contraseña para el siguiente nivel.

``` bash
ssh://bandit30-git@bandit.labs.overthewire.org/home/bandit30-git/repo
```

<details>
  <summary>Posible solucion</summary>

  Comandos importantes:

  ``` bash
  git tag
  git show <tag>
  ```

</details>

---

## Bandit31

**Pista:** Hay un repositorio de gits en ssh://bandit31-git@bandit.labs.overthewire.org/home/bandit31-git/repo Vía el puerto 2220. La contraseña para el usuario bandit31-gitEs lo mismo que para el usuario bandit31.

Clone el repositorio y busque la contraseña para el siguiente nivel.

``` bash
ssh://bandit31-git@bandit.labs.overthewire.org/home/bandit31-git/repo
```

<details>
  <summary>Posible solucion</summary>

  Seguir los pasos dados en el archivo del repositorio.

</details>

---

## Bandit32

**Pista:** Después de todo este rollo de Git, es hora de otra escapada. ¡Buena suerte!

``` bash
ssh://bandit31-git@bandit.labs.overthewire.org/home/bandit31-git/repo
```

<details>
  <summary>Posible solucion</summary>
  Entrar con ssh como normalmente, y conseguir una terminal shell con `$0` y luego una bash `bash`.

  Fin de los niveles actualmente.

</details>

---

[Regresar a la guía principal](./../readme.md#2-linux-y-bash-script)

> **Autor:** Fravelz
