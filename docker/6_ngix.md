# Nginx

> Nota: usar el material de apoyo `material_apoyo/react-heroes`, cuando corra la aplicación en el navegador digitando `http://localhost:8080` se visualizará la página de inicio de la del sitio web. 

```sh
npm install
npm run dev
```

Crear la imagen

```sh
docker build -t heroes-app . --no-cache
```

Correr el contenedor

```sh
docker container run -d -p 80:80 heroes-app
```

# Configuración de Nginx

```sh
# Correr el contenedor de Nginx e ingresar al contenedor
docker exec -it <container_id> bash
cd /etc/nginx/conf.d

cat default.conf
```




