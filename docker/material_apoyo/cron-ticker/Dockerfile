
# FROM --platform=linux/amd64 node:20-alpine3.20
FROM --platform=$BUILDPLATFORM node:20-alpine3.20

# esta versión de linux tiene una carpeta /app donde se debe copiar el código fuente
WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

# Realizar testing
RUN npm run test

# Eliminar archivos y directorios que no se necesitan en Producción
RUN rm -rf test && rm -rf node_modules

# Instalar dependencias de producción
RUN npm install --prod

# Comando run para ejecutar la aplicación
CMD ["node", "app.js"]
