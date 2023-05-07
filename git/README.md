# Git repository setup and configuration

> Note: all variables written in camel case mean you have to replaced it with your specific case

- Configuration
    ```sh
    git config --global user.name ""
    git config --global user.email ""
    git config --list
    git config --global alias.nombreAlias "command to create an alias."
    ```

- First Step
    ```sh
    # Initialize a folder as a repository with a initial branch called "main"
    git init --initial-branch=main

    #Change the name branch 
    git branch -m currentBranchName newName
    ```

- Remote repository

    ```sh
    # add a new remote repository to the local Git repository with the name "origin" 
    git remote add origin remoteURLRepo

    #  removes a remote reference from the local repository. the 'origin' argument is the name of the remote to be removed.
    git remote rm origin

    # shows the list of remote repositories that are currently associated with the local repository
    git remote -v
    ```

