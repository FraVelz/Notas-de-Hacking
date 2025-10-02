
## 3. Comandos de red

El conocimiento de red es vital en hacking.
Estos comandos sirven para **analizar, escanear o diagnosticar conexiones.**

| Comando             | Descripción                                   | Ejemplo                            |
| ------------------- | --------------------------------------------- | ---------------------------------- |
| `ifconfig` o `ip a` | Muestra interfaces de red.                    | `ip a`                             |
| `ping`              | Verifica conexión a un host.                  | `ping 8.8.8.8`                     |
| `traceroute`        | Muestra la ruta que siguen los paquetes.      | `traceroute google.com`            |
| `netstat` o `ss`    | Muestra conexiones de red y puertos abiertos. | `netstat -tuln`                    |
| `nslookup`          | Consulta información DNS.                     | `nslookup example.com`             |
| `dig`               | Consulta avanzada DNS.                        | `dig example.com ANY`              |
| `curl`              | Realiza peticiones HTTP.                      | `curl http://example.com`          |
| `wget`              | Descarga archivos de la web.                  | `wget http://example.com/file.zip` |
| `nmap`              | Escanea puertos y servicios.                  | `nmap -sV 192.168.1.1`             |
| `tcpdump`           | Captura paquetes de red.                      | `tcpdump -i eth0`                  |

**Ejemplo práctico:**

```bash
nmap -A 192.168.1.10
```

→ Escanea la IP 192.168.1.10 mostrando sistema operativo, servicios y versiones.

---

## 4. Scripting básico en Bash

Los **scripts Bash** permiten **automatizar tareas** (como escaneos, limpieza, copias, etc).
Un hacker los usa para ejecutar comandos en secuencia o automatizar ataques.

### Ejemplo simple

**archivo:** `scan.sh`

```bash
#!/bin/bash
echo "Escaneando la red..."
nmap -sP 192.168.1.0/24
```

Luego se le da permiso:

```bash
chmod +x scan.sh
./scan.sh
```

### Ejemplo más avanzado

**Brute force simple (educativo):**

```bash
#!/bin/bash
for pass in $(cat passwords.txt); do
    echo "Probando contraseña: $pass"
    ssh usuario@192.168.1.5 "exit" &> /dev/null
done
```

*Nunca usar contra sistemas sin permiso.*

---

## 5. Distribuciones de Linux para hacking

Las más usadas por pentesters y hackers éticos:

| Distribución              | Descripción                                                                                              |
| ------------------------- | -------------------------------------------------------------------------------------------------------- |
| **Kali Linux**         | La más popular. Incluye cientos de herramientas preinstaladas (Nmap, Metasploit, BurpSuite, Wireshark…). |
| **Parrot OS Security** | Similar a Kali, pero más ligera y enfocada también en anonimato.                                         |
| **BlackArch**          | Distribución basada en Arch Linux con más de 2.000 herramientas. Ideal para usuarios avanzados.          |

---

## Recomendación final de aprendizaje

| Nivel         | Tema                | Práctica sugerida                                      |
| ------------- | ------------------- | ------------------------------------------------------ |
| Básico.       | Comandos y permisos | Crear archivos, cambiar permisos, navegar directorios. |
| Intermedio.   | Redes               | Usar `nmap`, `ping`, `netstat`, `curl`.                |
| Avanzado.     | Scripting Bash      | Automatizar escaneos o tareas con scripts propios.     |

---

¿Quieres que te prepare un **temario paso a paso de “Linux para hacking”**, dividido por niveles (básico, intermedio y avanzado), con ejercicios prácticos para cada sección?
Así podrías dominar Linux mientras te preparas para pentesting.

---