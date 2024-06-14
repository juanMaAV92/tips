# Multi-container apps - Docker Compose

>Nota: ubicarse en la carpeta `/material_apoyo/postgres-pgadmin/` y correr el siguiente comando `docker compose up -d`

## Limpiar contenedores

En algunos casos, es necesario limpiar los contenedores que se han creado al realizar cambios en el docker-compose.yml. Para ello, se puede utilizar el siguiente comando:

```bash
docker compose down
docker volume prune    # Elimina los volúmenes no utilizados
docker volume rm <volume_name>    # Elimina un volumen específico
```

## Ejemplo multiContainer

* Cargar una semilla con la data inicial
```http
http://localhost:3000/api/v2/seed
```

* Consultar listado
```http
http://localhost:3000/api/v2/pokemon?limit=20&offset=40
```

