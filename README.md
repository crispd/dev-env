# dev-env
An attempt at more properly defining my personal development enviornment with AlmaLinux9 in WSL2 (Windows)

## Preparation
#### Install WSL2 (admin required)
See [learn.microsoft.com](https://learn.microsoft.com/en-us/windows/wsl/install)
- Run ```wsl --install``` from an elevated PowerShell
#### Install AlmaLinux9
See [wiki.almalinux.org](https://wiki.almalinux.org/documentation/wsl.html#about-wsl)
- Install AlmaLinux9 from the Microsoft Store
- Open the AlmaLinux9 _app_. A terminal should open and run stuff. When complete, AlmaLinux9 can be run in WSL.
#### Install Windows Terminal Preview from the Microsoft Store
#### Install a NerdFont
- Install a NerdFont as explained here: [learn.microsoft.com](https://learn.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup#install-a-nerd-font) (I like FiraCode NF)
#### Initial Steps w/ AlmaLinux
*Open AlmaLinux from within Windows Terminal, then run the following commands*
1. ```dnf check-update && sudo dnf update```
2. ```sudo dnf config-manager --set-enabled crb```
3. ```sudo dnf install epel-release```
4. ```dnf check-update && sudo dnf update```
5. ```sudo dnf install git```
6. ```mkdir github.<your_username> && cd "$_"``` (*then clone this repo*)



# License
MIT
