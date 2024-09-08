# Multi state

> Nota: para correr la app de ejemplo `teslo-shop` se debe ubicar en la carpeta `material_apoyo/teslo-shop` y ejecutar el comando `yarn install` y seguir las instrucciones del archivo `README.md`

- ver el dockerfile y el docker-compose.yml

```bash
docker compose build
docker compose up
```

Para ejecutar el docker compose de producción

```bash
docker compose -f docker-compose.prod.yml build serviceName
docker compose -f docker-compose.prod.yml up
```