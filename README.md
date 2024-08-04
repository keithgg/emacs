Clone this repo
-------------------

```bash
mkdir ~/emacs-config
git clone git@github.com:keithgg/emacs ~/emacs-config
```

Install dependencies
-------------------------

Just `npm` is required (for installing language servers really).

```bash
sudo pacman -Sy npm
```
    
Create .emacs file
-----------------------

Open, `~/.emacs.el`, add these lines for the complete config:

```emacs-lisp
(add-to-list 'load-path "~/emacs-config/imp-emacs")
(require 'init-all)
```
    
Otherwise just look at `imp-emacs/init-all.el` to load only specfic modes. Only `init-imp` is required.

Commands to run after install
--------------------------

These commands do some initialization, for the packages that are installed.

- `mkdir ~/org-roam` create the directory for storing org-roam things.
- `M-x nerd-icons-install-fonts` to get the icons on the modeline to render correctly.
- `cd ~/.emacs.d/elpa && find . -type f -name '*.elc' -delete` - Sometimes you get [this error](https://github.com/emacs-lsp/lsp-mode/issues/1036).

Set up symlinks
---------------

```bash
ln -s ~/emacs-config/pylintrc ~/.pylintrc
```
