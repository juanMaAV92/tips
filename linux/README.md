# Linux-Mint Cinnamon

## Installing
- In the BIOS change the Boot option in Legacy, no UEFI. Also, enable IOMMU in Peripherals to enable de 1.0 and 2.0 USB port, this will de 3.0 USB port. Be careful not to plug your keyboard, mouse or the bootable USB in 3.0 port

- Follow the installer manager, I recommend you create the following partition:
    - "/EFI    512MB
    - "/SWAP   the same size of RAM
    - "/"       at least 50GB
    - "/home"   house all you want

&nbsp;
- Before reset run the following command
```sh
sudo nano /etc/default/grud
```
-   Edit the empty quotes in this line, this makes 3.0 ports work
```sh
GRUB_CMDLINE_LINUX="iommu=soft"
```

-  Save the changes, exit and run the command
```sh
sudo update-grud
```

-   Reset and Disable IOMMU in the BIOS.


## first config
- Bluetooh don't recognize device
```sh
sudo dmesg | grep -i bluetooth | grep -i firmware
```

- VSCODE, download the .deb file from [VSCode](https://code.visualstudio.com/docs/?dv=linux64_deb)
```sh
cd Downloads
sudo apt install ./<file>.deb
```

- Git
```sh
sudo apt-get install git
```

## Zsh Terminal
```
sudo apt install zsh -y
sudo chsh -s /usr/bin/zsh $USER
echo $SHELL
```

- LogOut session and open the terminal. Press (2)

- Install OhMyZSH
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- Plugins
```sh
#zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

nano ~/.zshrc

#add the next plugins
plugins=(
git
zsh-syntax-highlighting
) 
# Save and close file

exit
```

- Font
    - Download JetBrainsMono Nerd Font in [nerdfonst](https://www.nerdfonts.com/font-downloads)

    ```sh
    # In case you don't have the fonts folder
    # mkdir ~/.fonts && cd ~/.fonts
    unzip ~/Downloads/JetBrainsMono.zip
    ```

- Powerlevel10k
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

#  Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.

exit
```

    - Follow the instruction