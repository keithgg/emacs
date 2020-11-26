Clone this repo
-------------------

```bash
mkdir ~/emacs-config
git clone git@github.com:keithgg/emacs ~/emacs-config
```

Install dependencies
-------------------------

```bash
sudo apt-get update
sudo apt-get install python python-dev build-essential curl virtualenv python-pip pylint ruby silversearcher-ag sqlformat

# Install the latest emacs
sudo add-apt-repository ppa:ubuntu-elisp/ppa
sudo apt-get update
sudo apt-get remove emacs
sudo apt-get install emacs-snapshot

# JS Syntax checking
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get update
sudo apt-get install -y nodejs

sudo npm install -g npm 
sudo npm install -g tide typescript prettier
sudo npm install -g eslint babel-eslint eslint-plugin-react eslint-plugin-jsx eslint-plugin-flowtype eslint-plugin-react-app
```
    
Create .emacs file
-----------------------

Open, `~/.emacs` otherwise `~/.config/emacs/init` if you install the snapshot version above.

Paste the following lines if you want to bring in the complete config:

```emacs-lisp
(add-to-list 'load-path "~/emacs-config/imp-emacs")
(require 'init-all)
```
    
Otherwise just look at `imp-emacs/init-all.el` to load only specfic modes. Only `init-imp` is required.

Set up symlinks
-------------------

```bash
ln -s ~/emacs-config/pylintrc ~/.pylintrc
ln -s ~/emacs-config/eslintrc ~/.eslintrc
```
    
Python
--------

After opening a Python file for the first time you need to install jedi. In Emacs do:

```
M-x jedi:install-server
```

Javascript
-------------

Add the file `jsconfig.json` in the `src` folder of your project to get syntax checking.

```json
{
    "compilerOptions": {
        "target": "es2017",
        "allowSyntheticDefaultImports": true,
        "noEmit": true,
        "checkJs": true,
        "jsx": "react",
        "moduleResolution": "Node",
        "lib": [ "dom", "es2017" ]
    },
    "include": [
        "./"
    ],
    "exclude": ["node_modules"]
}
```
