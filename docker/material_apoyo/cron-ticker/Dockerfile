
# FROM --platform=linux/amd64 node:20-alpine3.20
# FROM --platform=$BUILDPLATFORM node:20-alpine3.20
FROM node:20-alpine3.20 as deps
WORKDIR /app
COPY package.json ./
RUN npm install

FROM node:20-alpine3.20 as builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run test

FROM node:20-alpine3.20 as prod-deps
WORKDIR /app
COPY package.json ./
RUN npm install --prod

FROM node:20-alpine3.20 as runner
WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY app.js ./
COPY tasks/ ./tasks
CMD ["node", "app.js"]
