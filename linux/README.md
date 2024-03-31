# Linux based on debian

<div align="center"> 
  <img src="../img/debian.png" width="40%">
</div>

## Create a bootable USB on Linux

>Note: On development


## Installing


- In the BIOS change the Boot option in Legacy, no UEFI. Also, enable IOMMU in Peripherals to enable de 1.0 and 2.0 USB port, this will off the 3.0 USB port. Be careful not to plug your keyboard, mouse or the bootable USB in 3.0 port

- Follow the installer manager, I recommend you create the following partition:
    - `EFI`    512MB, no format, no mount point
    - `/`      at least 50GB
    - `/var`   10GB ext4
    - `/SWAP`  1GB swrap
    - `/tmp`   2GB ext4
    - `/home`  all you want

&nbsp;
- Before reset run the following command
    ```sh
    sudo nano /etc/default/grub
    ```
    -   Edit the empty quotes in this line, this makes 3.0 ports work
        ```sh
        GRUB_CMDLINE_LINUX="iommu=soft"
        ```

-  Save the changes, exit and run the command
    ```sh
    sudo update-grub
    ```

-   Reset and Disable IOMMU in the BIOS.

## Dev programs

- VSCODE
    - download the .deb file from [VSCode](https://code.visualstudio.com/docs/?dv=linux64_deb)
        ```sh
        cd ~/Downloads
        sudo apt install ./<file>.deb
        ```

- [Git](https://github.com/juanMaAV92/tips/tree/main/git)
- [Postman](https://github.com/juanMaAV92/tips/blob/main/linux/Programs/Postman.md)
- [Docker](https://github.com/juanMaAV92/tips/tree/main/docker)
- IntelliJ IDES
- [Zsh Terminal](https://github.com/juanMaAV92/tips/blob/main/linux/Programs/zsh.md)


## Some issues
- Bluetooh don't recognize device
```sh
sudo dmesg | grep -i bluetooth | grep -i firmware
```