# Subnetting

---

## Temario

- [Subnetting](#subnetting)
  - [Temario](#temario)
  - [En palabras simples](#en-palabras-simples)
  - [Conceptos clave](#conceptos-clave)
  - [Ejemplo básico](#ejemplo-básico)
  - [Ventajas del subnetting](#ventajas-del-subnetting)

[Regresar a la Guía Principal](./../readme.md#4-redes)

---

## En palabras simples

**Subnetting** (o **subneteo**) es un proceso que se usa en redes informáticas para **dividir una red grande en redes más pequeñas llamadas subredes** (*subnets*). Esto se hace para **organizar mejor el tráfico**, **aprovechar direcciones IP**, **mejorar la seguridad** y **optimizar el rendimiento** de la red.

Imagina que tienes una gran red con muchas computadoras (por ejemplo, toda una empresa).
En lugar de que todas estén en la misma red —lo que puede causar congestión y desorden—, **divides esa red en partes más pequeñas** (por departamentos, pisos, o funciones).
Cada parte se comporta como una “mini red” dentro de la red principal.

---

## Conceptos clave

| Término           | Significado                                                                               |
| ----------------- | ----------------------------------------------------------------------------------------- |
| **IP Address**    | Dirección única que identifica un dispositivo en la red (ej: `192.168.1.10`).             |
| **Network ID**    | Parte de la IP que identifica la red.                                                     |
| **Host ID**       | Parte que identifica a un dispositivo (host) dentro de esa red.                           |
| **Subnet Mask**   | Indica cuántos bits pertenecen a la red y cuántos al host. (Ej: `255.255.255.0` o `/24`). |
| **CIDR Notation** | Forma abreviada de expresar la máscara (ej: `/24` equivale a `255.255.255.0`).            |

---

## Ejemplo básico

Supongamos que tienes la red:

``` bash
192.168.1.0 /24
```

Esto significa:

- **Rango total:** 192.168.1.0 – 192.168.1.255
- **256 direcciones posibles (0–255)**
- **Host válidos:** 254 (porque una es la dirección de red y otra la de broadcast)

Si haces **subnetting** y divides `/24` en **dos subredes /25**, obtienes:

| Subred           | Rango de IPs                  | Broadcast     |
| ---------------- | ----------------------------- | ------------- |
| 192.168.1.0/25   | 192.168.1.0 – 192.168.1.127   | 192.168.1.127 |
| 192.168.1.128/25 | 192.168.1.128 – 192.168.1.255 | 192.168.1.255 |

Ahora tienes **dos subredes** con **126 hosts válidos** cada una.

---

## Ventajas del subnetting

✅ Reduce el tráfico innecesario (broadcasts).

✅ Mejora la seguridad al aislar segmentos.

✅ Permite administrar mejor las direcciones IP.

✅ Hace más eficiente la red y su mantenimiento.

---

[Regresar a la Guía Principal](./../readme.md#4-redes)

> **Autor:** Fravelz
