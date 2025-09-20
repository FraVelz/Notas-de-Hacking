Perfecto 🚀, vamos con un repaso de las **herramientas externas más usadas en Bash**, que son programas del sistema (no funciones internas del shell) pero que se combinan con scripts para hacerlos mucho más poderosos.

---

# 🔹 Herramientas externas en Bash

## 1. **Manejo de texto**

* **`cat`** → Muestra el contenido de archivos.

  ```bash
  cat archivo.txt
  ```
* **`less` / `more`** → Permiten ver un archivo por páginas.

  ```bash
  less archivo.txt
  ```
* **`head`** → Muestra las primeras N líneas.

  ```bash
  head -n 5 archivo.txt
  ```
* **`tail`** → Muestra las últimas N líneas, o sigue cambios en tiempo real.

  ```bash
  tail -f log.txt
  ```
* **`wc`** → Cuenta líneas, palabras y caracteres.

  ```bash
  wc -l archivo.txt   # número de líneas
  wc -w archivo.txt   # número de palabras
  ```

---

## 2. **Búsqueda y filtrado**

* **`grep`** → Busca patrones de texto.

  ```bash
  grep "error" log.txt
  ```
* **`egrep`** → Igual que `grep` pero con expresiones regulares extendidas.
* **`fgrep`** → Busca texto literal, sin interpretar regex.
* **`find`** → Busca archivos en el sistema.

  ```bash
  find /home -name "*.txt"
  ```
* **`locate`** → Búsqueda rápida en una base de datos actualizada con `updatedb`.

---

## 3. **Transformación de texto**

* **`cut`** → Extrae columnas de texto.

  ```bash
  cut -d',' -f1 nombres.csv
  ```
* **`sort`** → Ordena líneas.

  ```bash
  sort lista.txt
  ```
* **`uniq`** → Elimina duplicados (requiere que el archivo esté ordenado).

  ```bash
  sort lista.txt | uniq
  ```
* **`tr`** → Reemplaza o elimina caracteres.

  ```bash
  echo "hola" | tr a-z A-Z   # convierte a mayúsculas
  ```
* **`sed`** → Editor de texto en flujo (reemplazo, borrado, inserción).

  ```bash
  sed 's/error/ERROR/g' log.txt
  ```
* **`awk`** → Procesador de texto por columnas, muy útil en reportes.

  ```bash
  awk '{print $1,$3}' archivo.txt
  ```

---

## 4. **Procesos y sistema**

* **`ps`** → Lista procesos.

  ```bash
  ps aux | grep firefox
  ```
* **`top` / `htop`** → Monitor de procesos en tiempo real.
* **`kill`** → Termina un proceso.

  ```bash
  kill -9 1234
  ```
* **`jobs`, `bg`, `fg`** → Control de trabajos en Bash.

---

## 5. **Archivos y directorios**

* **`ls`** → Lista archivos.
* **`cp`** → Copia.
* **`mv`** → Mueve/renombra.
* **`rm`** → Elimina.
* **`file`** → Muestra el tipo de un archivo.

  ```bash
  file imagen.png
  ```
* **`stat`** → Muestra metadatos del archivo.

---

## 6. **Compresión y empaquetado**

* **`tar`** → Empaqueta múltiples archivos.

  ```bash
  tar -cvf backup.tar directorio/
  ```
* **`gzip` / `gunzip`** → Comprime y descomprime.
* **`zip` / `unzip`** → Comprime y descomprime en formato ZIP.

---

## 7. **Red y comunicación**

* **`ping`** → Verifica conectividad.
* **`curl`** → Descarga o envía datos por HTTP.

  ```bash
  curl https://ejemplo.com
  ```
* **`wget`** → Descarga archivos.
* **`ssh`** → Conexión remota segura.
* **`scp`** → Copiar archivos entre equipos vía SSH.
* **`netstat` / `ss`** → Información de puertos y conexiones.

---

## 8. **Otros útiles**

* **`date`** → Fecha y hora.
* **`bc`** → Calculadora de precisión arbitraria.

  ```bash
  echo "2+3*5" | bc
  ```
* **`xargs`** → Construye comandos a partir de entradas.

  ```bash
  cat lista.txt | xargs rm
  ```

---

🔑 **Idea clave**:
Bash es más poderoso **cuando combinas estas herramientas** usando **pipes (`|`)** y redirecciones (`>`, `<`, `>>`).
Ejemplo: buscar errores en un log, contarlos y guardarlos:

```bash
grep "ERROR" log.txt | wc -l > total_errores.txt
```

---

👉 ¿Quieres que te arme un **mapa visual** (como una tablita resumida) con las herramientas más usadas, para que las tengas como **chuleta rápida**?

