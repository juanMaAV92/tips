# DockerFile

> Nota: para correr la app de ejemplo `cron-ticker` se debe ubicar en la carpeta `material_apoyo/cron-ticker` y ejecutar el comando `npm start`

## Contruir una imagen

Para construir una imagen se debe crear un archivo llamado `Dockerfile` en la raíz del proyecto. Este archivo contiene las instrucciones necesarias para construir una imagen.

En la terminal se debe ejecutar el siguiente comando:

```bash
docker build -t <nombre_imagen>:<tag_name? .

# corre la imagen
docker container run <nombre_imagen>
```

Para entrar a la terminal de un contenedor con linux Alpine se debe ejecutar el siguiente comando:

```bash
docker exec -it <id_container> /bin/sh

# Para salir de la terminal
exit
```

## BUILDX

crear imágenes multiplataforma con `buildx`:

```bash
# Lista los builders existentes
docker builx ls

# Crea un builder
docker buildx create --name <mybuilderName> --driver docker-container --bootstrap

# Selecciona el builder
docker buildx use <mybuilderName>

# Construir una imagen
docker buildx build --platform linux/amd64,linux/arm64 -t <user_name>/<nombre_imagen>:<tag_name> .

```