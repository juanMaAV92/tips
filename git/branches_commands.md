# Branches commands

- Change the name of the branch 
    ```sh
    git branch -m oldName newName
    ```

- visualize branches
    ```sh
    # List of branches
    git branch 

    # shows all branches, both local and remote                     
    git branch -a  

    # show relationship between git branches and the list of commits in each of them             
    git show-branch
    ```

    If you want to use a graphical tool, you need to install Gitk
    ```sh
    sudo apt install gitk
    # Open GUI branch viewer
    gitk                            
    ```

- Move between branches
    ```sh
    # This command generates a new branch.
    git branch newBranchName          

    # With this command you can jump from one branch to another.
    git checkout branchName        

    # Generates a branch and moves us to it automatically, that is, it is the combination of git brach and git checkout at the same time.
    git checkout -b newBranchName          
    ```

- Stash

    > Info: The git stash command saves the current Staging work to a list designed to be temporary called Stash, so that it can be retrieved in the future. The stashed behaves like a Stack of data, behaving in a LIFO (Last In, First Out way)


    ```sh
    git stash save "message identifier of the stashed item"

    git stash list
    
    # Return to the last stash
    git stash pop                   
    
    # Delete the last stash
    git stash drop                  
    
    # Create a new branch from the stash
    git stash branch newBranchName    
    ```


- combination of two branches

    > Info: merge any other branches with the current branch. combines the changes that have been made in both branches, creating a new merge commit that combines both development histories into a single timeline.


    ```sh
    git merge branchNameToMerge

    # cancel merge
    git merge --abort               

    # Reapply commits on top of another branch. The specified branch will be used as the new base for the current branch.
    git rebase branch               
    ```


## moving through time without return

- __git reset__ is used to undo changes made to the repository. It is useful when we want to revert to a previous version of the repository. There are three types of reset:

    - soft: This option resets the repository to the specified commit, but keeps the changes in the staging area. This allows us to make additional changes and create a new commit with the updated changes.

        ```sh
        git reset idCommit --soft
        ```

    - hard: This option resets the repository to the specified commit and discards all changes made after that commit. This can be useful when we want to completely undo all changes made after a certain point in the repository's history.

        ```sh
        git reset idCommit --hard
        ```

    - HEAD: This option removes the changes from the staging area, but doesn't delete them. This is the opposite of the git add command and can be useful when we want to remove changes from the staging area, but still keep them in the working directory.

        ```sh
        git reset idCommit HEAD
        ```

## moving to specific place

```sh
# This command will check out a specific version of a file from a previous commit identified by its commit ID.
git checkout idCommit file.ext

# This command will check out a specific version of a file from a branch identified by its name.
git checkout nameBranch file.ext

# This command will discard changes made to all files in the current branch since the last commit, effectively resetting the working directory to the state of the last commit.
git checkout -- .
```