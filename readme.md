# Repositorio para aprender Ciberseguridad

¡Bienvenido y que tengas un buen viaje!

---

## Materiales de Estudio

Como este git no tiene propósito de imponer una ruta sino, que facilitar el aprendizaje a los lectores estará las siguientes formas como consejo de aprender ciberseguridad desde cero:

| Pregunta                     | Mejor Curso         | Enlace                             | Enfoque                                  |
| ---------------------------- | ------------------- | ---------------------------------- | ---------------------------------------- |
| 100% de pago.                | Academia de Savitar | https://hack4u.io/cursos/          | Pentesting, y pentesting web             |
| 100% gratis + Versión Pago.  | Curso de Hixec      | https://hixec.com/cursos/          | Pentesting, osint y privacidad           |
| Si quieres una ruta directa. | **Este github**     | *no olvides darle like al repo :)* | Pentesting, osint, criptografía, forense |

Listo, comenzamos.

---

## Temario

- [Repositorio para aprender Ciberseguridad](#repositorio-para-aprender-ciberseguridad)
  - [Materiales de Estudio](#materiales-de-estudio)
  - [Temario](#temario)
  - [0. Conceptos Básicos (Leer archivo)](#0-conceptos-básicos-leer-archivo)
  - [1. Descargar en una máquina virtual, Ubuntu y Windows](#1-descargar-en-una-máquina-virtual-ubuntu-y-windows)
  - [2. Linux básico](#2-linux-básico)
  - [3. Bash Script](#3-bash-script)
  - [4. Redes (para ciberseguridad)](#4-redes-para-ciberseguridad)
  - [5. Ramas y Especializaciones de ciberseguridad](#5-ramas-y-especializaciones-de-ciberseguridad)
  - [6. Pentesting](#6-pentesting)
  - [7. OSINT](#7-osint)
  - [8. Criptografía](#8-criptografía)
  - [9. Forense](#9-forense)
  - [10. Tema número 5 de especialización](#10-tema-número-5-de-especialización)
  - [Aportaciones](#aportaciones)
  - [Información](#información)

Los siguientes artículos no son fundamentales, pero te pueden servir para enriquecerte de conocimiento en el mundo de la ciberseguridad, y dentro del entorno Linux:

- [Ir a Desmintiendo mitos de ciberseguridad](./0.no-fundamentales/0.mitos.md)

- [Ir a Distribuciones de Linux](./0.no-fundamentales/1.distribucionesDeLinux.md)

- [Ir a Obtener Ayuda en Linux](./0.no-fundamentales/2.obtenerAyudaEnLinux.md)

Enlace para practicar Phishing en entornos laborales y concientizar a las personas en entornos laborales: https://phishingquiz.withgoogle.com/

---

## 0. Conceptos Básicos (Leer archivo)

**Duración:** 10 min aproximadamente.

Antes de investigar, te recomiendo leer `Conceptos Básicos` y `legalidad del hacking`, donde se explican los términos fundamentales, y reglas importantes de la seguridad informática. Es importante entenderlos, ya que se usan constantemente en el campo de la ciberseguridad y hacking.

A continuación, el enlace al archivo:

- [Ir a leer Conceptos Básicos](./otros/1.conceptosBasicos.md)

- [Ir a leer Legalidad del Hacking](./otros/2.legalidadHacking.md)

---

## 1. Descargar en una máquina virtual, Ubuntu y Windows

**Duración aproximada (1-2h diarias):** 2 días.

Si quieres ver un video de YouTube completo de virtualización con VirtualBox antes de empezar los siguientes pasos:

[Ir a curso de Virtualización - Hixec](https://www.youtube.com/watch?v=CLdHQPyHeN0)

porque descargar Ubuntu y Windows:

- Sin importar tu sistema, usa una máquina virtual para trabajar sin dañar el original.

- La opción más recomendable es VirtualBox, sencilla y muy utilizada (otras personas prefieren WMware, u otras formas de virtualizar).

Los siguientes links te dirigirán a los tutoriales respectivos, de cada cosa:

- [Buscar como descargar Ubuntu en VirtualBox](https://www.youtube.com/results?search_query=descargar+ubuntu+en+virtualbox+en+windows)

- [Buscar como descargar Windows en VirtualBox](https://www.youtube.com/results?search_query=descargar+windows+en+virtualbox+en+windows)

Tras instalar Ubuntu y Windows, crea un punto de restauración, esto es muy importante.

- [Buscar como crear un punto de restauración en VirtualBox](https://www.youtube.com/results?search_query=como+crear+un+punto+de+restauracion+en+virtualbox)

Todo lo deberías tener más o menos así en VirtualBox:

![Imagen de VirtualBox](./images/image-virtualbox.png)

---

## 2. Linux básico

**Duración aproximada (1-2h diarias):** 3 días.

- No es necesario ir por algo complejo desde que sepas, los comandos básicos.

- También el uso del sudo y como funciona.

Si te interesa leer que específicamente necesitas de Linux, estará todo en el siguiente archivo:

[Ir a leer Comandos Linux](./1.comandosBash/1.comandosLinux.md)

o si prefieres video de YouTube:

- [Ir a Curso de Linux](https://www.youtube.com/watch?v=L906Kti3gzE)

- [Buscar Curso de Linux](https://www.youtube.com/results?search_query=curso+de+linux+desde+cero)

---

## 3. Bash Script

**Duración aproximada (1-2h diarias):** 7 días.

Cuando ya sepas comandos Linux básicos, bash script te servirá para automatizar tareas repetitivas en Linux, muy importante saberlo para el uso en entornos Linux aunque sea entender la sintaxis básica esto te será de mucha ayuda.

[Ir a leer temario bash (completo)](./_temarioBash.md)

Si prefieres video de YouTube:

- [Ir a curso de bash script desde cero (s4vitar)](https://www.youtube.com/watch?v=RUorAzaDftg)

- [Buscar curso de bash script desde cero](https://www.youtube.com/results?search_query=curso+de+bash+script+desde+cero)

---

## 4. Redes (para ciberseguridad)

**Duración aproximada (1-2h diarias):** 5 días.

Aprender sobre redes (no es indispensable aprender como funciona, la parte teórica te la puedes tomar con calma, lo realmente importante es saber usar las herramientas prácticas de Linux, la teoría te ayudara a entender mejor el funcionamiento de lo que usas):

| Curso de YouTube Recomendados                           | Enlace                                                                                                |
| ------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| Quieres un curso técnico con teoría completa:           | [Ir curso de YouTube Hixec - Redes para ciberseguridad](https://www.youtube.com/watch?v=7ejIdyu8hug)  |
| Quieres un curso de redes menos teórico, y más práctico | [Ir curso de YouTube Contando bits - Redes Informáticas](https://www.youtube.com/watch?v=OLSKCWjI778) |

Archivos para leer de redes:

- Parte Teórica (conceptos, y mucho más): [Ir a Teoría de Redes](./2.redes/1.teoria.md)

- Parte Práctica (herramientas): [Ir a Herramientas de Redes](./2.redes/2.herramientas.md)

---

## 5. Ramas y Especializaciones de ciberseguridad

1. **Seguridad Ofensiva (Ethical Hacking o Red Team)**

2. **Seguridad Defensiva (Blue Team)**

3. **Ciberinteligencia (Cyber Threat Intelligence)**

4. **Criptografía y Seguridad de la Información**

5. **Seguridad en Redes**

6. **Seguridad en la Nube (Cloud Security)**

7. **Seguridad en Aplicaciones**

8. **Gobernanza, Riesgo y Cumplimiento (GRC)**

9. **Seguridad Industrial y de Infraestructuras Críticas**

10. **Ciberseguridad en IA y Datos**

para más información y detalle de cada rama en el siguiente archivo:

[Ir al archivo de ramas de ciberseguridad](./otros/3.ramasCiberseguridad.md)

En este curso/guía vamos a elegir pentesting, osint, criptografía, forense u otro que será secreto para los lectores, pero será un bonus.

> **Nota:** Si solo te interesa conseguir un trabajo sin tener tiempo que perder, concéntrate solo en `pentesting` es **fácil para conseguir trabajo, y es importante resaltar que es un campo muy teórico**, es muy demandado por empresas, no te distraigas con otras cosas si este es tu propósito, *conseguir trabajo.*

---

## 6. Pentesting

Temario:

1. [Ir a Que es?, y fases del Pentesting](./4.pentesting/0.fases.md)

2. [Ir a Cajas en el Pentesting](./4.pentesting/1.cajas.md)

...

---

## 7. OSINT

**Temario:**

1. Cosas básicas a tener en cuenta: [Ir a OSINT básico](./5.osint/1.basic.md)

2. Google doorks: [Ir a Google Doorks](./5.osint/1.basic.md)

...

---

## 8. Criptografía

Actualización pendiente...

---

## 9. Forense

Actualización pendiente...

---

## 10. Tema número 5 de especialización

Un tema ya elegido, pero no se mostrará su nombre o significado hasta la completación las actualizaciones anteriores.

Actualización pendiente...

---

## Aportaciones

Si quieres aportar al git, con tus propias experiencias y aprendizajes, o económicamente, puedes leer el siguiente manual para enviarme aportaciones y enriquecer más este Repositorio de conocimiento, y ayudar al autor con el siguiente enlace:

[Ir a aportaciones :)](./otros/4.aportaciones.md)

---

## Información

Te agradecería mucho, que dieras una **estrella (like)** al Repositorio, no te cuesta nada y así apoyas al creador, del Repositorio estaría muy agradecido.

Notas de cada actualización, y mucho más:

[Ir a notas de Actualización](./otros/5.notas-actualizacion.md)

**Actualización:** 0.1.4

**Autor:** Fravelz
