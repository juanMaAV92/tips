# Docker in Linux Mint

- Uninstall old versions
    ```sh
    sudo apt-get remove docker docker-engine docker.io containerd runc

    # Uninstall Docker Engine, CLI, containerd and Docker Compose packages
    sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

    # Images, containers, volumes, or custom configuration
    sudo rm -rf /var/lib/docker
    sudo rm -rf /var/lib/container

## Docker engine and compose

 Install the package with apt as follows:

- For non-Gnome Desktop environments, gnome-terminal must be installed: 
    ```sh
    sudo apt install gnome-terminal
    ```

- installing with apt command
    ```sh
    sudo apt install docker.io 

    docker --version    

    sudo systemctl status docker

    sudo systemctl enable <<now docker

    sudo docker run hello-world     

    sudo docker version
    ```

-   Download and install compose [CLI plugin](https://docs.docker.com/compose/install/linux/#install-the-plugin-manually). This command downloads the latest release of Docker Compose (from the Compose releases repository) and installs Compose for the active user under $HOME directory.

    ```sh
    DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
    mkdir -p $DOCKER_CONFIG/cli-plugins
    curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
    ```
    
    - Apply executable permissions to the binary
        ```sh
        chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
        docker compose version
        ```

    - First, confirm the latest version available in their [releases page](https://github.com/docker/compose/releases/tag/v2.16.0)

```sh
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

    sudo chmod +x /usr/local/bin/docker-compose

    docker-compose --version
```


- Dar permisos de administrador en linux
```sh
# Para conocer el nomber de usuario
whoami

sudo usermod -aG docker userName


```