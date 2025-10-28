# Request en Python

## Temario

- [Request en Python](#request-en-python)
  - [Temario](#temario)
  - [1) ¿Qué es requests?](#1-qué-es-requests)
  - [2) Instalación y configuración básica](#2-instalación-y-configuración-básica)
  - [3) Uso básico — Peticiones HTTP](#3-uso-básico--peticiones-http)
    - [GET](#get)
    - [POST](#post)
    - [Otros métodos](#otros-métodos)
  - [4) Elementos importantes de la respuesta (Response)](#4-elementos-importantes-de-la-respuesta-response)
  - [5) Parámetros útiles en la petición](#5-parámetros-útiles-en-la-petición)
  - [6) Sesiones (requests.Session)](#6-sesiones-requestssession)
  - [7) Autenticación, SSL y proxies](#7-autenticación-ssl-y-proxies)
  - [8) Manejo de errores y excepciones](#8-manejo-de-errores-y-excepciones)
  - [9) Ejemplos completos](#9-ejemplos-completos)
    - [a) Petición GET con parámetros](#a-petición-get-con-parámetros)
    - [b) Petición POST con JSON](#b-petición-post-con-json)
    - [c) Uso de sesión con cookies](#c-uso-de-sesión-con-cookies)
    - [d) Descarga de archivo por streaming](#d-descarga-de-archivo-por-streaming)
  - [10) Buenas prácticas y consideraciones](#10-buenas-prácticas-y-consideraciones)
  - [11) Resumen rápido](#11-resumen-rápido)

[Regresar a la Guía Principal](./../../readme.md#5-python)

---

## 1) ¿Qué es requests?

- `requests` es una biblioteca de Python de terceros para realizar **solicitudes HTTP/HTTPS** de forma sencilla y elegante.

- No viene incluida en la librería estándar de Python, por lo que debe instalarse con `pip install requests`.

- Permite hacer peticiones como GET, POST, PUT, DELETE, HEAD, PATCH, etc., y gestionar cabeceras, datos, autenticación, cookies, sesiones, entre otros.

- Es muy usada para acceder a APIs web, hacer scraping ligero, o interaccionar con servicios HTTP.

---

## 2) Instalación y configuración básica

``` bash
pip install requests
```

Luego en tu script:

``` python
import requests
```

Asegúrate de que la versión de Python sea compatible (por ejemplo Python 3.8+ según su documentación).

*Tip:* Usa un entorno virtual (`venv`) para instalarla sin afectar dependencias globales.

---

## 3) Uso básico — Peticiones HTTP

### GET

``` python
import requests

response = requests.get("https://api.example.com/data")
print(response.status_code)        # código de estado HTTP
print(response.text)               # contenido como texto
print(response.json())             # si es JSON, lo transforma en dict/list
```

### POST

Enviar datos:

``` python
payload = {"username": "usuario", "password": "secreto"}
response = requests.post("https://api.example.com/login", data=payload)
```

Enviar JSON:

``` python
response = requests.post("https://api.example.com/login", json=payload)
```

### Otros métodos

También puedes usar `requests.put()`, `requests.delete()`, `requests.head()`, `requests.patch()`.

---

## 4) Elementos importantes de la respuesta (Response)

Al hacer una petición, obtienes un objeto `Response`. Algunos atributos y métodos clave:

- `response.status_code` → código de estado HTTP (200, 404, 500, etc.).

- `response.text` → contenido decodificado como texto (string).

- `response.content` → contenido en bytes.

- `response.json()` → interpreta el contenido como JSON y devuelve dict o lista (si aplica).

- `response.headers` → diccionario con cabeceras HTTP de la respuesta.

- `response.elapsed` → tiempo que tardó la petición.

- `response.raise_for_status()` → lanza excepción `requests.exceptions.HTTPError` si el código de estado indica error (>=400).

---

## 5) Parámetros útiles en la petición

Al llamar a `requests.get()` o `requests.post()` puedes pasar varios parámetros adicionales para mayor control:

| Parámetro         | Uso                                                                                        |
| ----------------- | ------------------------------------------------------------------------------------------ |
| `params`          | Diccionario para cadena de consulta (query string) en GET.                                 |
| `data`            | Datos de formulario en POST/PUT.                                                           |
| `json`            | Datos JSON en cuerpo de solicitud (POST/PUT).                                              |
| `headers`         | Diccionario de cabeceras HTTP.                                                             |
| `cookies`         | Diccionario de cookies para enviar.                                                        |
| `timeout`         | Tiempo máximo de espera (segundos) para la respuesta.                                      |
| `verify`          | Verificación del certificado SSL (True/False o ruta de certificado).|
| `auth`            | Autenticación básica/digest; por ejemplo `auth=('user','pass')`.                           |
| `proxies`         | Para usar proxies HTTP/HTTPS.                                                              |
| `stream`          | Si quieres descargar contenido por streaming (útil para archivos grandes).                 |
| `allow_redirects` | Si permites redirecciones automáticas (por defecto True para GET).                         |

---

## 6) Sesiones (requests.Session)

Una característica potente: puedes crear un objeto `Session` para persistir ciertas opciones (como cookies, cabeceras comunes, autenticación) entre múltiples peticiones. Mejora el rendimiento al reutilizar conexiones. Ejemplo:

``` python
import requests

s = requests.Session()
s.headers.update({"User-Agent": "MiApp/1.0"})
response1 = s.get("https://api.example.com/resource1")
response2 = s.get("https://api.example.com/resource2")
```

---

## 7) Autenticación, SSL y proxies

- Autenticación básica: `requests.get(url, auth=('user','pass'))`.

- Verificación SSL: por defecto `verify=True`. Si el servidor tiene certificado inválido, se puede poner `verify=False` **pero no recomendado en producción**.

- Puedes especificar proxies para HTTP/HTTPS usando el parámetro `proxies`.

---

## 8) Manejo de errores y excepciones

Es importante manejar posibles fallos (timeout, conexión rechazada, etc.). Ejemplo:

``` python
import requests

try:
    response = requests.get("https://api.example.com", timeout=5)
    response.raise_for_status()
except requests.exceptions.HTTPError as errh:
    print("HTTP Error:", errh)
except requests.exceptions.ConnectionError as errc:
    print("Error de conexión:", errc)
except requests.exceptions.Timeout as errt:
    print("Timeout:", errt)
except requests.exceptions.RequestException as err:
    print("Otro error:", err)
```

Este patrón aparece en tutoriales de `requests`.

---

## 9) Ejemplos completos

### a) Petición GET con parámetros

``` python
import requests

url = "https://httpbin.org/get"
params = {"q": "python", "page": 1}
response = requests.get(url, params=params)
print(response.url)       # muestra la URL final con query string
print(response.status_code)
print(response.json())
```

### b) Petición POST con JSON

``` python
import requests

url = "https://httpbin.org/post"
payload = {"username": "user", "password": "pass"}
response = requests.post(url, json=payload)
print(response.status_code)
print(response.json())
```

### c) Uso de sesión con cookies

``` python
import requests

s = requests.Session()
s.get("https://httpbin.org/cookies/set/sessioncookie/12345")
response = s.get("https://httpbin.org/cookies")
print(response.text)  # Verás que la cookie se mantiene
```

### d) Descarga de archivo por streaming

``` python
import requests

url = "https://example.com/largefile.zip"
with requests.get(url, stream=True) as r:
    r.raise_for_status()
    with open("largefile.zip", "wb") as f:
        for chunk in r.iter_content(chunk_size=8192):
            f.write(chunk)
```

---

## 10) Buenas prácticas y consideraciones

- Siempre establece un `timeout` razonable para evitar que la petición quede colgada.

- No deshabilites `verify=True` en producción a menos que sepas lo que haces (evita usar `verify=False`).

- Para muchas peticiones al mismo host, utiliza `Session` para aprovechar persistencia de conexión.

- Verifica el estado de la respuesta (`status_code`, `raise_for_status()`) antes de procesar los datos.

- Cuando trabajes con APIs, respeta los límites de rate-limit, y maneja redirecciones, errores, retries.

- Evita exponer en el código credenciales sin protección.

- Si haces scraping de páginas web, respeta los términos de uso del sitio, usa cabeceras `User-Agent` adecuadas y considera la ética/legales.

---

## 11) Resumen rápido

- Librería simple, pero potente para hacer peticiones HTTP en Python.

- Abstrae complejidad de `urllib` y hace que el código sea más legible.

- Utilizada ampliamente para trabajar con APIs, servicios web, scraping ligero.

- Soporta múltiples métodos HTTP, sesiones, autenticación, verificación SSL, proxies.

- Debes instalarla aparte y aplicarla con buenas prácticas.

---

[Regresar a la Guía Principal](./../../readme.md#5-python)

> **Autor:** Fravelz
