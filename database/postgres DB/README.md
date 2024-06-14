# Guía practica con PostgreSQL


## Instalaciones recomendadas


* [Docker Desktop](https://www.docker.com/get-started)
* [DBeaver](https://dbeaver.io/) 
* [Table Plus](https://tableplus.com/) 
* [DBGate](https://dbgate.org/)



Descargar imágenes de Docker

```sh
sudo docker pull postgres:15.3
sudo docker pull dpage/pgadmin4
```

## Levantar base de datos

```sh
cd ~/database/postgres
sudo docker-compose up -d         
```
Revisar el el archivo **docker-compose.yml** para ver las configuraciones de la base de datos.

## Herramienta diseño de base de datos

[DBDiagram](https://dbdiagram.io)

- Base de datos de ejemplos:
  * [Medium](https://dbdiagram.io/d/Medium-661d473803593b6b61093f52) - blog
  * [Warehouse](https://dbdiagram.io/d/warehouse-DB-665907bdb65d933879226a16) - sistema de inventario
  * [Air-bnb](https://drawsql.app/templates/airbnb) - sistema de reservas

