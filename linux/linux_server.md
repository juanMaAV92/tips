# Ubuntu server

```sh
apt update
apt upgrade

python3 -V
git --version

apt install nginx

nodejs --version
    apt install nodejs
    apt install npm

npm install pm2@latest -g

pm2 list

cd/home
git clone URL_repo
cd repo

apt install python3-venv
python3 -m venv env
source env/bin/activate
pip install-r requirements.txt

pm2 start "python3 main.py" --name movie-api

# SetUp NGINX
deactivate
nano  /etc/nginx/sites_available/movie-api

    ```
    server{
        listen 80:
        server_name wirte_IP_here;

        location / {
            proxy_pass http://127.0.0.1:5000;
        }
    }
    ```
cp /etc/nginx/sites_available/movie-api /etc/nginx/sites_enabled

systemctl  status nginx
systemctl  restart nginx
```