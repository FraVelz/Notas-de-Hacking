# Multiprocessing en Python

---

## Temario

- [Multiprocessing en Python](#multiprocessing-en-python)
  - [Temario](#temario)
  - [¿Qué es multiprocessing?](#qué-es-multiprocessing)
  - [Conceptos básicos](#conceptos-básicos)
    - [Crear un proceso](#crear-un-proceso)
  - [Enviar datos entre procesos](#enviar-datos-entre-procesos)
    - [Con Queue](#con-queue)
    - [Con Pipe](#con-pipe)
  - [Uso de Pool (grupo de procesos)](#uso-de-pool-grupo-de-procesos)
  - [Variables compartidas](#variables-compartidas)
    - [Value y Array](#value-y-array)
  - [Sincronización entre procesos](#sincronización-entre-procesos)
    - [Ejemplo con Lock](#ejemplo-con-lock)
  - [Ejemplo completo](#ejemplo-completo)
  - [Resumen rápido](#resumen-rápido)

[Regresar a la Guía Principal](./../../readme.md#5-python)

---

## ¿Qué es multiprocessing?

`multiprocessing` permite **ejecutar varios procesos en paralelo**, aprovechando **todos los núcleos del CPU**. A diferencia de los **hilos (`threading`)**, cada proceso tiene su **propia memoria** → no hay bloqueo por el **GIL (Global Interpreter Lock)**.

Es ideal para tareas **pesadas en CPU**, como cálculos, IA, simulaciones, etc.

---

## Conceptos básicos

### Crear un proceso

``` python
from multiprocessing import Process

def tarea():
    print("Ejecutando en otro proceso")

if __name__ == "__main__":
    p = Process(target=tarea)  # Crear proceso
    p.start()                  # Iniciar
    p.join()                   # Esperar a que termine
    print("Proceso finalizado")
```

- `target`: función a ejecutar.
- `args`: argumentos para esa función.
- `start()`: inicia el proceso.
- `join()`: bloquea hasta que el proceso termina.

---

## Enviar datos entre procesos

### Con Queue

``` python
from multiprocessing import Process, Queue

def productor(q):
    for i in range(3):
        q.put(i)  # Enviar a la cola

def consumidor(q):
    while not q.empty():
        print("Recibido:", q.get())

if __name__ == "__main__":
    q = Queue()
    p1 = Process(target=productor, args=(q,))
    p2 = Process(target=consumidor, args=(q,))
    p1.start(); p1.join()
    p2.start(); p2.join()
```

---

### Con Pipe

``` python
from multiprocessing import Process, Pipe

def enviar(conexion):
    conexion.send("Hola desde otro proceso")
    conexion.close()

if __name__ == "__main__":
    conn1, conn2 = Pipe()
    p = Process(target=enviar, args=(conn2,))
    p.start()
    print(conn1.recv())  # Recibe mensaje
    p.join()
```

---

## Uso de Pool (grupo de procesos)

Permite ejecutar una función muchas veces en paralelo fácilmente.

``` python
from multiprocessing import Pool

def cuadrado(x):
    return x * x

if __name__ == "__main__":
    with Pool(4) as pool:  # 4 procesos
        resultados = pool.map(cuadrado, [1, 2, 3, 4, 5])
    print(resultados)
```

➡️ Ejecuta `cuadrado` en paralelo para cada valor.

---

## Variables compartidas

Para compartir datos entre procesos de forma segura:

### Value y Array

``` python
from multiprocessing import Process, Value, Array

def modificar(v, a):
    v.value += 10
    for i in range(len(a)):
        a[i] *= 2

if __name__ == "__main__":
    v = Value('i', 5)           # Entero compartido
    a = Array('i', [1, 2, 3])   # Arreglo compartido
    p = Process(target=modificar, args=(v, a))
    p.start(); p.join()
    print(v.value, a[:])
```

---

## Sincronización entre procesos

Se usan mecanismos como `Lock`, `Event`, `Semaphore`, etc., para evitar conflictos.

### Ejemplo con Lock

``` python
from multiprocessing import Process, Lock

def imprimir(lock, texto):
    with lock:
        print(texto)

if __name__ == "__main__":
    lock = Lock()
    for i in range(3):
        Process(target=imprimir, args=(lock, f"Proceso {i}")).start()
```

---

## Ejemplo completo

``` python
from multiprocessing import Process, Queue, current_process
import time

def trabajo(q):
    nombre = current_process().name
    q.put(f"{nombre} inicia tarea")
    time.sleep(1)
    q.put(f"{nombre} termina tarea")

if __name__ == "__main__":
    q = Queue()
    procesos = [Process(target=trabajo, args=(q,)) for _ in range(4)]
    
    for p in procesos: p.start()
    for p in procesos: p.join()

    while not q.empty():
        print(q.get())
```

---

## Resumen rápido

| Herramienta                  | Uso principal                               |
| ---------------------------- | ------------------------------------------- |
| `Process`                    | Crear procesos individuales                 |
| `Pool`                       | Ejecutar muchas tareas paralelas fácilmente |
| `Queue`                      | Comunicación entre procesos                 |
| `Pipe`                       | Comunicación directa entre dos procesos     |
| `Value`, `Array`             | Datos compartidos                           |
| `Lock`, `Semaphore`, `Event` | Sincronización y seguridad                  |

---

[Regresar a la Guía Principal](./../../readme.md#5-python)

> **Autor:** Fravelz
