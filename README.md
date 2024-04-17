# Dotfiles

## Installation

First, ensure GNU Stow is installed:

```sh
$ brew install stow
```

Then clone this repo to a subdirectory in your $HOME directory and run `stow` within it:

```sh
$ git clone git@github.com:blumsicle/dotfiles.git $HOME/dot
$ cd $HOME/dot
$ stow --dotfiles
```
