¡Genial! ⚡ Vamos a cubrir **todo lo esencial sobre gestión de procesos en Bash/Linux**.

En Linux, **un proceso** es cualquier programa en ejecución. Bash nos da comandos internos y externos para crearlos, gestionarlos, detenerlos, reanudarlos y monitorearlos.

---

# 🔹 Conceptos básicos

* **PID (Process ID):** Identificador único de cada proceso.
* **PPID (Parent PID):** ID del proceso padre.
* **Estado:** Puede estar ejecutándose, detenido, en segundo plano, esperando, etc.
* **Señales:** Mensajes que el kernel/envía a un proceso (ej: `SIGKILL`, `SIGSTOP`).

---

# 🔹 Comandos para ver procesos

* **`ps`** → Muestra procesos activos.

  ```bash
  ps aux          # todos los procesos
  ps -ef          # formato extendido
  ps -o pid,ppid,cmd -p 1234
  ```
* **`top` / `htop`** → Monitor interactivo de procesos.
* **`pgrep`** → Busca procesos por nombre.

  ```bash
  pgrep firefox
  ```
* **`pstree`** → Muestra procesos en forma de árbol.

---

# 🔹 Ejecución de procesos

* **Ejecutar en foreground (primer plano):**

  ```bash
  ./programa
  ```

  (El shell queda bloqueado hasta que termine).

* **Ejecutar en background (segundo plano):**

  ```bash
  ./programa &
  ```

  (El shell sigue disponible mientras corre el proceso).

* **Jobs controlados por Bash:**

  ```bash
  jobs         # lista procesos en segundo plano de esa sesión
  fg %1        # lleva el job 1 al foreground
  bg %1        # reanuda el job 1 en background
  ```

---

# 🔹 Señales a procesos

* **`kill`** → Envía señales a un proceso por su PID.

  ```bash
  kill -9 1234    # SIGKILL → lo mata inmediatamente
  kill -15 1234   # SIGTERM → pide que termine (más “limpio”)
  kill -STOP 1234 # pausa el proceso
  kill -CONT 1234 # reanuda un proceso detenido
  ```
* **`pkill`** → Igual que `kill` pero por nombre.

  ```bash
  pkill firefox
  ```
* **`killall`** → Termina todos los procesos con cierto nombre.

  ```bash
  killall nano
  ```

---

# 🔹 Prioridades de procesos

Cada proceso tiene un **valor de prioridad (nice value)**:

* Va de **-20 (alta prioridad)** a **19 (baja prioridad)**.

* Por defecto es **0**.

* No root solo puede aumentar nice (bajar prioridad).

* **Cambiar prioridad al iniciar:**

  ```bash
  nice -n 10 ./programa
  ```

* **Cambiar prioridad a proceso existente:**

  ```bash
  renice -n 5 -p 1234
  ```

---

# 🔹 Espera y sincronización

* **`wait`** → Espera a que un proceso (o job) termine.

  ```bash
  ./largo.sh &
  wait   # espera a que termine el proceso en segundo plano
  ```

* **`sleep`** → Pausa la ejecución.

  ```bash
  sleep 5   # espera 5 segundos
  ```

---

# 🔹 Redirección y procesos

* Ejecutar proceso ignorando terminal:

  ```bash
  ./script.sh > salida.log 2>&1 &
  disown     # separa el proceso de la sesión
  ```

* Usar **`nohup`** para que no se cierre al cerrar sesión:

  ```bash
  nohup ./programa &
  ```

---

# 🔹 Información de procesos

* **`/proc`** → Directorio virtual con información.

  ```bash
  cat /proc/1234/status
  ```

---

# 🔹 Resumen visual

| Acción                   | Comando                          |        |
| ------------------------ | -------------------------------- | ------ |
| Listar procesos          | `ps aux`, `top`, `htop`          |        |
| Buscar por nombre        | `pgrep`, \`ps aux                | grep\` |
| Ejecutar en background   | `comando &`                      |        |
| Ver jobs                 | `jobs`                           |        |
| Llevar a foreground      | `fg %n`                          |        |
| Reanudar en background   | `bg %n`                          |        |
| Matar por PID            | `kill -9 PID`                    |        |
| Matar por nombre         | `pkill nombre`, `killall nombre` |        |
| Cambiar prioridad        | `nice`, `renice`                 |        |
| Ignorar cierre de sesión | `nohup comando &`                |        |
| Esperar procesos         | `wait`                           |        |

---

👉 ¿Quieres que te arme un **mini-mapa práctico en código** con ejemplos de cada caso (como un script de prueba que lances para ver cómo se comporta cada proceso)?

