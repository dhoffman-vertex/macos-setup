# Vim

## .vimrc

The included [vimrc](vimrc) file is the main configuration file for Vim & should be placed in `~/.vimrc`.  Much of this configuration depends on the bundles defined below & will need to be customized for other needs.

## Bundles

>**_NOTE:_** This repo currently uses a custom hacked together bundle setup for Vim but will likely be changed to use [Vundle](https://github.com/VundleVim/Vundle.vim) in the future.

There is a Ruby script in `vim/update_bundles` that will download/install a list of Vim plugins from various community projects in Git.  Some of these plugins are configured in the above `.vimrc` configuration.