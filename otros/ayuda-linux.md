# Obtener ayuda

Tras haber establecido una base sólida sobre la estructura de Linux, sus diversas distribuciones y el propósito del *shell*, estamos listos para poner en práctica estos conocimientos. Es hora de profundizar en el uso de comandos directamente en la terminal y aprender a buscar ayuda cuando nos encontremos con comandos desconocidos.

Siempre nos encontraremos con herramientas cuyos parámetros opcionales desconocemos de memoria o que nunca hemos visto. Por lo tanto, es vital saber cómo podemos familiarizarnos con ellas. Las dos primeras maneras son las páginas de manual y las funciones de ayuda. Siempre es buena idea familiarizarse primero con la herramienta que queremos probar. También aprenderemos algunos trucos con algunas herramientas que creíamos imposibles. En las páginas de manual encontraremos manuales detallados con explicaciones completas.

---

## Temario

- [Obtener ayuda](#obtener-ayuda)
  - [Temario](#temario)
  - [Primer comando](#primer-comando)
  - [Ayuda rápida (`--help` y `-h`)](#ayuda-rápida---help-y--h)
  - [Buscar comandos y documentación relacionada (`apropos`)](#buscar-comandos-y-documentación-relacionada-apropos)
  - [Conclusión](#conclusión)

[Regresar a la guía principal](./../readme.md#temario)

---

## Primer comando

```bash
fravelz@htb[/htb]$ ls
cacert.der  Documents  Music     Public     Videos
Desktop     Downloads  Pictures  Templates
```

El comando `ls` en sistemas Linux y Unix se utiliza para listar los archivos y directorios dentro de la carpeta actual o de cualquier directorio especificado, lo que permite ver su contenido y administrar los archivos de forma más eficaz. Como la mayoría de los comandos de Linux, `ls` incluye opciones y funciones adicionales que ayudan a filtrar o formatear la salida para mostrar exactamente lo que se desea. Para descubrir qué opciones ofrece una herramienta o comando, existen varias maneras de obtener ayuda. Una de ellas es usar el comando `man`, que muestra las páginas del manual de los comandos y proporciona información detallada sobre su uso.

**Sintaxis:**

``` bash
fravelz@htb[/htb]$ man <tool>
```

Veamos un ejemplo y obtengamos ayuda para el comando `ls`:

**Ejemplo:**

``` bash
fravelz@htb[/htb]$ man ls
```

``` bash
LS(1)                            User Commands                           LS(1)

NAME
       ls - list directory contents

SYNOPSIS
       ls [OPTION]... [FILE]...

DESCRIPTION
       List  information  about  the FILEs (the current directory by default).
       Sort entries alphabetically if none of -cftuvSUX nor --sort  is  speci‐
       fied.

       Mandatory  arguments  to  long  options are mandatory for short options
       too.

       -a, --all
              do not ignore entries starting with .

       -A, --almost-all
              do not list implied . and ..

       --author
 Manual page ls(1) line 1 (press h for help or q to quit)
```

Tras ver algunos ejemplos, también podemos consultar rápidamente los parámetros opcionales sin tener que consultar toda la documentación. Disponemos de varias maneras de hacerlo.

---

## Ayuda rápida (`--help` y `-h`)

**Sintaxis:**

```bash
# Obtener ayuda
fravelz@htb[/htb]$ <tool> --help
```

**Ejemplo:**

```bash
# Obtener ayuda
fravelz@htb[/htb]$ ls --help
```

``` bash
Usage: ls [OPTION]... [FILE]...
List information about the FILEs (the current directory by default).
Sort entries alphabetically if none of -cftuvSUX nor --sort is specified.

Mandatory arguments to long options are mandatory for short options too.
  -a, --all                  do not ignore entries starting with .
  -A, --almost-all           do not list implied . and ..
      --author               with -l, print the author of each file
  -b, --escape               print C-style escapes for nongraphic characters
      --block-size=SIZE      with -l, scale sizes by SIZE when printing them;
                             e.g., '--block-size=M'; see SIZE format below

  -B, --ignore-backups       do not list implied entries ending with ~
  -c                         with -lt: sort by, and show, ctime (time of last
                             modification of file status information);
                             with -l: show ctime and sort by name;
                             otherwise: sort by ctime, newest first

  -C                         list entries by columns
<SNIP>
```

Algunas herramientas proporcionan una versión corta de ayuda usando `-h` en lugar de `--help`:

**Sintaxis:**

``` bash
# Obtener ayuda
fravelz@htb[/htb]$ <tool> -h
```

**Ejemplo:**

``` bash
fravelz@htb[/htb]$ curl -h
```

``` bash
Usage: curl [options...] <url>
     --abstract-unix-socket <path> Connect via abstract Unix domain socket
     --anyauth       Pick any authentication method
 -a, --append        Append to target file when uploading
     --basic         Use HTTP Basic Authentication
     --cacert <file> CA certificate to verify peer against
     --capath <dir>  CA directory to verify peer against
 -E, --cert <certificate[:password]> Client certificate file and password
<SNIP>
```

Como podemos ver, los resultados no difieren mucho en este ejemplo: `man` ofrece la documentación completa y `--help`/`-h` suele dar un resumen rápido y práctico.

---

## Buscar comandos y documentación relacionada (`apropos`)

Otra herramienta útil al principio es `apropos`. Cada página del manual incluye una breve descripción. Esta herramienta busca en las descripciones instancias de una palabra clave determinada.

**Sintaxis:**

``` bash
# Obtener ayuda
fravelz@htb[/htb]$ apropos <keyword>
```

**Ejemplo:**

``` bash
# Obtener ayuda
fravelz@htb[/htb]$ apropos sudo
```

``` bash
sudo (8)             - execute a command as another user
sudo.conf (5)        - configuration for sudo front end
sudo_plugin (8)      - Sudo Plugin API
sudo_root (8)        - How to run administrative commands
sudoedit (8)         - execute a command as another user
sudoers (5)          - default sudo security policy plugin
sudoreplay (8)       - replay sudo session logs
visudo (8)           - edit the sudoers file
```

Otro recurso útil cuando tenemos problemas para entender un comando largo es: [https://explainshell.com/](https://explainshell.com/)

---

## Conclusión

A continuación cubriremos una gran cantidad de comandos, muchos de los cuales pueden ser nuevos para usted. Sin embargo, ahora sabe cómo buscar ayuda con cualquier comando que no conozca o con el que no esté seguro de sus opciones. Además, le animamos a explorar su curiosidad y a dedicar el tiempo que necesite para experimentar con las herramientas presentadas. Siempre será tiempo bien invertido.

[Regresar a la guía principal](./../readme.md#temario)

> **Autor:** Fravelz  
> **Colaborador:** @studentethical (Student Ethical)
