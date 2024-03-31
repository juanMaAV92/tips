## Zsh Terminal

- Install Zsh
    ```sh
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

- To set enviroment variable

    ```sh
    cd ~
    nano .zshenv
    source .zshenv
    ```

- add ``` typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet``` in __~/.p10k.zsh__
