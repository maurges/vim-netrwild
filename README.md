# vim-netrwild
R-r-r, netrw is very wild by default. This plugin tames it a little, by providing some cool commands, maps and default settings to it.

## Features
Use `:NetrwSidebar` to open a nice tree-style sidebar in current directory.

Use `:NetrwSidebarAt [location]` to open start the tree at selected location.

You can then close it with `:NetrwSidebarClose` or toggle on/off with `:NetrwSidebarToggle`. Running toggle when there is no netrw tree will just open a new one!

While inside the netrw, you can press `?` to see help on default maps, if you haven't already. Those are the new mappings:

* `o` to open file

* `t` to open file in new tab, and switch to it

* `T` to open file in new tab, and stay on current tab

* `C` to cd to directory under cursor

* `yy` to copy full path of file under cursor

* `B` to make current directory the new root (or base) of the tree

## Installation
Use your favourite plugin manager, or just dump the plugin into your .vim
folder.

For Pathogen:  
`cd ~/.vim/bundle && git clone https://github.com/d86leader/vim-netrwild`

For vim-plug and similar, add the following line to your vimrc file after
initializing the manager:  
`Plug 'd86leader/vim-netrwild'`


## Disclaimer
Netrw and especially it's tree view are still buggy, so there's so much I can do taming it. If you encounter a bug (like highlight being off sometimes), message it to netrw maintainer, he will help.
