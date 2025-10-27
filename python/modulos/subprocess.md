# Subprocess en Python

---

## Temario

- [Subprocess en Python](#subprocess-en-python)
  - [Temario](#temario)
  - [¿Qué es subprocess?](#qué-es-subprocess)
  - [1. Diferencias con os.system()](#1-diferencias-con-ossystem)
  - [2. Ejecutar comandos básicos](#2-ejecutar-comandos-básicos)
  - [3. Capturar la salida del comando](#3-capturar-la-salida-del-comando)
    - [Atributos útiles](#atributos-útiles)
  - [4. Manejar errores](#4-manejar-errores)
  - [5. Capturar y procesar salida directamente](#5-capturar-y-procesar-salida-directamente)
  - [6. Enviar entrada al proceso](#6-enviar-entrada-al-proceso)
  - [7. Ejecutar múltiples procesos (encadenados)](#7-ejecutar-múltiples-procesos-encadenados)
  - [8. Popen explicado (modo avanzado)](#8-popen-explicado-modo-avanzado)
  - [9. Ejecutar en segundo plano](#9-ejecutar-en-segundo-plano)
  - [10. Consejos de seguridad](#10-consejos-de-seguridad)
  - [11. Ejemplo práctico: medir tiempo de ejecución](#11-ejemplo-práctico-medir-tiempo-de-ejecución)
  - [12. Ejemplo completo: automatizador de sistema](#12-ejemplo-completo-automatizador-de-sistema)
  - [13. Resumen general](#13-resumen-general)

[Regresar a la Guía Principal](./../../readme.md#5-python)

---

## ¿Qué es subprocess?

`subprocess` (sub-proceso) permite ejecutar **programas externos** o **comandos del sistema operativo** desde Python.

🔹 Ejemplo:

``` python
import subprocess

subprocess.run(["ls"])
```

👉 Ejecuta el comando `ls` (en Linux/Mac) igual que si lo escribieras en la terminal.

---

## 1. Diferencias con os.system()

| Característica             | `os.system()`                  | `subprocess`                    |
| -------------------------- | ------------------------------ | ------------------------------- |
| Devuelve la salida         | ❌ No                           | ✅ Sí                            |
| Control de errores         | ❌ Limitado                     | ✅ Avanzado                      |
| Interactuar con el proceso | ❌ No                           | ✅ Sí                            |
| Seguridad                  | 🚫 Inseguro (interpreta shell) | ✅ Seguro (argumentos separados) |

---

## 2. Ejecutar comandos básicos

``` python
import subprocess

# Forma segura (lista de argumentos)
subprocess.run(["echo", "Hola desde Python!"])
```

También puedes pasar `shell=True` (aunque menos seguro):

``` python
subprocess.run("echo Hola desde Python!", shell=True)
```

---

## 3. Capturar la salida del comando

Para **guardar el texto que produce el comando**, usa `capture_output=True`:

``` python
resultado = subprocess.run(["ls"], capture_output=True, text=True)
print("Salida:", resultado.stdout)
```

### Atributos útiles

- `resultado.stdout` → salida estándar (lo que imprime el comando)
- `resultado.stderr` → errores (si los hay)
- `resultado.returncode` → código de salida (0 = correcto)

---

## 4. Manejar errores

Si quieres que el programa **lance una excepción** cuando el comando falle:

``` python
try:
    subprocess.run(["ls", "/carpeta_que_no_existe"], check=True)
except subprocess.CalledProcessError as e:
    print("Error al ejecutar el comando:", e)
```

---

## 5. Capturar y procesar salida directamente

Si solo necesitas la salida (más cómodo que `.run()`):

``` python
salida = subprocess.check_output(["whoami"], text=True)
print("Usuario actual:", salida.strip())
```

👉 Esto ejecuta el comando y **devuelve la salida como string**.

---

## 6. Enviar entrada al proceso

Puedes **enviar datos** al proceso con `input=`:

``` python
resultado = subprocess.run(
    ["grep", "hola"],
    input="hola mundo\nadiós mundo\n",
    text=True,
    capture_output=True
)
print(resultado.stdout)
```

🔹 Resultado:

``` bash
hola mundo
```

---

## 7. Ejecutar múltiples procesos (encadenados)

Puedes **conectar la salida de un comando a otro** como en una tubería (`|` en la terminal):

``` python
p1 = subprocess.Popen(["ls"], stdout=subprocess.PIPE)
p2 = subprocess.Popen(["grep", "py"], stdin=p1.stdout, stdout=subprocess.PIPE, text=True)

salida, _ = p2.communicate()
print("Archivos .py:\n", salida)
```

👉 Aquí:

- `Popen()` crea procesos manualmente.
- `stdout=subprocess.PIPE` permite conectar procesos.
- `communicate()` espera y obtiene la salida.

---

## 8. Popen explicado (modo avanzado)

`Popen` es la clase base de `subprocess`, te da **control total** sobre el proceso.

``` python
from subprocess import Popen, PIPE

p = Popen(["ping", "-c", "2", "google.com"], stdout=PIPE, stderr=PIPE, text=True)
salida, error = p.communicate()

print("Salida:", salida)
print("Errores:", error)
print("Código de salida:", p.returncode)
```

---

## 9. Ejecutar en segundo plano

Si no quieres que el programa espere:

``` python
subprocess.Popen(["vlc", "video.mp4"])
```

Esto abrirá VLC **sin bloquear** el resto de tu script.

---

## 10. Consejos de seguridad

✅ **Haz esto:**

``` python
subprocess.run(["ls", "/home"])
```

🚫 **Evita esto (riesgo de inyección):**

``` python
subprocess.run("ls /home && rm -rf /", shell=True)
```

Usar `shell=True` puede ejecutar código malicioso si la entrada del usuario no está validada.

---

## 11. Ejemplo práctico: medir tiempo de ejecución

``` python
import subprocess
import time

inicio = time.time()
subprocess.run(["python3", "mi_script.py"])
fin = time.time()

print(f"Tiempo de ejecución: {fin - inicio:.2f} segundos")
```

---

## 12. Ejemplo completo: automatizador de sistema

``` python
import subprocess

comandos = [
    ["sudo", "apt", "update"],
    ["sudo", "apt", "upgrade", "-y"],
    ["sudo", "apt", "autoremove", "-y"]
]

for cmd in comandos:
    print("Ejecutando:", " ".join(cmd))
    resultado = subprocess.run(cmd, capture_output=True, text=True)
    print(resultado.stdout)
```

🧹 Esto ejecuta varios comandos del sistema uno tras otro y muestra su salida.

---

## 13. Resumen general

| Función                     | Qué hace                                 |
| --------------------------- | ---------------------------------------- |
| `subprocess.run()`          | Ejecuta un comando y espera que termine  |
| `subprocess.check_output()` | Devuelve solo la salida                  |
| `subprocess.Popen()`        | Crea un proceso controlado manualmente   |
| `stdout=PIPE`               | Captura la salida estándar               |
| `stderr=PIPE`               | Captura los errores                      |
| `input=`                    | Envía datos al proceso                   |
| `shell=True`                | Ejecuta dentro de un shell (⚠️ inseguro) |
| `check=True`                | Lanza excepción si falla                 |

---

[Regresar a la Guía Principal](./../../readme.md#5-python)

> **Autor:** Fravelz
