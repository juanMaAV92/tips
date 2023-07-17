# Docker with Python


You have to create a file called : "Dockerfile"
```docker
FROM python:3.8

# create the workSpace, change "workSpace" with your preference name
WORKDIR /workSpace
COPY requirements.txt /workSpace/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /workSpace/requirements.txt

COPY . /workSpace

CMD bash  -c "while true: do sleep 1; done"
```

create the file "docker-compose.yml"

```docker
services:
    # change application-name with your preference name and workSpace
    application-name:
        build:
            context: .
            dockerfile: Dockerfile
        volumnes:
        - .:/workSpace
        
```

execute in terminal

```sh
docker-compose build

docker-compose up -d

# Container status
docker-compose ps  

# change application-name with your name application
docker-compose exec application-name bash

# to exit
exit

docker-compose down
```
## Run web server

You have to modify the "Dockerfile" changing the last line with
```docker
CMD ["uvicorn", "main:app", "--host", "--port", "80"]
```

create the file "docker-compose.yml"

```docker
services:
    # change web-server with your preference name and workSpace
    web-server:
        build:
            context: .
            dockerfile: Dockerfile
        volumnes:
            - .:/workSpace
        port:
            # localPort:containerPort
            - '8080:80'

```

execute in terminal

```sh
docker-compose build

docker-compose up -d

# Container status
docker-compose ps  

# change application-name with your name application
docker-compose exec application-name bash

# to exit
exit

docker-compose down
```