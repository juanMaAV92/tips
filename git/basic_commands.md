# Basic commands

## git status

```git status```  muestra el estado del árbol de trabajo (y del área de almacenamiento provisional). Permite ver los cambios que Git está siguiendo en ese momento para poder decidir si quiere pedir a Git que tome otra instantánea.

## git add

```git add```es el comando que se usa para indicar a Git que empiece a realizar un seguimiento de los cambios en determinados archivos. 

El término técnico es almacenamiento provisional de estos cambios. Va a usar ```git add``` para almacenar provisionalmente los cambios a fin de prepararse para una confirmación. Todos los cambios en los archivos que se han agregado pero que aún no se han confirmado se almacenan en el área de almacenamiento provisional.

- Agregar el archivos al índice de Git
```sh
    # Add all modified and new files
    git add .

    # Add a specific file
    git add file.ext
```
> El índice de Git es un área de almacenamiento provisional para las confirmaciones. Se trata de una lista de todas las versiones de archivo que van a formar parte de la siguiente confirmación que se haga.

## git commit

Después de haber almacenado provisionalmente algunos cambios para su confirmación, puede guardar el trabajo en una instantánea si invoca al comando ``` git commit```. La confirmación de cambios significa que se coloca una copia (del archivo, el directorio u otra "cosa") en el repositorio como una nueva versión.



- Committing Changes
```sh
    # Commit changes with a message
    git commit -m "Commit message"

    # Combine git add and git commit -m
    git commit -am "Commit message"

    # Amend the previous commit by adding changes
    git commit --amend

    # Amend the previous commit by adding changes with not description text
    git commit --amend --no-edit
```
>La opción **--no-edit** indica a Git que realice el cambio sin cambiar el mensaje de confirmación. También puede usar **--amend** para editar un mensaje de confirmación, para agregar archivos dejados accidentalmente fuera de la confirmación o para quitar archivos agregados por equivocación.


## Recuperación de archivos: git reset

También puede eliminar un archivo con ```git rm```. Este comando elimina el archivo en el disco, pero también hace que Git registre su eliminación en el índice.


Por lo tanto, si ha ejecutado este comando:

Bash

Copiar
git rm index.html
git checkout -- index.html
Git no restauraría index.html fácilmente. Por el contrario, se obtendría un error como este ejemplo:

Resultado

Copiar
error: pathspec 'index.html' did not match any file(s) known to git.
Para recuperar index.html, habría que usar otra técnica: git reset. Puede usar git reset para anular el almacenamiento provisional de los cambios.

index.html se puede recuperar con estos dos comandos:

Bash

Copiar
git reset HEAD index.html
git checkout -- index.html
Aquí, git reset revierte la eliminación del archivo del almacenamiento provisional de Git. Este comando devuelve el archivo al índice, aunque sigue eliminado del disco. Luego se puede restaurar en el disco desde el índice con git checkout.
- Removing Files
```sh
    # Remove files from staging but keep them in the local file system
    git rm --cached file.ext

    # Remove files from Git and local file system
    git rm --force file.ext
```

## Reversión de una confirmación: git revert
El último comando importante que se debe conocer para corregir errores con Git es git revert. git checkout solo funciona en situaciones en las que los cambios que se van a deshacer están en el índice. Después de confirmar los cambios, debe emplear otra estrategia para deshacerlos. En este caso se puede usar git revert para revertir la confirmación anterior. Crea otra confirmación que cancela la primera.

Se puede usar git revert HEAD para realizar una confirmación exactamente opuesta a la última, con lo que esta se deshace y deja todo el historial intacto. La parte HEAD del comando simplemente indica a Git que se quiere "deshacer" solo la última confirmación.

Por otro lado, también se puede quitar la confirmación más reciente con el comando git reset:

Bash

Copiar
git reset --hard HEAD^
Git ofrece varios tipos de restablecimientos. El valor predeterminado es --mixed, que restablece el índice, pero no el árbol de trabajo; también mueve HEAD si se especifica otra confirmación. La opción --soft solo mueve HEAD y deja el índice y el árbol de trabajo sin cambios. Esta opción deja todos los cambios como "pendientes de confirmar", como indicaría git status. Un restablecimiento --hard cambia el índice y el árbol de trabajo para que coincidan con la confirmación especificada; los cambios realizados en los archivos seguidos se descartan.

git revert --no-edit HEAD
La marca --no-edit aquí indica a Git que no se quiere agregar un mensaje de confirmación para esta acción.


- Pushing Changes to Remote Repository
```sh
    # Push changes to a specific branch in the remote repository
    git push -u origin branchName

    # Force push changes to a specific branch in the remote repository
    git push -f origin branchName

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