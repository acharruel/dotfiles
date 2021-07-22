# dotfiles

Configuration files for miscellaneous utilities

Prerequisite: stow (https://www.gnu.org/software/stow/) symlink farm manager

### cgdb (the curses debugger)

https://cgdb.github.io/

```
stow cgdb
```

### dunst (notification dameon)

https://github.com/dunst-project/dunst

```
stow dunst
```

### gtkwave ()

http://gtkwave.sourceforge.net/

```
stow gtkwave
```

### i3 (improved tiling wm)

https://i3wm.org/docs/userguide.html

```
stow i3
```

### kitty ( The fast, feature-rich, GPU based terminal emulator)

https://sw.kovidgoyal.net/kitty/

```
stow kitty
```

### mako (A lightweight notification daemon for Wayland)

https://github.com/emersion/mako

```
stow mako
```

### nnn (Nnn's Not Noice! File manager)

https://github.com/jarun/nnn

```
stow nnn
```

### poke (binary data editor)

https://www.gnu.org/software/poke/

```
stow poke
```

### rofi (window switcher application)

https://github.com/davatorium/rofi

```
stow rofi
```

### sway (i3 compatible wayland compositor)

https://github.com/swaywm/sway

```
stow sway
```

### vim or neovim

https://www.vim.org/
https://neovim.io/

```
stow vim
cd ~
ln -s .vim/vimrc .vimrc
```

Install plugin stuff for neovim
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Launch vim and install plugins

```
:PlugInstall
```

### waybar (customizable waylan bar)

https://github.com/Alexays/Waybar

```
stow waybar
```

### wofi (wayland application launcher)

https://hg.sr.ht/~scoopta/wofi

```
stow wofi
```

### Xresources

Xorg graphical configuration files (urxvt...)

```
stow xresources
cd ~
ln -s .Xresources.d/Xresources .Xresources
```

### zsh

https://www.zsh.org/

May be used with oh-my-zsh (https://ohmyz.sh/) or
zprezto (https://github.com/sorin-ionescu/prezto).

```
stow zsh
cd -
ln -s .zsh/zshrc .zshrc
```

