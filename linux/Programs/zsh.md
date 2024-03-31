# Zsh Shell

- Install Zsh
    ```sh
    sudo apt install zsh -y
    sudo chsh -s /usr/bin/zsh $USER
    echo $SHELL
    ```

- LogOut session and open the terminal.

## Install OhMyZSH framework
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- Plugin zsh-syntax-highlighting
    ```sh
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```

- add the plugin in .zshrc
    ```sh
    nano ~/.zshrc
    ```

    - add the plugin in the plugins section
        ```
        plugins=(
        git
        zsh-syntax-highlighting
        ) 
        ```

    - Save and close file


## Font

Download JetBrainsMono Nerd Font in [nerdfonst](https://www.nerdfonts.com/font-downloads)

- In case you don't have the fonts folder execute the mkdir command
    ```sh
    mkdir ~/.fonts && cd ~/.fonts
    unzip ~/Downloads/JetBrainsMono.zip
    ```

- Powerlevel10k
    ```
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ```
    
    - Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in ~/.zshrc.

## Finish installation

>Note: If the instruction doesn't appear or the shell is not updated, execute `zsh` in the terminal.

- Follow the instruction

## other configuration.

- To set enviroment variable

    ```sh
    cd ~
    nano .zshenv
    source .zshenv
    ```

- add ``` typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet``` in __~/.p10k.zsh__
