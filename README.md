Clone this repo
-------------------

    mkdir ~/id/
    git clone git@gitea.impd.co.za:keith/emacs.git ~/id/emacs

Install dependencies
-------------------------
    
    sudo apt-get update
    sudo apt-get install python python-dev build-essential curl virtualenv python-pip pylint ruby silversearcher-ag
    
    # Install the latest emacs
    sudo add-apt-repository ppa:ubuntu-elisp/ppa
    sudo apt-get update
    sudo apt-get remove emacs
    sudo apt-get install emacs-snapshot
    
    # JS Syntax checking
    sudo apt-get install curl
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    sudo apt-get update
    sudo apt-get install -y nodejs
    
    sudo npm install -g npm 
    sudo npm install -g tern yarn tide typescript
    sudo npm install -g eslint babel-eslint eslint-plugin-react eslint-plugin-jsx eslint-plugin-flowtype eslint-plugin-react-app
    
Create .emacs file
-----------------------

Open up ~/.emacs

Paste the following lines if you want to bring in the complete config:
    
    (add-to-list 'load-path "~/id/emacs/imp-emacs")
    (require 'init-all)
    
Otherwise just look at `imp-emacs/init-all.el` to load only specfic modes. Only `init-imp` is required.

Set up symlinks
-------------------

    ln -s ~/id/emacs/pylintrc ~/.pylintrc
    ln -s ~/id/emacs/eslintrc ~/.eslintrc
    
Start emacs for the first time
------------------------------

Start emacs with the command. It'll probably give you a pretty large error.

    emacs ~/.emacs
    
Run the command `M-x eval-buffer`. All packages will install. Restart emacs.

Python
--------

After opening a Python file for the first time you need to install jedi. In Emacs do:

    M-x jedi:install-server
    

Javascript
-------------

Add the file `jsconfig.json` in the `src` folder of your project to get syntax checking.

```
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
