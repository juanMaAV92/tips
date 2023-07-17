# Poetry : Dependency manager and packaging

## Installing 
```sh
apt install python3.10-venv

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python3 -

export PATH="/home/juanmaav92/.local/bin:$PATH"

poetry --version 

poetry update
```

## Initialization a project
```sh
poetry init

cat > poetry.toml 

nano poetry.toml
    [virtualenvs]
    create = true
    in-project = true

poetry install
```

## Dependencias
```sh
poetry add dependencyName
poetry add --group dev flake8 pytest

poetry update package
poetry add package@latest

poetry export  # Export in requirements.txt
```

## Virtual env
```sh
poetry run python my_script.py

# activate virtual env
source .venv/bin/activate
```

## Build
```sh
poetry build
```