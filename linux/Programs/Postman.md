# Postman

Descargar el archivo .tar.gz de la pagina oficial de [Postman](https://www.postman.com/downloads/)

- Descomprimir el __.tar__  en la carpeta __/opt__ 

    ```sh
    cd ~/Downloads
    sudo tar -xvzf postman-linux-x64-*.tar.gz -C /opt
    ```

- Crear un enlace simbolico en __/usr/local/bin__ para poder ejecutar __Postman__ desde la terminal

    ```sh
    sudo ln -s /opt/Postman/Postman /usr/local/bin/postman
    ```

- Crear un lanzador de aplicaciones para __Postman__

    ```sh
    sudo nano /usr/share/applications/postman.desktop
    ```

- en el archivo __postman.desktop__ agregar el siguiente contenido
    ```
    [Desktop Entry]
    Type=Application
    Name=Postman
    Icon=/opt/Postman/app/resources/app/assets/icon.png
    Exec=/usr/local/bin/postman
    Comment=Postman GUI
    Categories=Development;Utilities;

    ```
