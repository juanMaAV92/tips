# Public and Private Keys

```sh
ssh-keygen -t rsa -b 4096 -C "your@email.com"

# Start the SSH key "server" on your computer
eval $(ssh-agent -s)

# Add your SSH key to this "server"
ssh-add path-to-your-private-key

# Change the local repo URL with the SSH URL
git remote set-url origin sshUrlHere
```

# Tags and Versions

```sh
# Find the commit hash where you want to create a tag
git tag -a v0.1 -m "" commitHash

git tag
git show-ref --tags
git push origin --tags

git clean --dry-run    # Remove unwanted files
git clean -fs
```