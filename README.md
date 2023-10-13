# dev-env
An attempt at more properly defining my personal development enviornment with AlmaLinux9 in WSL2 (Windows)
- *Currently based on a repo shared by mtrudel: https://github.com/mtrudel/dotfiles*
- *so-far, this is a proof of concept. this repo may change quite a bit as I consider how to best separate the subsets of tools this handles/configures...*

## Some comments on WIN package management
The winget package manager is a really good alternative for most windows app/package installations, and seems to be what will eventually become the default package management tool for the windows OS in the future. You'll find that it is pre-installed on your machine by default. Understand that winget looks at both msstore as well as it's own package repositories; so sometimes you will see more than one version of a desired package show up when using `winget search`. At the moment, you should assume that anything not listed as coming directly from the msstore package repo will not necessarily receive automatic updates once you have it installed. I personally prefer this with most things, but just FYI. There is also the chocolatey package manager, but this is not bundled with windows by default, and you will have to install it with a few simple powershell commands that are easily found on their online guide.

## fastfetch
![fastfetch](assets/almalinux-wsl-fastfetch.png)


## Preparation
#### 1. Install WSL2 (admin required)
See [learn.microsoft.com](https://learn.microsoft.com/en-us/windows/wsl/install)
- Run ```wsl --install``` from an elevated PowerShell
#### 2. Install AlmaLinux9
See [wiki.almalinux.org](https://wiki.almalinux.org/documentation/wsl.html#about-wsl)
- Install AlmaLinux9 from the Microsoft Store
    - Using winget: `winget install "AlmaLinux 9"`
- Open the AlmaLinux9 _app_. A terminal should open and run stuff. When complete, AlmaLinux9 will be a profile option in Windows Terminal (or Windows Terminal Preview).
#### 3. Install Windows Terminal Preview from the Microsoft Store
*Not required, but highly recommended*
- Using winget: `winget install "Windows Terminal Preview"`
#### 4. Install a NerdFont
*Not required, but highly recommended. I've never tried using a nerdfont with another terminal in windows, either*
- Install a NerdFont as explained here: [learn.microsoft.com](https://learn.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup#install-a-nerd-font) (I like FiraCode NF)
  - *if using chocolatey:* `choco install firacodenf` (unsure if there's a winget option I'm not seeing)
- Select the installed nerdfont in your Windows Terminal App (as default, or for your AlmaLinux Profile)
#### 5. Initial Steps w/ AlmaLinux
*I prefer to run both my WSL distros and Powershell/Powershell Preview from the Windows Terminal Preview app, but you can run it in the default terminal offered by the AlmaLinux WSL package or pick from other terminal apps available in either msstore, winget, or chocolatey repos*
1. Open AlmaLinux in the terminal of your choice, and run the following commands before using dev-env's install scripts.
2. ```dnf check-update && sudo dnf update```
3. ```sudo dnf config-manager --set-enabled crb```
4. ```sudo dnf install epel-release```
5. ```dnf check-update && sudo dnf update```
6. ```sudo dnf upgrade``` (update to AlmaLinux 9.2)
7. ```sudo dnf install git```

## Using this repo to setup a development environment
#### 1. Clone dev-env.git locally
*these can also be found on the github page under 'clone'. below lines use https, but using ssh is preferred.*
- `git clone https://github.com/crispd/dev-env.git`*, or...*
- `git clone https://ghe-pip2.fnal.gov/dcrisp/dev-env.git`

#### 2. Decide what you want to install. Using `./install.sh` to do so.
 - running `install.sh` withought args will install some basic tools, inspect the file to see which.
 - `install.sh` can also be passed args for selective installation of things like neovim (nvim)

#### **Note: some installations require that code get added to your dotfiles**
- these scripts will add a ~/.profile dotifle to your home directory that will iterate through a new ~/.profile.d/ directory in which any new dotfile-like code will live
- this process does not remove any existing ~/.profile dotfile you may have, the existing file will become ~/.profile.bak before placing the new one
- in order for this to work, the user will have to source the ~/.profile dotfile from whatever existing dotfiles their shell is using (i.e. ~/.bashrc, ~/.zshrc). The needed line is simply the following:
    - `. ~/.profile`

*Again, this is a work in progress... [todo.md](./todo.md) is where I've offloaded ideas for future improvement (this repo is **not** my current focus, but I do tend to tweak it occasionally).*


# License
MIT
