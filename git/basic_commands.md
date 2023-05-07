# Basic commands

- Adding Files to Staging
    ```sh
    # Add all modified and new files
    git add .

    # Add a specific file
    git add file.ext
    ```

- Removing Files
    ```sh
    # Remove files from staging but keep them in the local file system
    git rm --cached file.ext

    # Remove files from Git and local file system
    git rm --force file.ext
    ```

- Committing Changes
    ```sh
    # Commit changes with a message
    git commit -m "Commit message"

    # Combine git add and git commit -m
    git commit -am "Commit message"

    # Amend the previous commit by adding changes
    git commit --amend
    ```

- Pushing Changes to Remote Repository
    ```sh
    # Push changes to a specific branch in the remote repository
    git push -u origin branchName

    # Push changes to all branches in the remote repository
    git push -u origin --all
    ```

- Pulling Changes from Remote Repository
    ```sh
    # Pull changes from the current branch in the remote repository
    git pull

    # Pull changes from a specific branch in the remote repository
    git pull origin branchName

    # Merge unrelated histories while pulling from a remote repository
    git pull origin branch_name --allow-unrelated-histories

    ```