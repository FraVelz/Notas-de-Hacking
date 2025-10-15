# Repositorio para aprender Ciberseguridad

¡Bienvenido y que tengas un buen viaje!

> **Nota:** Para cada tema que se mencione, se tratara de dejar material y enlaces de videos de YouTube, y muchos más cosas como materiales de complemento a esta guía.

---

## Temario

> **Ruta:** con enfoque principal pentesting, normalmente es lo que ayuda a conseguir unas buenas bases en ciberseguridad y trabajo es esta área.

- [Repositorio para aprender Ciberseguridad](#repositorio-para-aprender-ciberseguridad)
  - [Temario](#temario)
  - [0. Conceptos Básicos](#0-conceptos-básicos)
  - [1. Virtualización](#1-virtualización)
  - [2. Linux y Bash Script](#2-linux-y-bash-script)
  - [3. Windows](#3-windows)
  - [4. Redes](#4-redes)
  - [5. Python](#5-python)
  - [6. Pentesting](#6-pentesting)
  - [7. OSINT](#7-osint)
  - [8. Criptografía](#8-criptografía)
  - [9. Forense](#9-forense)
  - [10. Privacidad y Anonimato](#10-privacidad-y-anonimato)
  - [Aportaciones](#aportaciones)
  - [Información](#información)

Los siguientes artículos no son fundamentales, pero te pueden servir para enriquecerte de conocimiento en el mundo de la ciberseguridad, y dentro del entorno Linux:

- [Ir a Ramas de ciberseguridad](./otros/ramas-ciberseguridad.md)

- [Ir a Distribuciones de Linux](./otros/distribuciones-linux.md)

- [Ir a Concientización](./otros/concientizacion.md)

- [Herramientas Generales](./otros/herramientas.md)

- [Ir a recursos Adicionales](./otros/recursos.md)

Enlace para aprender a reconocer Phishing, y concientizar a las personas en entornos laborales:

- [Ir a Phishing Quiz With Google](https./phishingquiz.withgoogle.com/)

---

## 0. Conceptos Básicos

**Duración aproximada:** 20 min.

Antes de investigar, te recomiendo leer los siguientes `desmintiendo mitos`, `Conceptos Básicos` y `legalidad del hacking`, donde se explican los términos fundamentales, y reglas importantes de la seguridad informática. Es importante entenderlos, ya que se usan constantemente en el campo de la ciberseguridad y hacking.

A continuación, el enlace de cada archivo:

- [Ir a Desmintiendo mitos](./conceptos-basicos/mitos.md)

- [Ir a leer Conceptos Básicos](./conceptos-basicos/conceptos-basicos.md)

- [Ir a leer Legalidad del Hacking](./conceptos-basicos/legalidad-hacking.md)

---

## 1. Virtualización

**Duración aproximada (2h diarias):** 2 días.

Si quieres ver un video de YouTube completo de virtualización con VirtualBox antes de empezar los siguientes pasos, elige alguno para aprender a virtualizar y como aprender como funciona VirtualBox:

[Ir a curso de Virtualización - Hixec (1h 50m)](https./www.youtube.com/watch?v=CLdHQPyHeN0)

[Ir a curso de Virtualización - xerosec (2h)](https./www.youtube.com/watch?v=bIoVtXiG9xc&feature=youtu.be)

[Ir a curso de Máquinas Virtuales - HolaMundo (30m)](https./www.youtube.com/watch?v=uiFZUfmFAus)

Porque descargar Ubuntu y Windows:

- Sin importar tu sistema, usa una máquina virtual para trabajar sin dañar el original.

- La opción más recomendable es VirtualBox, sencilla y muy utilizada (otras personas prefieren WMware, u otras formas de virtualizar).

> No recomiendo Kali porque instala muchas herramientas de hacking por defecto que quizá no uses; eso obliga a actualizar todo constantemente. Es mejor usar Ubuntu e instalar e ir a actualizar solo las herramientas que necesitas.

Tras instalar Ubuntu y Windows, crea un punto de restauración, esto es muy importante.

- [Buscar como crear un punto de restauración en VirtualBox](https./www.youtube.com/results?search_query=como+crear+un+punto+de+restauracion+en+virtualbox)

Todo lo deberías tener más o menos así en VirtualBox:

![Imagen de VirtualBox](./images/image-virtualbox.png)

---

## 2. Linux y Bash Script

**Duración aproximada (2h diarias):** 1 mes.

Estos temas están relacionados porque los comandos que aprendes en Linux también se pueden usar dentro de los archivos de Bash Script. En otras palabras, Bash actúa como una extensión del sistema que te permite automatizar esos comandos, combinarlos y ejecutarlos de forma secuencial o condicional sin tener que escribirlos uno por uno en la terminal.

Primero tener los fundamentos de como utilizar la terminal de linux:

- [Ir a Comandos básicos de Linux](./linux/comandos-linux.md)

- [Ir a Obtener Ayuda en Linux](./linux/ayuda-linux.md)

- [Ir a comandos de gestión de usuarios](./linux/grupos-y-usuarios.md)

o si prefieres video de YouTube, puedes elegir alguno de estos:

- [Ir a Curso de Linux - HolaMundo (35m)](https./www.youtube.com/watch?v=L906Kti3gzE)

- [Ir a Curso de Linux - Hixec (3h)](https./www.youtube.com/watch?v=8v1cR7-msQ0)

- [Buscar Curso de Linux](https./www.youtube.com/results?search_query=curso+de+linux+desde+cero)

Luego comenzar a aprender temas de bash script puedes leer las siguientes notas:

**Básico:**

1. [Ir a Fundamentos](./linux/fundaments.md)
2. [Ir a Condiciones](./linux/condiciones.md)
3. [Ir a Estructuras de Control](./linux/estControl.md)
4. [Ir a Funciones, variables locales y globales](./linux/funciones.md)
5. [Ir a Funciones Externas](./linux/funciones-externas.md)

**Intermedio-Avanzado:**

1. [Ir a Arrays](./linux/arrays.md)
2. [Ir a Strings](./linux/manipulacion-de-strings.md)
3. [Ir a Gestiones de Procesos](./linux/gestion-de-procesos.md)
4. [Ir a Entrada y Salida](./linux/entrada-y-salida.md)

O si prefieres video de YouTube:

- [Ir a curso de bash script desde cero - El pinguino de mario (30m)](https./www.youtube.com/watch?v=RUorAzaDftg)

- [Ir a curso de bash script desde cero - Fazt (2h 23m)](https./www.youtube.com/watch?v=H4ayPYcZEfI)

- [Buscar curso de bash script desde cero](https./www.youtube.com/results?search_query=curso+de+bash+script+desde+cero)

---

## 3. Windows

**Duración aproximada (2h diarias):** 2 semanas.

...

---

## 4. Redes

**Duración aproximada (2h diarias):** 1 semana.

Aprender sobre redes (no es indispensable aprender como funciona, la parte teórica te la puedes tomar con calma, lo realmente importante es saber usar las herramientas prácticas de Linux, la teoría te ayudara a entender mejor el funcionamiento de lo que usas):

Archivos para leer de redes:

- Parte Teórica (conceptos, y mucho más): [Ir a Teoría de Redes](./redes/teoria.md)

- Parte Práctica (herramientas): [Ir a Herramientas de Redes](./redes/herramientas.md)

Cursos videos de YouTube:

- [Ir curso de YouTube Contando bits - Redes Informáticas](https./www.youtube.com/watch?v=OLSKCWjI778)

- [Ir curso de YouTube Hixec - Redes para ciberseguridad](https./www.youtube.com/watch?v=7ejIdyu8hug)

---

## 5. Python

...

---

## 6. Pentesting

Temario:

1. [Ir a Que es?, y fases del Pentesting](./pentesting/fases.md)

2. [Ir a Cajas en el Pentesting](./pentesting/cajas.md)

...

> **Nota:** Si solo te interesa conseguir un trabajo sin tantas distracciones en otras cosas, el `pentesting` a profundidad es más que suficiente.

---

## 7. OSINT

**Temario:**

1. Cosas básicas a tener en cuenta: [Ir a OSINT básico](./osint/basic.md)

2. Google Doorks: [Ir a Google Doorks](./osint/googleDoorks.md)

...

---

## 8. Criptografía

Actualización pendiente...

---

## 9. Forense

Actualización pendiente...

---

## 10. Privacidad y Anonimato

1. Definiciones y diferencias entre privacidad y anonimato: [Ir a definiciones](./nonimato/definicion.md)

2. Huella digital: [Ir a Huella Digital](./anonimato/huella-digital.md)

3. User Agent: [Ir a user-agent](./anonimato/user-agent.md)

4. Saber si están filtrados tus datos: [Ir a investigar](./anonimato/filtraciones.md)

...

Conceptos generales: [Ir a conceptos generales](./anonimato/conceptos-generales.md)

---

## Aportaciones

Si quieres aportar al git, con tus propias experiencias y aprendizajes, o económicamente, puedes leer el siguiente manual para enviarme aportaciones y enriquecer más este Repositorio de conocimiento, y ayudar al autor con el siguiente enlace:

[Ir a aportaciones :)](./otros/aportaciones.md)

---

## Información

Te agradecería mucho, que dieras una **estrella (like)** al Repositorio, no te cuesta nada y así apoyas al creador, del Repositorio estaría muy agradecido.

Notas de cada actualización, y mucho más:

[Ir a notas de Actualización](./otros/notas-actualizacion.md)

**Actualización:** 0.1.7

**Autor:** Fravelz
