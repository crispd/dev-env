# dev-env
An attempt at more properly defining my personal development enviornment with AlmaLinux9 in WSL2 (Windows)
- *Currently based on a repo shared by mtrudel: https://github.com/mtrudel/dotfiles*
- *so-far, this is a proof of concept. this repo may change quite a bit as I consider how to best separate the subsets of tools this handles/configures...*

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
*Open AlmaLinux, then run the following commands. I prefer to use Windows Terminal Preview, but you can run it in the base Terminal offered by the AlmaLinux WSL app or see other terminal options available in either msstore or winget repos*
1. ```dnf check-update && sudo dnf update```
2. ```sudo dnf config-manager --set-enabled crb```
3. ```sudo dnf install epel-release```
4. ```dnf check-update && sudo dnf update```
5. ```sudo dnf upgrade``` (update to AlmaLinux 9.2)
6. ```sudo dnf install git```

## Using this repo to setup a development environment
#### 1. Clone dev-env.git locally
*these can also be found on the github page under 'clone'. below lines use https, but using ssh is preferred.*
- `git clone https://github.com/crispd/dev-env.git`*, or...*
- `git clone https://ghe-pip2.fnal.gov/dcrisp/dev-env.git`

#### 2. Decide what you want to install. Using `./install.sh` to do so.
 - running `install.sh` withought args will install some basic tools, inspect the file to see which.
 - `install.sh` can also be passed args for selective installation of things like neovim (nvim)

**Note: some installations require that code get added to your dotfiles**
    - these scripts will add a ~/.profile dotifle to your home directory that will iterate through a new ~/.profile.d/ directory in which any new dotfile-like code will live
    - this process does not remove any existing ~/.profile dotfile you may have, the existing file will become ~/.profile.bak before placing the new one
    - in order for this to work, the user will have to source the ~/.profile dotfile from whatever existing dotfiles their shell is using (i.e. ~/.bashrc, ~/.zshrc). The needed line is simply the following:
        - `. ~/.profile`

*Again, this is a work in progress... [todo.md](./todo.md) is where I've offloaded ideas for future improvement (this repo is **not** my current focus, but I do tend to tweak it occasionally).*


# License
MIT
