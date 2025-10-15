# Google Doorks

[Regresar a la guía principal](./../readme.md#7-osint)

## ¿Qué es?

Es una técnica de búsqueda avanzada en Google, para poder conocer información concreta a base de poder ir aplicando filtros en los resultados, operadores conocidos como dorks.

## Operadores dorks

Nota el asterisco (*) dice que cualquier palabra puede pasar el filtro, normalmente se utiliza para cuando se necesita filtrar más resultados.

``` txt
site:reddit.*
```

Esto apunta a todas las páginas que empiezan por reddit sin importar como termine, pueden terminal por ejemplo reddit.us, reddit.arg, reddit.paypal, o reddit.store, etc...

También otra consideración es que puedes utilizar no solo palabra en clave, sino también, frases claves para buscar y se hace con "", de la siguiente manera.

``` txt
intitle:"Tomar un Mate"
```

Es importante tener en cuenta que todos estos operadores están escritos de la manera:

``` txt
clave:valor
```

Sin espacios a menos que se usen comillas dobles, pero todo lo que esta afuera eso lo reconoce Google como palabras de una búsqueda normal.

``` txt
intitle:"Uala prestamos" prestamos sin intereses
```

En este caso buscara **préstamos sin intereses**, y luego filtrara por títulos que contengan **Uala préstamos**.

1. El primer operador dork básico es site, si usas este operador luego (:) dos puntos, y un dominio, buscara todos los resultados que contengan ese dominio.

``` txt
site:reddit.com
```

2. inurl, busca en la URL de Google, todos los que contengan la palabra clave, en la URL.

``` txt
inurl:palabraclave
```

3. intitle, busca utilizando la palabra, y filtrando por títulos de la web, los que no contengan ese título o esa palabra clave no son mostrados por el buscador.

``` txt
intitle:tomarmate
```

4. ext y filetype, estos comandos nos permite buscar por extensiones, son muy similares, pero su diferencia radica en que filetype reconoce archivos que Google reconocen, pero ext muestra archivos con la extensión sin importar si el formato lo reconoce o no Google.

``` txt
ext:log Errores de reddit
```

``` txt
filetype:pdfs Cuent
```

Con lo anterior se puede hacer búsquedas en Google con filtros, y encontrar información pública que a veces los creadores de webs creen que no son públicas de sus webs, y otras cosas, es importante tener en cuenta que deberías buscar palabras claves o frases claves según lo que quieras buscar, aunque hay que tener cuidado porque se pueden indexar sitios http: que no son seguros y que el dueño de la página si quiere te puede doxear o hackear porque la web no tiene el protocolo https.

En la página web de Google hacking data base, puedes encontrar operadores dorks especializados para búsquedas que se llegan, a tener o usar, para la ciberseguridad.

[Regresar a la guía principal](./../readme.md#7-osint)

> **Autor:** Fravelz
