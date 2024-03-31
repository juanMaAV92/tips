# Docker in Linux Mint

- Uninstall old versions
    ```sh
    sudo apt-get remove docker docker-engine docker.io containerd runc
    ```

- Uninstall Docker Engine, CLI, containerd and Docker Compose packages
    ```sh
    sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
    ```
- Images, containers, volumes, or custom configuration
    ```sh
    sudo rm -rf /var/lib/docker
    sudo rm -rf /var/lib/container
    ```

## Docker Desktop on Debian

### KVM virtualization support

- Install the `cpu-checker` package to determine if your CPU supports hardware virtualization:
    ```sh
    sudo apt install cpu-checker
    ```

- Run to load the KVM modules:
    ```sh
    modprobe kvm

    modprobre kvm_intel     # for Intel processors
    modprobe kvm_amd        # for AMD processors
    ```

- If the above commands fail, you can view the diagnostics by running:

    ```sh
    kvm-ok
    ```
- To check if the KVM modules are enabled, run:
    ```sh
    lsmod | grep kvm
    ```

- To check ownership of `/dev/kvm`, run :
    ```sh
    ls -l /dev/kvm
    ```

- Add your user to the kvm group in order to access the kvm device:
    ```sh
    sudo usermod -aG kvm $USER
    ```

### Install Docker Desktop

- for non-Gnome Desktop environments, `gnome-terminal` must be installed: 
    ```sh
    sudo apt install gnome-terminal
    ```

Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker apt repository. Afterward, you can install and update Docker from the repository.

- Set up the repository
    ```sh
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian bookworm stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
    ```
    > note: replace this line `\ $(. /etc/os-release && echo "$VERSION_CODENAME")` with the codename of your Debian release. [Kali](https://www.kali.org/docs/containers/installing-docker-on-kali/) = `bookworm`

- Download latest DEB package
    ```sh
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    ```

- Install packages
    ```sh
    sudo apt-get install ./docker-desktop-<version>-<arch>.deb
    ```

- Run Docker Desktop
    ```sh
    systemctl --user start docker-desktop
    ```


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