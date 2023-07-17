# Python Installation

- On linux
```sh
sudo apt update
sudo apt -y upgrade

python -V
sudo apt install -y python-pip
pip -V

sudo apt install -y build-essential libssl-dev libffi-dev python3-dev
```

- virtual enviroment

on linux
```sh
which python3
apt install -y python-venv
python -m venv env
source env/bin/activate
deactivate
```

Activate it on Windows
```sh
env/Scripts/activate
```

Dependencies
```sh
pip freeze > requirements.txt
pip install -r requirements.txt
```