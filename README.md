# Dotfiles

[![Build Status](https://travis-ci.com/okitavera/dotfiles.svg?branch=master)](https://travis-ci.com/okitavera/dotfiles)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

This repository serves as my way to help me setup and maintain my workspaces :)

#### Disclaimer

Cherry-pick just what you want to keep your system clean, the main dotfiles is in `assets`.
yes you can install the whole things but I do not recommend it

After pywal, my setup is also depended on this script : `.bin/xrgc`.
It basically used for reading colors from xrdb (.Xresource). so be careful when pick something, maybe you need that script on your `$PATH`

## Installation

#### Okay, fine. I still want to install them

- clone this repository with the submodules

```bash
$ git clone --recurse-submodules --depth 1 https://github.com/okitavera/dotfiles
```

- edit and adjust the setup at `group_vars/local.yml`
- run them in test-mode before to check the compatibility

```bash
$ ansible-playbook dotfiles.yml -i hosts.local --ask-become-pass --check
```

- if it works well and you want to apply them to your home, run it for real

```bash
$ ansible-playbook dotfiles.yml -i hosts.local --ask-become-pass
```

## Configurations overview

```bash
$ tree -a
 ~/
   ├─ .aliases # shell aliases
   ├─ .bin
   │  ├ ...
   │  ├─ lock # i3lock-color wrapper script
   │  └ ...
   ├─ .config
   │  ├─ audacious
   │  ├─ autostart # several autostart desktopfiles for xfce4
   │  ├─ clearine.conf
   │  ├─ compton.conf
   │  ├─ conky
   │  ├─ fontconfig
   │  ├─ lemonbar # used in some of my windowchef's preset
   │  ├─ mygtkmenu # used in some of my windowchef's preset
   │  ├─ obmenu-generator
   │  ├─ openbox
   │  ├─ polybar # used in some of my windowchef's preset
   │  ├─ pulse
   │  ├─ ranger
   │  ├─ ruler # used in some of my windowchef's preset
   │  ├─ sxhkd # used in some of my windowchef's preset
   │  ├─ Thunar # thunar custom action
   │  ├─ wal
   │  │   └─ templates
   │  │       └─ colors.Xresources # pywal color template for urxvt and rofi
   │  └─ windowchef
   ├─ .mozilla # some fixes for gtk dark themes
   ├─ .mpd
   ├─ .ncmpcpp
   ├─ .themes # used in clearine
   │  ├ ...
   │  ├─ clearine-white-icon # theme for my clearine setup
   │  └ ...
   ├─ .urxvt
   ├─ .vimrc
   ├─ .profile
   ├─ .Xresources
   └─ .zshrc
```

## Themes Repository

Here is another things that I use in my machine, feel free to check it out.

- [tint2 themes](https://github.com/okitavera/yuune-tint2-themes)
- [openbox themes](https://github.com/okitavera/yuune-ob-themes)
- [xfwm4 themes](https://github.com/okitavera/yuune-xfwm-themes)

## License

The code is available under the [MIT license](LICENSE).
