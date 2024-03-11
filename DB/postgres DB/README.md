<p align="center">
  <a href="https://www.postgresql.org/" target="blank"><img src="https://devtalles.com/images/postgresql.png" width="300" alt="postgresql Logo" /></a>
</p>

# Guía practica con PostgreSQL


### Instalaciones recomendadas


* [Docker Desktop](https://www.docker.com/get-started)
* [DBeaver](https://dbeaver.io/) 
* [Table Plus](https://tableplus.com/) 



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