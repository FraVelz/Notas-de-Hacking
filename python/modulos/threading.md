# Threading en Python

---

## Temario

- [Threading en Python](#threading-en-python)
  - [Temario](#temario)
  - [1) ¿Qué es threading?](#1-qué-es-threading)
  - [2) Conceptos clave](#2-conceptos-clave)
  - [3) Crear y usar hilos — ejemplos básicos](#3-crear-y-usar-hilos--ejemplos-básicos)
    - [a) Usando Thread con target](#a-usando-thread-con-target)
    - [b) Subclassing lhread](#b-subclassing-lhread)
  - [4) Daemon threads y uso correcto](#4-daemon-threads-y-uso-correcto)
  - [5) Sincronización — primitivas importantes](#5-sincronización--primitivas-importantes)
    - [Lock (mutual exclusion)](#lock-mutual-exclusion)
    - [RLock (reentrant lock) — permite re-entradas desde mismo hilo](#rlock-reentrant-lock--permite-re-entradas-desde-mismo-hilo)
    - [Event — señalización simple (flag)](#event--señalización-simple-flag)
    - [Condition — esperas con notificación](#condition--esperas-con-notificación)
    - [Semaphore — contador](#semaphore--contador)
    - [Barrier — sincronizar N hilos en un punto](#barrier--sincronizar-n-hilos-en-un-punto)
  - [6) Comunicación segura entre hilos: queue.Queue](#6-comunicación-segura-entre-hilos-queuequeue)
  - [7) Manejo de excepciones en hilos](#7-manejo-de-excepciones-en-hilos)
  - [8) ThreadPoolExecutor (alta abstracción)](#8-threadpoolexecutor-alta-abstracción)
  - [9) GIL — cuándo usar threading vs multiprocessing](#9-gil--cuándo-usar-threading-vs-multiprocessing)
  - [10) Operaciones atómicas y seguridad](#10-operaciones-atómicas-y-seguridad)
  - [11) Cancelación y parada de hilos](#11-cancelación-y-parada-de-hilos)
  - [12) Thread-local storage](#12-thread-local-storage)
  - [13) Debugging y utilidades](#13-debugging-y-utilidades)
  - [14) Buenas prácticas](#14-buenas-prácticas)
  - [15) Ejemplos prácticos (útiles)](#15-ejemplos-prácticos-útiles)
    - [a) Producer-consumer con Queue (resumen)](#a-producer-consumer-con-queue-resumen)
    - [b) Pool de threads simple con Thread y Queue](#b-pool-de-threads-simple-con-thread-y-queue)
    - [c) Uso real con requests (I/O-bound)](#c-uso-real-con-requests-io-bound)
  - [16) Limitaciones y alternativas](#16-limitaciones-y-alternativas)
  - [17) Resumen](#17-resumen)

[Regresar a la Guía Principal](./../readme.md#5-python)

---

## 1) ¿Qué es threading?

`threading` es el módulo estándar de Python para **concurrencia mediante hilos** (threads). Permite ejecutar varias tareas aparentemente al mismo tiempo dentro del mismo proceso. Es ideal para operaciones **I/O-bound** (espera de red, disco, etc.).
Importarlo:

``` python
import threading
```

---

## 2) Conceptos clave

- **Thread (hilo):** unidad de ejecución.
- **Daemon thread:** hilo que no impide que el proceso termine; se mata cuando el programa principal acaba.
- **GIL (Global Interpreter Lock):** en CPython, impide que varios hilos ejecuten bytecode Python al mismo tiempo — eso limita el paralelismo real para tareas CPU-bound.
- **Race condition:** condición de carrera cuando varios hilos acceden/actualizan recursos compartidos sin sincronización.
- **Thread-safe:** código que puede ejecutarse en varios hilos sin errores por concurrencia.

---

## 3) Crear y usar hilos — ejemplos básicos

### a) Usando Thread con target

``` python
import threading
import time

def worker(n):
    print(f"Worker {n} empieza")
    time.sleep(1)
    print(f"Worker {n} termina")

threads = []
for i in range(3):
    t = threading.Thread(target=worker, args=(i,), name=f"worker-{i}")
    t.start()
    threads.append(t)

for t in threads:
    t.join()  # esperar que termine cada hilo

print("Todos terminados")
```

### b) Subclassing lhread

``` python
import threading, time

class MiHilo(threading.Thread):
    def __init__(self, n):
        super().__init__(name=f"MiHilo-{n}")
        self.n = n

    def run(self):
        print(f"{self.name} comenzar")
        time.sleep(1)
        print(f"{self.name} terminar")

h = MiHilo(1)
h.start()
h.join()
```

---

## 4) Daemon threads y uso correcto

``` python
t = threading.Thread(target=worker, args=(1,), daemon=True)
t.start()
# Si el main thread termina, el hilo daemon se termina abruptamente.
```

Usa daemon para tareas de fondo opcionales (logs en tiempo real, watchers). Para trabajo crítico, **no** uses daemon; asegúrate de `join()`.

---

## 5) Sincronización — primitivas importantes

### Lock (mutual exclusion)

``` python
lock = threading.Lock()
with lock:
    # región crítica
    pass
```

### RLock (reentrant lock) — permite re-entradas desde mismo hilo

``` python
rlock = threading.RLock()
```

### Event — señalización simple (flag)

``` python
event = threading.Event()

# hilo espera:
event.wait()  # bloquea hasta que event.set()
# hilo que despierta:
event.set()
```

### Condition — esperas con notificación

``` python
cond = threading.Condition()
with cond:
    cond.wait()  # espera notificación
    # otro hilo:
    cond.notify()
```

### Semaphore — contador

``` python
sem = threading.Semaphore(3)  # máximo 3 entradas simultáneas
with sem:
    # acceso limitado
    pass
```

### Barrier — sincronizar N hilos en un punto

``` python
bar = threading.Barrier(3)
bar.wait()  # todos los hilos esperan aquí hasta que lleguen los 3
```

---

## 6) Comunicación segura entre hilos: queue.Queue

`queue.Queue` es **thread-safe** y la forma recomendada para pasar datos entre hilos (producer-consumer).

``` python
import threading, queue, time

q = queue.Queue()

def producer():
    for i in range(5):
        q.put(i)
        print("produjo", i)
        time.sleep(0.2)
    q.put(None)  # sentinel para indicar fin

def consumer():
    while True:
        item = q.get()
        if item is None:
            break
        print("consumió", item)
        q.task_done()

t1 = threading.Thread(target=producer)
t2 = threading.Thread(target=consumer)
t1.start(); t2.start()
t1.join(); q.join()
```

---

## 7) Manejo de excepciones en hilos

Las excepciones en `Thread` no se propagan al hilo principal. Opciones:

- Usar `concurrent.futures.ThreadPoolExecutor` para obtener `Future` y atrapar excepciones.
- Capturar y guardar excepciones en el propio hilo y consultarlas después.
  Ejemplo con `ThreadPoolExecutor`:

``` python
from concurrent.futures import ThreadPoolExecutor

def trabajo(x):
    if x == 3:
        raise ValueError("boom")
    return x*2

with ThreadPoolExecutor(max_workers=3) as ex:
    futures = [ex.submit(trabajo, i) for i in range(5)]
    for f in futures:
        try:
            print(f.result())
        except Exception as e:
            print("error en hilo:", e)
```

---

## 8) ThreadPoolExecutor (alta abstracción)

Más cómodo que crear hilos manualmente.

``` python
from concurrent.futures import ThreadPoolExecutor, as_completed

def tarea(n):
    return n*n

with ThreadPoolExecutor(max_workers=4) as pool:
    futures = [pool.submit(tarea, i) for i in range(10)]
    for f in as_completed(futures):
        print(f.result())
```

---

## 9) GIL — cuándo usar threading vs multiprocessing

- **I/O-bound:** usa `threading` (o `asyncio`) — hilos dan mejoras reales (espera de I/O libera GIL).
- **CPU-bound:** `threading` no escala por GIL; usa `multiprocessing` (procesos) o extensiones nativas (`numpy`, C) que sueltan GIL.
  Explicación corta: el GIL permite que solo un hilo ejecute bytecode Python simultáneamente; por eso multiples hilos no aceleran cálculos puros en CPython.

---

## 10) Operaciones atómicas y seguridad

- Algunos objetos y operaciones son atómicas en CPython (por ejemplo, asignación simple de variable, operaciones sobre tipos integrales?) — **no confíes en ello**.
- Ejemplo inseguro (race):

``` python
# NO usar sin lock
counter = 0
def incr():
    global counter
    for _ in range(10000):
        counter += 1  # no es atómico: leer-modificar-escribir
```

Siempre protege con `Lock` si hay acceso concurrente.

---

## 11) Cancelación y parada de hilos

No existe `Thread.kill()` seguro. Patrones para parar:

- Usar `threading.Event()` como bandera de parada:

``` python
stop_event = threading.Event()

def worker():
    while not stop_event.is_set():
        # trabajo
        pass

# detener:
stop_event.set()
```

- Usar sentinels en `queue` (`None`).

---

## 12) Thread-local storage

Datos separados por hilo:

``` python
import threading
local = threading.local()
def worker(val):
    local.x = val
    print(local.x)

t1 = threading.Thread(target=worker, args=(1,))
t2 = threading.Thread(target=worker, args=(2,))
t1.start(); t2.start()
```

Cada hilo ve su propio `local.x`.

---

## 13) Debugging y utilidades

- `threading.enumerate()` → lista hilos activos.
- `threading.active_count()` → cuenta.
- `threading.current_thread().name` → nombre actual.
- Poner logs (no prints) con `logging` y `threadName` en el formato para seguir hilos.
- Para debug avanzado: `faulthandler.dump_traceback_later()` o `threading.settrace()` (poco común).

Ejemplo de logging:

``` python
import logging, threading, time
logging.basicConfig(level=logging.INFO, format="%(threadName)s: %(message)s")
def worker():
    logging.info("start")
    time.sleep(1)
    logging.info("end")

t = threading.Thread(target=worker, name="hilo-1")
t.start(); t.join()
```

---

## 14) Buenas prácticas

- Para I/O concurrency, prefiere `ThreadPoolExecutor` o `asyncio` según el caso.
- Evita variables globales mutables; usa `queue.Queue` y `Locks`.
- No uses `daemon=True` para tareas que deben terminar correctamente.
- Mantén regiones críticas lo más cortas posible (reduce contención).
- Si necesitas paralelismo real para CPU-bound, usa `multiprocessing` o librerías que suelten el GIL.
- Añade timeouts a `join()` y bloqueos (`lock.acquire(timeout=...)`) si corres riesgos de deadlock.

---

## 15) Ejemplos prácticos (útiles)

### a) Producer-consumer con Queue (resumen)

Ya mostrado en la sección de Queue. Es el patrón más útil y seguro para comunicación.

### b) Pool de threads simple con Thread y Queue

``` python
import threading, queue, time

def worker(q):
    while True:
        fn, args = q.get()
        if fn is None:
            break
        try:
            fn(*args)
        finally:
            q.task_done()

q = queue.Queue()
threads = []
for _ in range(4):
    t = threading.Thread(target=worker, args=(q,))
    t.start()
    threads.append(t)

# Encolar tareas
for i in range(10):
    q.put((print, (f"task {i}",)))

q.join()
# parar hilos
for _ in threads:
    q.put((None, None))
for t in threads:
    t.join()
```

### c) Uso real con requests (I/O-bound)

``` python
import requests
from concurrent.futures import ThreadPoolExecutor

urls = ["https://example.com"]*10

def fetch(url):
    r = requests.get(url)
    return len(r.content)

with ThreadPoolExecutor(max_workers=5) as ex:
    results = list(ex.map(fetch, urls))
print(results)
```

---

## 16) Limitaciones y alternativas

- `threading` no es la mejor opción para CPU-bound por el GIL.

- Alternativas:

  - `multiprocessing` — procesos (paralelismo real).

  - `asyncio` — concurrencia en un solo hilo usando corutinas (muy eficiente para I/O con muchas conexiones).

  - `concurrent.futures.ProcessPoolExecutor` — API parecida a ThreadPool pero con procesos.

---

## 17) Resumen

- Usa `threading` para **I/O-bound**.
- Protege recursos compartidos con `Lock`, `RLock`, o usa `Queue`.
- Para excepciones y manejo fácil, usa `ThreadPoolExecutor`.
- No hay forma segura de matar hilos; implementa mecanismo cooperativo (Event/sentinels).
- Si necesitas paralelismo CPU puro, usa `multiprocessing`.

---

[Regresar a la Guía Principal](./../readme.md#5-python)

> **Autor:** Fravelz
