# Python

---

## Temario

- [Python](#python)
  - [Temario](#temario)
  - [Resumen](#resumen)
  - [️TCP (Transmission Control Protocol)](#️tcp-transmission-control-protocol)
    - [Servidor TCP](#servidor-tcp)
    - [Cliente TCP](#cliente-tcp)
  - [UDP (User Datagram Protocol)](#udp-user-datagram-protocol)
    - [Servidor UDP](#servidor-udp)
    - [Cliente UDP](#cliente-udp)
  - [Diferencias rápidas](#diferencias-rápidas)

[Regresar a la Guía Principal](./../../readme.md#5-python)

---

## Resumen

Los **sockets** permiten la **comunicación entre computadoras o procesos** a través de una red (como Internet o una LAN).

Python ofrece el módulo `socket` para manejar conexiones **TCP** (orientadas a conexión) y **UDP** (sin conexión).

---

## ️TCP (Transmission Control Protocol)

- Conexión establecida entre cliente y servidor (3-way handshake).
- Garantiza entrega, orden y fiabilidad.
- Ideal para chats, transferencias, HTTP, etc.

### Servidor TCP

``` python
# servidor_tcp.py
import socket

HOST = '127.0.0.1'   # Dirección local
PORT = 5000          # Puerto del servidor

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))     # Asociar dirección y puerto
    s.listen()               # Escuchar conexiones
    print("Servidor TCP esperando conexión...")
    conn, addr = s.accept()  # Aceptar cliente
    with conn:
        print("Conectado a:", addr)
        while True:
            data = conn.recv(1024)      # Recibir datos
            if not data:
                break
            print("Cliente dice:", data.decode())
            conn.sendall(b"Mensaje recibido")
```

### Cliente TCP

``` python
# cliente_tcp.py
import socket

HOST = '127.0.0.1'
PORT = 5000

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST, PORT))
    s.sendall(b"Hola servidor TCP")
    data = s.recv(1024)
    print("Servidor responde:", data.decode())
```

---

## UDP (User Datagram Protocol)

- No hay conexión, se envían “paquetes” sin confirmar recepción.
- Más rápido pero menos confiable.
- Ideal para streaming, juegos, mensajes cortos.

### Servidor UDP

``` python
# servidor_udp.py
import socket

HOST = '127.0.0.1'
PORT = 6000

with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as s:
    s.bind((HOST, PORT))
    print("Servidor UDP esperando mensajes...")
    while True:
        data, addr = s.recvfrom(1024)
        print("Mensaje de", addr, ":", data.decode())
        s.sendto(b"Mensaje recibido", addr)
```

### Cliente UDP

``` python
# cliente_udp.py
import socket

HOST = '127.0.0.1'
PORT = 6000

with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as s:
    s.sendto(b"Hola servidor UDP", (HOST, PORT))
    data, _ = s.recvfrom(1024)
    print("Servidor responde:", data.decode())
```

---

## Diferencias rápidas

| Protocolo | Conexión | Fiabilidad | Velocidad | Uso típico              |
| --------- | -------- | ---------- | --------- | ----------------------- |
| TCP       | Sí       | Alta       | Media     | Web, chat, FTP          |
| UDP       | No       | Baja       | Alta      | Juegos, streaming, VoIP |

---

[Regresar a la Guía Principal](./../../readme.md#5-python)

> **Autor:** Fravelz
