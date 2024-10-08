
# GitHub Actions - docker Image

- Crear las `secrets` en el repositorio de github en `Settings` -> `Secrets` -> `New repository secret`
- Crear un archivo `docker-image.yml` en la carpeta `.github/workflows/` del repositorio, ingresando al repositorio en la pestaña `Actions` y seleccionando `Set up this workflow`
- formas del mensaje del commit para generar las versiones de acuerdo al `.yml` [Semantic Version](https://github.com/marketplace/actions/git-semantic-version?version=v4.0.3)
* `major:` : genera la versión mayor
* `feat:` : genera la versión menor
* `cualquier mensaje`: genera una versión de pre-release

```shell
- crear un actions desde github

```shell
# docker-image.yml

name: Docker Image CI

on:
  push:
    branches: ["main"]
  pull_request:
    branches: ["main"]

jobs:
    build:

        runs-on: ubuntu-latest
    
        steps:
        - name: Checkout code
            uses: actions/checkout@v3
            with:
                fetch-depth: 0

        - name: Git Semantic Version
            uses: PaulHatch/semantic-version@v4.0.3
            with:
                major_pattern: "major:"
                minor_pattern: "feat:"
                format: "${major}.${minor}.${patch}-prerelease-${increment}"
            id: version

        - name: Docker login
            env:
                DOCKER_USER: ${{ secrets.DOCKER_USER }}
                DOCKER_PASSWORD: ${{ secrets.DOCKER_PASSWORD }}
            run: |
                echo $DOCKER_PASSWORD | docker login -u $DOCKER_USER --password-stdin
        
        - name: Build the Docker image
            env:
                NEW_VERSION: ${{ steps.version.outputs.new_version }}
            run: |
                docker build -t username/my-image:$NEW_VERSION .
                docker build -t username/my-image:latest .
    
        - name: Push the Docker image
            env:
                NEW_VERSION: ${{ steps.version.outputs.new_version }}
            run: |
                docker push username/my-image:$NEW_VERSION
                docker push username/my-image:latest

```