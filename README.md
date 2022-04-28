# My dotfiles
[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/powered-by-electricity.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/uses-badges.svg)](https://forthebadge.com)

## Installation
First install homebrew and add all applicable dotfiles to the `~` directory.
```
make
```

Install all packages defined in `.Brewfile`
```
brew bundle --global
```

Install packages for atom.
```
make ~/.atom/packages
```

Change the shell to zsh:
```
chsh -s /bin/zsh
```
