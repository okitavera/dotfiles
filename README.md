# Dotfiles
This repository serves as my way to help me setup and maintain my workspaces :)

#### Disclaimer
Cherry-pick just what you want to keep your system clean, the main dotfiles is in `assets`.
yes you can install the whole things but I do not recommend it

After pywal, my setup is also depended on this script : `.bin/xrgc`.
It basically used for reading colors from xrdb (.Xresource). so be careful when pick something, maybe you need that script on your `$PATH`

## Overview 

Here is the list of apps that I use

* App Launcher: [rofi](https://github.com/DaveDavenport/rofi)
* Music Player: audacious or ncmpcpp
* Shell: zsh with [zplug](https://github.com/zplug/zplug)
* Terminal Emulator: [rxvt-unicode-pixbuf](https://aur.archlinux.org/packages/rxvt-unicode-pixbuf/)
* Text Editor: vscode, vim
* Widgets: conky
* Lockscreen: [i3lock-color](https://github.com/PandorasFox/i3lock-color). the wrapper is on `.bin/lock`
* Hotcorner launcher: [cornora](https://github.com/yuuune/cornora)

## Installation

#### Okay, fine. I still want to install them

* clone this repository with the submodules
```bash
$ git clone --recurse-submodules --depth 1 https://github.com/yuune/dotfiles
```
* edit and adjust the setup at `group_vars/local.yml`
* run them in test-mode before to check the compatibility
```bash
$ ansible-playbook dotfiles.yml -i hosts.local --ask-become-pass --check
```
* if it works well and you want to apply them to your home, run it for real
```bash
$ ansible-playbook dotfiles.yml -i hosts.local --ask-become-pass
```

## Themes Repository

Here is another things that I use in my machine, feel free to check it out.
* [tint2 themes](https://github.com/yuune/yuune-tint2-themes)
* [openbox themes](https://github.com/yuune/yuune-ob-themes)
* [xfwm4 themes](https://github.com/yuune/yuune-xfwm-themes)


## License

The code is available under the [MIT license](LICENSE).
