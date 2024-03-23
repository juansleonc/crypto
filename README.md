# Crypto Project

## Descripción

El proyecto **Crypto** es una aplicación diseñada para permitir a los usuarios definir un balance en dólares a invertir en tres diferentes criptomonedas: **Bitcoin**, **Ether** y **Cardano**. La aplicación calcula la ganancia anual para cada moneda asumiendo un retorno mensual del 5% para Bitcoin, 4.2% para Ether y 1% para Cardano. Además, muestra el balance proyectado final de la inversión y su equivalente en criptomonedas. La aplicación también incluye una tabla con información actualizada de estas tres criptomonedas, ofreciendo la opción de exportar esta información a CSV y a JSON.

## Requisitos Previos

Antes de comenzar, asegúrate de tener instalado **Docker** y **Docker Compose** en tu sistema. Para más información sobre cómo instalar Docker, visita la [documentación oficial de Docker](https://docs.docker.com/get-docker/).

## Instalación y Ejecución

Para poner en marcha el proyecto **Crypto**, sigue estos pasos:

1. **Clonar el Repositorio:**

   ```bash
   git clone https://github.com/juansleonc/crypto.git
   cd crypto
  ```

### Usando Docker Compose:

Para ejecutar el servicio y tener acceso a los puertos necesarios:

```bash
docker compose run --service-ports crypto
```

O, para levantar el servicio en segundo plano:

```bash
docker compose up crypto
```
## Tecnologías Utilizadas

Este proyecto está desarrollado con las siguientes tecnologías y librerías:

- Ruby 3.0.6
- Rails 6.1.7
- MongoDB (a través de Mongoid 7.0)
- Y otras gemas como Devise, Puma, Hotwire, entre otras.

## Ejecución de Pruebas

Para ejecutar las pruebas unitarias y de integración:

1. Ejecuta un contenedor Docker para el entorno de la aplicación:


2. Dentro del contenedor, ejecuta las pruebas con RSpec:

## Contacto

Juan Sebastian Leon Cadena - juansleonc@gmail.com

URL del proyecto: https://github.com/juansleonc/crypto
