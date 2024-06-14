# DOCKER
Cheat sheet by [Fernando Herrera Dev/Talles](https://devtalles.com/files/docker-cheat-sheet.pdf)

## Fundamentos

### Hello Worl de docker
```sh
# Descargar la imagen
docker pull hello-world

# Correr la imagen
docker container run hello-world

# Listar todos los contenedores que estan corriendo
docker container ls

# Correr el contenerdor
docker container start containerId
```
> Nota: reemplazar `containerId` por el id del contenedor que se desea correr

### Borrar contenedores
```sh
# Listar todos los contenedores que estan corriendo y los que no
docker container ls -a

# Detener un contenedor
docker container stop containerId

# Borrar un contenedor especifico
docker container rm containerId1 containerId2

# Forzar el borrado de un contenedor
docker container rm -f containerId

# Borrar todos los contenedores detenidos
docker container prune
```
> Nota: reemplazar `containerId` por el id del contenedor que se desea borrar

###  Borrar imagenes
```sh
# Listar todas las imagenes
docker image ls

# Borrar una imagen especifica
docker image rm imageId1 imageId2
```
> Nota: reemplazar `imageId` por el id de la imagen que se desea borrar

### Publish and Detached mode
```sh
docker container run docker/getting-started
# este comando corre un contenedor pero no expone el puerto y la terminal queda bloqueada (presionar ctrl + c para salir)

docker container run -d docker/getting-started
# este comando corre un contenedor en modo detached, es decir, corre en segundo plano

docker container run -d -p 8080:80 docker/getting-started
# este comando corre un contenedor en modo detached y expone el puerto 8080 de5l host (primer puerto) al puerto 80 del contenedor (segundo puerto)
```

### Variables de entorno
```sh
docker pull postgres

docker container run --name some-postgres -dp 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -d postgres
# este comando corre un contenedor de postgres con la contraseña   mysecretpassword
```
> Nota: --name es el nombre del contenedor, -e es la variable de entorno, -d es el modo detached, postgres es la imagen

### Multiples instancias
```sh
docker container run \
    --name some-postgres-1 \
    -e POSTGRES_PASSWORD=mypass1 \
    -dp 5432:5432 \
    postgres

docker container run \
    --name some-postgres-2 \
    -e POSTGRES_PASSWORD=mypass2 \
    -dp 5433:5432 \
    postgres:14-alpine3.17
```
> Nota: el simbolo \ se usa para continuar en la siguiente linea (OS linux y MacOS), para windows se usa `

### Logs del contenedor
```sh
docker pull mariadb:jammy

docker container run -dp  3306:3306 -e MARIADB_RANDOM_ROOT_PASSWORD=yes mariadb:jammy

docker container logs containerId
```
> Nota: reemplazar `containerId` por el id del contenedor que se desea ver los logs