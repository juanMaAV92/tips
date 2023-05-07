# Installing NestJs

```sh
node --version
npm i -g @nestjs/cli
nest --version
nest --help
```
## New project


```sh
nest new yourNameProject
cd yourNameProject
yarn install
yarn star:dev
```

start a server on port 3000 by default
http://localhost:3000/  

> Note: disable prettier = `yarn remove prettier`
```

## generating code

These commands help in the rapid development of a NestJS application by quickly generating boilerplate code for modules, controllers, services, CRUD operations, and validation pipe

```sh
# Generate a module
nest g mo pathName

# Generate a controller
nest g co pathName 

# Generate a service
nest g s pathName --no-spec
    # All services are providers, but not all providers are services
    
# Generate CRUD
nest g resource pathName --no-spec

# Generate a pipe (for validation)
nest g pi common/pipes/pipesName --no-spec
```


# Autodocumentation

- add in main.ts before app.listen()

```typescript
const config = new DocumentBuilder()
    .setTitle('Cats example')
    .setDescription('The cats API description')
    .setVersion('1.0')
    .addTag('cats')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);
```