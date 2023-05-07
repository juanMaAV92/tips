# Installing on Linux based on Debian

```sh
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
node --version     
npm --version
npm install --global yarn 
yarn --version
```

> Note: we are going to use `npm` to install global dependency and `yarn` for local project

## Vite 

Vite is a web development framework that focuses on speed and efficiency during the development process. It uses a development server architecture that enables fast compilation and hot-reload to make the development process more efficient and faster.

```sh
yarn create vite

# start a development server on your local machine
yarn dev
```