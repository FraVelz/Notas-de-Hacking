# Cidrs y Host

---

## Temario

- [Cidrs y Host](#cidrs-y-host)
  - [Temario](#temario)
  - [1. Qué es CIDR](#1-qué-es-cidr)
    - [Ejemplo](#ejemplo)
    - [Cómo se interpreta](#cómo-se-interpreta)
  - [2. Qué es una máscara de red (o de host)](#2-qué-es-una-máscara-de-red-o-de-host)
    - [Máscara de host](#máscara-de-host)
  - [3. Relación entre CIDR y máscaras](#3-relación-entre-cidr-y-máscaras)
  - [4. Ejemplo práctico](#4-ejemplo-práctico)

[Regresar a la Guía Principal](./../readme.md#4-redes)

---

## 1. Qué es CIDR

**CIDR** significa **Classless Inter-Domain Routing**, o en español,
**Enrutamiento entre dominios sin clases**.

Se usa para **representar redes IP y su tamaño** de forma compacta.

---

### Ejemplo

``` bash
192.168.1.0/24
```

- `192.168.1.0` → Dirección de red
- `/24` → Indica **cuántos bits** de la dirección se usan para la **parte de red**.

💭 En este caso:

- 24 bits → red
- 8 bits restantes (de los 32 de una IPv4) → **hosts** o dispositivos

---

### Cómo se interpreta

Cada número después de la barra `/` indica cuántos bits de la IP pertenecen a la red:

| CIDR | Máscara de subred | # de hosts posibles |
| ---- | ----------------- | ------------------- |
| /8   | 255.0.0.0         | 16,777,214          |
| /16  | 255.255.0.0       | 65,534              |
| /24  | 255.255.255.0     | 254                 |
| /30  | 255.255.255.252   | 2                   |

> (Se restan 2 hosts: uno para la dirección de red y otro para broadcast)

---

## 2. Qué es una máscara de red (o de host)

Una **máscara de subred** (subnet mask) indica **qué parte de la IP identifica la red** y **qué parte identifica al host**.

Por ejemplo:

| IP           | Máscara       | Binario (simplificado)              | Significado                    |
| ------------ | ------------- | ----------------------------------- | ------------------------------ |
| 192.168.1.10 | 255.255.255.0 | 11111111.11111111.11111111.00000000 | 24 bits para red, 8 para hosts |

---

### Máscara de host

A veces se habla de “máscara de host”, que simplemente es **el complemento** de la máscara de red.

👉 Si la máscara de red es `255.255.255.0`
entonces la **máscara de host** es:

``` bash
0.0.0.255
```

Porque:

- Los bits 1 (255) indican red
- Los bits 0 (0) indican host

Es decir, la máscara de host muestra **qué bits pueden variar** para asignar direcciones a los dispositivos.

---

## 3. Relación entre CIDR y máscaras

| CIDR | Máscara de red  | Máscara de host | # Hosts válidos |
| ---- | --------------- | --------------- | --------------- |
| /8   | 255.0.0.0       | 0.255.255.255   | 16,777,214      |
| /16  | 255.255.0.0     | 0.0.255.255     | 65,534          |
| /24  | 255.255.255.0   | 0.0.0.255       | 254             |
| /30  | 255.255.255.252 | 0.0.0.3         | 2               |

---

## 4. Ejemplo práctico

Supón que tienes:

``` bash
Red: 10.0.0.0/24
```

Entonces:

- Máscara de red: `255.255.255.0`
- Máscara de host: `0.0.0.255`
- Rango de hosts: `10.0.0.1` → `10.0.0.254`
- Dirección de broadcast: `10.0.0.255`
- Total hosts: 254

---

[Regresar a la Guía Principal](./../readme.md#4-redes)

> **Autor:** Fravelz
