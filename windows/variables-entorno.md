# Variables de Entorno

---

## Temario

- [Variables de Entorno](#variables-de-entorno)
  - [Temario](#temario)
    - [Tipos de variables de entorno](#tipos-de-variables-de-entorno)
    - [Cómo ver las variables de entorno](#cómo-ver-las-variables-de-entorno)
    - [Editar o crear variables](#editar-o-crear-variables)

[Regresar a la guía principal](./../readme.md#3-windows)

---

### Tipos de variables de entorno

1. **Variables del sistema**:
   Aplican a todos los usuarios del equipo. Por ejemplo:

   - `PATH`: lista de rutas donde Windows busca ejecutables.
   - `COMPUTERNAME`: nombre del equipo.
   - `SYSTEMROOT`: ruta de la carpeta del sistema, generalmente `C:\Windows`.
   - `TEMP` o `TMP`: carpeta temporal.

2. **Variables de usuario**:
   Solo aplican al usuario actual. Por ejemplo:

   - `USERNAME`: nombre del usuario actual.
   - `USERPROFILE`: ruta del perfil del usuario (`C:\Users\TuUsuario`).
   - `HOMEPATH`: ruta relativa de la carpeta del usuario (`\Users\TuUsuario`).

---

### Cómo ver las variables de entorno

1. **Usando CMD**:

   - `set` → muestra todas las variables de usuario y del sistema.
   - `echo %VARIABLE%` → muestra el valor de una variable específica.
     Ejemplo:

     ```cmd
     echo %PATH%
     echo %USERPROFILE%
     ```

2. **Usando PowerShell**:

   - `Get-ChildItem Env:` → lista todas las variables.
   - `$Env:VARIABLE` → muestra el valor de una variable específica.
     Ejemplo:

     ```powershell
     $Env:PATH
     $Env:USERNAME
     ```

3. **Usando la interfaz gráfica**:

   - Presiona `Win + R` → escribe `sysdm.cpl` → Enter.
   - Ve a la pestaña **Opciones avanzadas** → **Variables de entorno**.
   - Aquí puedes **ver, crear, editar o eliminar** variables de usuario o del sistema.

---

### Editar o crear variables

- Para agregar una carpeta al `PATH`:

  1. Abrir **Variables de entorno**.
  2. Seleccionar `PATH` → Editar → Nuevo → pegar la ruta.
  3. Guardar y reiniciar CMD/PowerShell para que tome efecto.

---

[Regresar a la guía principal](./../readme.md#3-windows)

> **Autor:** Fravelz
