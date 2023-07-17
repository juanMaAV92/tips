<div style="background-color: #1E90FF; border: 1px solid #a6d995; padding: 10px;">
<b>Note:</b> all variables in camel case means here you have to change it according to your convenience
</div>

* change owner
```sh
chown -R $(whoami):$(whoami) folderName
```

| Command                    | Description                                                                                       |
|:---------------------------|:--------------------------------------------------------------------------------------------------|
| chmod 755 mytext           | Changes the permissions of the file to 755.                                                      |
| chmod u-r mytext           | Removes the read permission from the file.                                                        |
| chmod u=rwx,go=r mytext    | Adds read, write, and execute permission for the user and read permission for the group and others.|
| id                         | Displays the user ID.                                                                             |
| whoami                     | Displays the name of the logged-in user.                                                          |




| Owner | Group | World |
|:-----:|:-----:|:-----:|
|  rwx  |  r-x  | r-x   |
|  111  |  101  | 101   |



| Octal | Binary | Permissions |
|:-----:|:------:|:-----------:|
|   0   |  000   |     ---     |
|   1   |  001   |     --x     |
|   2   |  010   |     -w-     |
|   3   |  011   |     -wx     |
|   4   |  100   |     r--     |
|   5   |  101   |     r-x     |
|   6   |  110   |     rw-     |
|   7   |  111   |     rwx     |


| Symbol | Meaning          |
|:------:|:----------------|
| u      | User             |
| g      | Group            |
| o      | Others (World)   |
| a      | All (Applies to) |
