# Branches commands

<div style="background-color: #1E90FF; border: 1px solid #a6d995; padding: 10px;">
<b>Note:</b> all variables written in camel case mean you have to replaced it with your specific case
</div>

\\


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

<div style="background-color: #1E90FF; border: 1px solid #a6d995; padding: 10px;">
<b>Info:</b> The git stash command saves the current Staging work to a list designed to be temporary called Stash, so that it can be retrieved in the future. The stashed behaves like a Stack of data, behaving in a LIFO (Last In, First Out way)
</div>


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

<div style="background-color: #1E90FF; border: 1px solid #a6d995; padding: 10px;">
<b>Note:</b> merge any other branches with the current branch. combines the changes that have been made in both branches, creating a new merge commit that combines both development histories into a single timeline.
</div>


    ```sh
    git merge branchNameToMerge

    # cancel merge
    git merge --abort               

    # Reapply commits on top of another branch. The specified branch will be used as the new base for the current branch.
    git rebase branch               
    ```


- moving through time

    ```sh
    # Is used to move the HEAD pointer to a specific branch or commit
    git checkout branch_or_commit_id   
    ```

