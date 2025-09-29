# Repositorio para aprender Ciberseguridad

Antes de comenzar, **es importante saber** que esto es un camino largo, que llevará tiempo, en aprender y que tu determinación, disciplina, y tiempo dedicado serán lo que te ayudarán a cada vez estar más cerca de tu objetivo en ciberseguridad.

Es importante que sepas que el **hacking y la ciberseguridad** no son, como lo pintan, en las películas o medios de comunicación. Si no conoces bien el mundo de la ciberseguridad, te recomendaría leer el siguiente git, para que tengas una idea de **mitos desmentidos de la ciberseguridad**:

[Ir a desmintiendo mitos de hacking](./otros/_mitos.md)

---

## Materiales de Estudio

Como este git no tiene propósito de imponer una ruta sino, que facilitar el aprendizaje a los lectores estará las siguientes formas como consejo de aprender ciberseguridad desde cero:

| Pregunta                    | Mejor Curso         | enlace                             |
|-----------------------------|---------------------|------------------------------------|
| Si quieres invertir.        | Academia de Savitar | https://hack4u.io/cursos/          |
| Si no tienes plata.         | Curso de Hixec      | https://hixec.com/cursos/          |
| Si quieres una ruta directa | **Este github**     | *no olvides darle like al repo :)* |

**Al decir** `una ruta directa` me refiero a que, aquí estaré colocando toda la ruta necesaria para aprender ciberseguridad, *-a base de mi experiencia en el aprendizaje que estaré llevando-* y sin ningún objetivo a cambio, **lo menos que puedes hacer es darle like al repo :v**

---

> **Nota:** Hay mucha teoría léala con calma y no se preocupe por aprenderse todo de memoria, a medida, que vayas practicando, la teoría, útil la va adquiriendo poco a poco.

---

## Temario

Pasos previos:

* [Ir a Requisitos Generales](#requisitos-generales)
* [Ir a Conceptos Básicos](#0-conceptos-básicos-leer-archivo)

Temario para aprender:

1. [Ir a Primeros Pasos](#1-primeros-pasos)
2. [Ir a Redes](#2-redes-para-ciberseguridad)
3. [Ir a ramas y especialidades](#3-ramas-y-especialidades)
4. [Ir a Pentesting](#4-pentesting)
5. [Ir a OSINT](#5-osint)
6. [Ir a Criptografía](#6-criptografia)
7. [Ir a Forense](#7-forense)

Información: [Ir a información](#información)

Los siguientes artículos no son fundamentales, pero te pueden servir para enriquecerte de conocimiento en el mundo de la ciberseguridad, y dentro del entorno Linux:

* [Ir a Distribuciones de Linux](./otros/distribucionesDeLinux.md)

* [Ir a Obtener ayuda en Linux](./otros/obtenerAyudaEnLinux.md)

---

## Requisitos Generales

Estos requisitos son para toda esta guía que debes tener en cuenta:

* Tiempo libre para aprender, **mínimo 1 hora diaria** (es lo recomendable, si puedes más mejor).

* Conexión a Internet.

* Computadora.

---

## 0. Conceptos Básicos (Leer archivo)

**Duración:** 10 min aproximadamente :)

En el paso inicial antes de comenzar a investigar, te recomiendo, leer el archivo ./0.conceptosBasicos.md que contienen los conceptos Básicos importantes en el mundo de la seguridad informática, es importante que tengas en cuenta toda la información del archivo porque se utiliza mucho estos términos en el campo de la ciberseguridad (son unos términos básicos muy importantes a tener en cuenta).

A continuación, el enlace al archivo:

[Ir al archivo conceptosBasicos.md](./otros/0.conceptosBasicos.md)

---

## 1. Primeros pasos

**Duración aproximada (1-2h diarias):** 7 días :)

### 1) Descargar en una máquina virtual, Ubuntu y Windows

porque:

* Sin importar tu sistema, usa una máquina virtual para trabajar sin dañar el original.

* La opción más recomendable es VirtualBox, sencilla y muy utilizada.

* Tras instalar Ubuntu y Windows, crea un punto de restauración en VirtualBox para cada uno, (toma menos de un minuto) esto para recuperar tu sistema fácilmente si algo se rompe.

Todo lo deberías tener más o menos así:

![Imagen de VirtualBox](./images/image-virtualbox.png)

### 2) Linux básico

* No es necesario ir por algo complejo desde que sepas, los comandos básicos.

* También el uso del sudo y como funciona.

Si te interesa que específicamente necesitas de Linux, estará todo en el siguiente archivo:

[Ir al archivo ./1.comandosBash/1.comandosLinux.md](./1.comandosBash/1.comandosLinux.md)

---

## 2. Redes (para ciberseguridad)

**Duración:** 5 días (aproximadamente, con 1-2 horas diarias).

Aprender sobre redes (no es indispensable aprender como funciona, la parte teórica te la puedes tomar con calma, lo realmente importante es saber usar las herramientas prácticas de Linux, la teoría te ayudara a entender mejor el funcionamiento de lo que usas):

| Curso de YouTube Recomendados                              | Enlace                                                                                                |
| ---------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| Quieres un curso técnico con teoría completa:              | [Ir curso de Youtube Hixec - Redes para ciberseguridad](https://www.youtube.com/watch?v=7ejIdyu8hug)  |
| Quieres un curso de redes menos teórico, y mas practico :) | [Ir curso de Youtube Contando bits - Redes Informaticas](https://www.youtube.com/watch?v=OLSKCWjI778) |

Archivos para leer de redes:

* Parte Teórica (conceptos, y mucho más): [Ir a 1.teoriaRedes.md](./2.redes/1.teoriaRedes.md)

* Parte Práctica (comandos y herramientas): [Ir a 2.practica.md](./2.redes/2.practicaRedes.md)

---

## 3. Ramas y Especialidades

La **ciberseguridad** es un campo enorme y se divide en varias **ramas o especialidades**, cada una con su propio enfoque, herramientas y objetivos.
Aquí tienes una **clasificación completa** y actualizada de las principales ramas de la ciberseguridad

### **1) Seguridad Ofensiva (Ethical Hacking o Red Team)**

Su objetivo es **atacar para proteger**. Los expertos en esta área piensan como los hackers para encontrar vulnerabilidades antes de que lo hagan los delincuentes.

**Subramas:**

* **Pentesting (Pruebas de penetración):** Simular ataques reales para detectar fallos.

* **Red Teaming:** Ataques avanzados y coordinados contra toda la infraestructura.

* **Ingeniería social:** Manipular a las personas para obtener información (phishing, pretexting, etc.).

* **Explotación de vulnerabilidades:** Encontrar y aprovechar fallos en software o sistemas.

* **Hacking físico:** Acceso no autorizado a lugares o dispositivos.

*Herramientas comunes:* Metasploit, Burp Suite, Nmap, Wireshark, Hydra, Aircrack-ng.

### **2) Seguridad Defensiva (Blue Team)**

Su función es **detectar, detener y responder** ante los ataques.

**Subramas:**

* **Monitoreo de seguridad (SOC):** Vigilancia constante de redes y sistemas.

* **Análisis de malware:** Estudio de programas maliciosos para entender su funcionamiento.

* **Gestión de incidentes:** Responder ante ataques o brechas de seguridad.

* **Caza de amenazas (Threat Hunting):** Buscar ataques ocultos o sofisticados antes de que causen daño.

* **Fortificación de sistemas (Hardening):** Configurar y reforzar sistemas para minimizar riesgos.

*Herramientas comunes:* Splunk, SIEM, Suricata, OSSEC, ELK Stack, Wireshark.

### **3) Ciberinteligencia (Cyber Threat Intelligence)**

Se centra en **recolectar, analizar y anticipar amenazas** cibernéticas.

**Subramas:**

* **Inteligencia de amenazas (CTI):** Estudio de grupos de hackers, sus tácticas y herramientas.

* **Análisis forense digital:** Investigación después de un ataque (seguimiento, evidencia, trazas).

* **OSINT (Open Source Intelligence):** Recolección de información pública útil para prevenir ataques.

* **Contrainteligencia cibernética:** Detectar y neutralizar espionaje o desinformación.

*Herramientas comunes:* Maltego, Shodan, TheHarvester, MISP, VirusTotal.

### **4) Criptografía y Seguridad de la Información**

Protege los **datos** mediante matemáticas, algoritmos y protocolos seguros.

**Subramas:**

* **Criptografía aplicada:** Uso de algoritmos para cifrar datos (AES, RSA, SHA).

* **Gestión de claves y certificados digitales.**

* **Firmas digitales y blockchain.**

* **Seguridad en comunicaciones (VPN, SSL/TLS).**

*Herramientas comunes:* OpenSSL, GPG, Hashcat, VeraCrypt.

### **5) Seguridad en Redes**

Asegura la **infraestructura** que conecta dispositivos y servidores.

**Subramas:**

* **Seguridad perimetral (firewalls, IDS/IPS).**
* **Seguridad en routers y switches.**
* **Segmentación y control de tráfico.**
* **Seguridad en redes inalámbricas (Wi-Fi).**

*Herramientas comunes:* pfSense, Cisco Security, Snort, Wireshark, Aircrack-ng.

### **6) Seguridad en la Nube (Cloud Security)**

Protege los servicios y datos alojados en plataformas como AWS, Azure o Google Cloud.

**Subramas:**

* **Configuración segura de entornos cloud.**
* **Gestión de identidades y accesos (IAM).**
* **Auditoría y cumplimiento normativo.**
* **Cifrado y protección de datos en la nube.**

*Herramientas comunes:* Prisma Cloud, AWS Security Hub, Azure Defender.

### **7) Seguridad en Aplicaciones**

Se enfoca en asegurar el **software** desde su desarrollo.

**Subramas:**

* **AppSec (Application Security):** Protección de aplicaciones web y móviles.
* **DevSecOps:** Integrar la seguridad en el ciclo de desarrollo.
* **Revisión de código y análisis estático.**
* **Pruebas de seguridad automatizadas.**

*Herramientas comunes:* OWASP ZAP, SonarQube, Burp Suite, Checkmarx.

### **8) Gobernanza, Riesgo y Cumplimiento (GRC)**

Enfocada en la **gestión estratégica de la seguridad**, políticas, normas y auditorías.

**Subramas:**

* **Políticas y normativas de seguridad (ISO 27001, NIST, GDPR).**
* **Gestión de riesgos cibernéticos.**
* **Auditorías de seguridad.**
* **Concienciación y capacitación en ciberseguridad.**

### **9) Seguridad Industrial y de Infraestructuras Críticas**

Protege sistemas industriales y servicios esenciales (energía, transporte, agua, etc.).

**Subramas:**

* **Seguridad OT (Operational Technology).**
* **SCADA y sistemas de control industrial.**
* **Ciberseguridad en IoT (Internet of Things).**

### **10) Ciberseguridad en IA y Datos**

Campo nuevo y en crecimiento (la verdad no sabía que existía).

**Subramas:**

* **Seguridad en modelos de IA (ataques adversarios).**
* **Protección de datos usados para entrenar IA.**
* **Privacidad diferencial y anonimización.**
* **Detección de deepfakes y manipulación de información.**

---

## 4. Pentesting

Actualización pendiente...

---

## 5. OSINT

Actualización pendiente...

---

## 6. Criptografia

Actualización pendiente...

---

## 7. Forense

Actualización pendiente...

---

## Aportaciones

Si quieres aportar al git, con tus propias experiencias y aprendizajes, o económicamente, puedes leer el siguiente manual para enviarme aportaciones y enriquecer más este Repositorio de conocimiento, y ayudar al autor con el siguiente enlace:

[Ir a aportaciones :)](./otros/_aportaciones.md)

---

## Información

Te agradecería mucho, que dieras una **estrella (like)** al Repositorio, no te cuesta nada y así apoyas al creador, del Repositorio estaría muy agradecido.

Notas que hago todos los días para las Actualizaciones:

[Ir a notasPersonales.md](./notasPersonales.md)

**Actualización:** 0.0.8

**Autor:** Fravelz
