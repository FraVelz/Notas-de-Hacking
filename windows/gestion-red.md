# Comandos y cmdlets de gestión de red

---

## Temario

- [Comandos y cmdlets de gestión de red](#comandos-y-cmdlets-de-gestión-de-red)
  - [Temario](#temario)
  - [CMD — Comandos de Red](#cmd--comandos-de-red)
  - [PowerShell — Cmdlets de Red](#powershell--cmdlets-de-red)

[Regresar a la guía principal](./../readme.md#3-windows)

---

## CMD — Comandos de Red

| Comando                                      | Descripción                                                             |
| -------------------------------------------- | ----------------------------------------------------------------------- |
| `ipconfig`                                   | Muestra la configuración IP de los adaptadores de red.                  |
| `ipconfig /all`                              | Muestra información completa, incluyendo direcciones MAC y DNS.         |
| `ipconfig /release`                          | Libera la dirección IP obtenida por DHCP.                               |
| `ipconfig /renew`                            | Solicita una nueva IP al servidor DHCP.                                 |
| `ping <host>`                                | Comprueba la conectividad con otro host o dirección IP.                 |
| `tracert <host>`                             | Rastrea la ruta que siguen los paquetes hasta un destino.               |
| `nslookup <dominio>`                         | Consulta los registros DNS de un dominio.                               |
| `netstat`                                    | Muestra las conexiones de red activas y puertos abiertos.               |
| `netstat -ano`                               | Muestra los puertos y procesos asociados (PID).                         |
| `netsh`                                      | Permite configurar parámetros de red (IP, firewall, Wi-Fi, etc.).       |
| `netsh wlan show profiles`                   | Muestra los perfiles de redes Wi-Fi guardadas.                          |
| `netsh wlan show profile <nombre> key=clear` | Muestra la contraseña guardada de una red Wi-Fi.                        |
| `route print`                                | Muestra la tabla de enrutamiento de Windows.                            |
| `arp -a`                                     | Muestra la tabla ARP (asociación IP–MAC).                               |
| `getmac`                                     | Muestra las direcciones MAC de los adaptadores de red.                  |
| `net use`                                    | Conecta o muestra conexiones a recursos compartidos.                    |
| `net share`                                  | Muestra o administra carpetas compartidas.                              |
| `net view`                                   | Muestra los equipos disponibles en la red local.                        |
| `telnet <host> <puerto>`                     | Comprueba si un puerto remoto está abierto (si Telnet está habilitado). |

---

## PowerShell — Cmdlets de Red

| Cmdlet                                     | Descripción                                               |
| ------------------------------------------ | --------------------------------------------------------- |
| `Get-NetIPAddress`                         | Muestra las direcciones IP configuradas.                  |
| `New-NetIPAddress`                         | Asigna una nueva dirección IP manualmente.                |
| `Remove-NetIPAddress`                      | Elimina una dirección IP configurada.                     |
| `Get-NetAdapter`                           | Muestra los adaptadores de red y su estado.               |
| `Enable-NetAdapter` / `Disable-NetAdapter` | Activa o desactiva un adaptador de red.                   |
| `Get-NetIPConfiguration`                   | Muestra información IP y DNS más detallada.               |
| `Get-NetRoute`                             | Muestra la tabla de rutas IP.                             |
| `New-NetRoute`                             | Crea una nueva ruta estática.                             |
| `Get-DnsClientServerAddress`               | Muestra las direcciones de servidores DNS configuradas.   |
| `Set-DnsClientServerAddress`               | Cambia los servidores DNS de un adaptador.                |
| `Test-Connection <host>`                   | Equivalente avanzado de `ping`, con más opciones.         |
| `Resolve-DnsName <dominio>`                | Consulta DNS (reemplazo de `nslookup`).                   |
| `Get-NetTCPConnection`                     | Muestra las conexiones TCP activas (similar a `netstat`). |
| `Get-NetNeighbor`                          | Muestra la tabla ARP (similar a `arp -a`).                |
| `Get-NetFirewallRule`                      | Lista las reglas activas del Firewall de Windows.         |
| `New-NetFirewallRule`                      | Crea una nueva regla de firewall.                         |
| `Set-NetFirewallRule`                      | Modifica una regla existente del firewall.                |
| `Remove-NetFirewallRule`                   | Elimina una regla del firewall.                           |
| `Get-NetAdapterStatistics`                 | Muestra estadísticas de tráfico de red por adaptador.     |

---

[Regresar a la guía principal](./../readme.md#3-windows)

> **Autor:** Fravelz
