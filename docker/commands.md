# Useful commands
Cheat sheet by [Fernando Herrera Dev/Talles](https://devtalles.com/files/docker-cheat-sheet.pdf)

- management
    ```sh
    sudo docker info   

    # Shows the containers running on the host
    sudo docker ps 

    # Delete one or more containers and it's volume
    docker rm -v <container>

    # stop one container
    docker stop <container>

    # start one container
    docker start <options> <container>

    # logs
    docker log <containerId>
    ```

- images
    ```sh
    # Shows the images available on the host
    sudo docker images 

    # Delete an image from localhost
    sudo docker image rm <image> 
    ```

- volumes
    ```sh
    # Shows the volumes located on the host
    sudo docker volume ls 
    
    # Deletes the specified volume from the host
    sudo docker volume rm <volume> 
    ```

