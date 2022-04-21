# macOS Setup & Customizations

Various dotfile &amp; Homebrew configurations I use

## Homebrew

[Homebrew](https://brew.sh) is used as a package manager for managing installed applications.

See [Homebrew/README.md](Homebrew/README.md) for details.

## Oh-My-Zsh

[Oh-My-Zsh](https://ohmyz.sh) is a framework for `zsh` customization.

See [oh-my-zsh/README.md](oh-my-zsh/README.md) for details.

## Vim

[Vim](https://www.vim.org) is the best terminal based editor!  

See [vim/README.md](vim/README.md) for details.

## Miscellaneous

### Git

The following alias added to `~/.gitconfig` makes it possible to automatically delete all local branches that have been deleted on the remote using a simple `git gone` command (thanks to the [Cleaning up local git branches deleted on the remote](https://www.erikschierboom.com/2020/02/17/cleaning-up-local-git-branches-deleted-on-a-remote/) blog post!): 

```
[alias]
  gone = ! git fetch -p && git for-each-ref --format '%(refname:short) %(upstream:track)' | awk '$2 == \"[gone]\" {print $1}' | xargs -r git branch -D
```
