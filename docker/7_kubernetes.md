# Kubernetes

> Nota: se trabaja la sección con el material de apoyo de la carpeta `k8s-teslo`

## Intalación minikube 

Descargar [Minikube](https://minikube.sigs.k8s.io/docs/) e instalar

Minikube es una herramienta que permite ejecutar un clúster de Kubernetes localmente. Crea un contener preconfigurado con Kubernetes y Docker para administrar el cluster.

```bash
minikube version

# Iniciar minikube
minikube start
```

> Nota: para los secrets, estos se deben encriptar en base64 [link](https://codebeautify.org/base64-encode) o escribir el siguiente comando en la terminal

```bash
echo -n someString | base64
```

## Desplegar un pod

```bash
cd ~/k8s-teslo

kubectl get all
kubectl apply -f postgres-config.yaml
kubectl apply -f postgres-secrets.yaml
kubectl apply -f postgres.yaml
kubectl get all

# Para ver información del deployment
kubectl describe <deployment-name>

# Para ver los logs de un pod
kubectl logs <pod-name>
```

### Agregar PG al cluster

```bash
kubectl apply -f pg-admin-secrets.yaml
kubectl apply -f pg-admin.yaml
kubectl get all
```

- Todo se está ejecutando en el contener de minikube, para exponer el puerto, se debe buscar el servicio a exponer y escribir la siguiente linea de codigo

```bash
kubectl get all
minikube service <service-name>
```

### Agregar Backend

```bash
kubectl apply -f backend-secrets.yaml
kubectl apply -f backend.yaml
kubectl get all

# Reiniciar un deployment al cambiar un secret
kubectl rollout restart deployment <deployment-name>
```

## Probar backend

```bash
minikube service backend-service
```
url [http://127.0.0.1:64739](http://127.0.0.1:64739/api)