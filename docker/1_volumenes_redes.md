# Volumenes y Redes

## Preparación

1. Montar la imagen de MariaDB con el tag jammy, publicar en el puerto 3306 del contenedor con el puerto 3306 de nuestro equipo, colocarle el nombre al contenedor de __world-db__ (--name world-db) y definir las siguientes variables de entorno:
    * MARIADB_USER=example-user
    * MARIADB_PASSWORD=user-password
    * MARIADB_ROOT_PASSWORD=root-secret-password
    * MARIADB_DATABASE=world-db

2. Conectarse con un gestor a la base de datos con las credenciales del usuario (NO EL ROOT)
3. Conectarse a la base de datos `world-db`
4. Ejecutar el query de creación de tablas e inserción proporcionado en `./materia_apoyo/world.sql`

## Tipo de Volumen

* __Named Volume__: Es el tipo de volumen más comun. Sirve persistir datos de un contenedor.
    ```sh
    # Crear un volumen
    docker volume create volumeName

    # Listar los volumenes
    docker volume ls

    # Inspeccionar un volumen
    docker volume inspect volumeName

    # montar un volumen en un contenedor
    docker container run \
    -dp 3306:3306 \
    --name world-db \
    --env MARIADB_USER=example-user \
    --env MARIADB_PASSWORD=user-password \
    --env MARIADB_ROOT_PASSWORD=root-secret-password \
    --env MARIADB_DATABASE=world-db \
    --volume volumeName:/var/lib/mysql \
    mariadb:jammy
    ```

* __Bind Volume__: Vincula un directorio o archivo del host con un directorio del contenedor.

* __Anonymous Volume__: Es un tipo de volumen que se crea 
automáticamente cuando no se especifica un tipo de volumen.

## Redes

>Nota: Asegurar que el contenedor de MariaDB esta corriendo y que la base de datos esté poblada con el query de `world.sql`

Si dos o más contenedores están en la misma red, pueden comunicarse entre ellos. 

```sh
docker container run \
--name phpmyadmin \
-d \
-e PMA_ARBITRARY=1 \
-p 8080:80 \
phpmyadmin:5.2.0-apache
```

```sh   
# Listar las redes
docker network ls

# Crear una red
docker network create networkName
docker network ls   

# Conectar varios contenedores a una red
docker network connect networkId containerId1
docker network connect networkId containerId2
docker network inspect networkName
```

Asignar una red a un contenedor al momento de crearlo
```sh
docker container run \
--name phpmyadmin \
-d \
-e PMA_ARBITRARY=1 \
-p 8080:80 \
--network networkName \
phpmyadmin:5.2.0-apache
```

> Nota: Para proseguir se debe eliminar todos los contenedores, volumenes y redes creados en este ejercicio.

## Bind Volume

Vamos a instalar todas las dependencias de la aplicacion `./material_apoyo/nest-graphql` en un contenedor con linux+node y luego vamos a montar el directorio de la aplicacion en el contenedor.

```sh
cd ~/docker/material_apoyo/nest-graphql 

# Crear un contenedor con linux y node
docker container run \
--name nest-app \
-w /app \
-p 80:3000 \
-v "$(pwd)":/app \
node:16-alpine3.16 \
sh -c "yarn install && yarn start:dev"
```
>Nota: el comando `-w /app` indica que el directorio de trabajo dentro del contenedor es /app

## Terminal interactiva -it

La terminal interactiva `-it` permite interactuar con el contenedor como si fuera una terminal de linux.

```sh
# Correr la aplicacion en detach mode
docker container run \
--name nest-app \
-w /app \
-dp 80:3000 \
-v "$(pwd)":/app \
node:16-alpine3.16 \
sh -c "yarn install && yarn start:dev"

docker container ls

# Iniciar la terminal interactiva -it
docker exec -it containerId /bin/sh
```
>Nota: Para salir de la terminal interactiva se debe presionar `Ctrl + D` o escribir `exit`