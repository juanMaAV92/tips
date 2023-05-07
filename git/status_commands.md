# Status of changes

```sh
# status of files in the repository
git status                         

# full history of the file
git log                                     
git log --all --graph --decorate --oneline

# Create an alias
alias gitTree="git log --all -graph --decorate --oneline"

# specific changes made to the file from a commit
git log --stat                              
git log filename.ext

# historical and specific changes made to a file
git show filename.ext              

# compare directory with staging
git diff        

# compare changes between versions           
git diff version1-code version2-code        

# entire history of the repository
git reflog                                  

# search for the word "color" in the entire project
git grep color                    

# show output indicating which line the search term appears on
git grep -n color   

# search for the word "color" in all commits that contain it
git log -S color                            #
```