<div style="background-color: #1E90FF; border: 1px solid #a6d995; padding: 10px;">
<b>Note:</b> all variables in camel case means here you have to change it according to your convenience
</div>

## LS operation
| Command                  | Description                                          |
|:-------------------------|:-----------------------------------------------------|
| `-a`                       | List all (including hidden) files and directories    |
| -R                       | List recursively                                     |
| -r                       | List in reverse order                                |
| -t                       | List by last modified time                           |
| -S                       | List by size                                         |
| -l                       | List using long format                               |

## File and Directory Manipulation

| Command                  | Description                                          |
|:-------------------------|:-----------------------------------------------------|
| touch newFile            | Create a new file called newFile                     |
| file myFile              | Display the characteristics of myFile                |
| cp file1 /destination    | Copy file1 to destination                            |
| cp -r dir1 dir1_cp       | Copy directory dir1 and its contents to a new one    |
| mv file1 /destination    | Move file1 to destination                            |
| mv file1 okFile          | Rename file1 to okFile                               |
| rm file1                 | Delete file1                                         |
| rm -ri dir1              | Delete directory dir1 and its contents interactively |
| rm -r dir1               | Delete directory dir1 and its contents directly      |
| ln -s file linkName      | Create a symbolic link to file                       |
| open fileName            | Open the file with the default program (macOS)       |
| xdg-open fileName        | Open the file with the default program (most Linux)  |

## Modifying a File

| Command                           | Description                                                            |
|:----------------------------------|:-----------------------------------------------------------------------|
| head file.txt                     | Display the first 10 lines of text in file.txt                         |
| head -n 20 file.txt               | Display the first 20 lines of text in file.txt                         |
| tail file.txt                     | Display the last 10 lines of text in file.txt                          |
| tail -n 20 file.txt               | Display the last 20 lines of text in file.txt                          |
| less file.txt                     | Explore the file content with pagination                               |
| cat file1 file2                   | Concatenate the content of file1 and file2 to the terminal output      |

## LS wildcards

| Command                           | Description                                                            |
|:----------------------------------|:-----------------------------------------------------------------------|
| *                                 | Matches any character                                                  |
| ?                                 | Matches any single character                                           |
| [characters]                      | Matches any character that is a member of the character set            |
| [!characters]                     | Matches any character that is not a member of the character set        |
| [[:class:]]                       | Matches any character from the class                                   |

## Classes
| Class                             | Description                                                            |
|:----------------------------------|:-----------------------------------------------------------------------|
| [:alnum:]                         | Matches any alphanumeric character                                     |
| [:alpha:]                         | Matches any alphabetic character                                       |
| [:digit:]                         | Matches any digit                                                      |
| [:lower:]                         | Matches any lowercase letter                                           |
| [:upper:]                         | Matches any uppercase letter                                           |

## Useful

| Command                           | Description                                                            |
|:----------------------------------|:-----------------------------------------------------------------------|
| alias l="your command"            | Create an alias for your command                                       |
| type someCommand                  | See command type                                                       |


## I/O redirects and control operators

| Command                | Description                                                                          |
|:-----------------------|:-------------------------------------------------------------------------------------|
| command < fileName     | Redirects the input of a command to a fileName                                       |
| command > fileName     | Redirects the output of a command to a fileName (use with caution, overwrites system)|
| command >> fileName    | Concatenates the output of a command to a fileName. If it does not exist, it creates it. |
| command 2> error.txt   | Redirects the error output of a command to the error.txt file                        |
| command1 \| command2   | Redirects the output of command1 to the input of command2                            |
| command1; command2     | Executes consecutively                                                               |
| command1 & command2    | Executes asynchronously                                                              |
| command1 && command2   | Executes command2 only if command1 was executed successfully                         |
| command1 \|\| command2 | Executes command1 or command2                                                        |

# process 

| Command   | Function                                                                                          |
| ----------| ------------------------------------------------------------------------------------------------- |
| ps        | Displays a table with the processes that are currently running                                    |
| htop      | Displays a table with the processes that are currently running, sudo apt install htop             |
| top       | Displays an interface with the processes that are currently running along with additional information about the resources they consume |
| kill      | Kills the process that you specify                                                                |
| jobs      | paused list processes                                                                             |
| bg 1      | send to bakcground the process 1, this number is not the ID                                       |

