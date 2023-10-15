# Things to do at some point
1. Figure out how to better handle repositories across git accounts.
	a. If one has both github & github enterprise accounts, it would be nice to have a third level for git dotfiles. One true global, one per account, then one per repo. i.e. my name is the same for all, but my email is different on github.com vs ghe, and the desired workflow may be different per repo.
2. Make this more user friendly.
	a. Use logging, especially for the echos like those in the git install which say things like "No git username set! Add one via...".
	b. Figure out a better way to ensure things get called in the right order. (i.e. $HOME/.cargo/env needs to be sourced before one can `eval "$(starship init bash)"
3. Consider theme/font/prompt management. These things may span several shell environments, and/or require special installs
	a. Example: Theming WSL in Windows Terminal, or things like PowerShell, don't seem quite as easily scriptable. Not only that, but one might want to theme other apps as well--slack, firefox, obsidian, vscode, etc...
	b. It may make sense to have a separate repository for these theming assets/configs.
4. Come up with a better way of handling 'SCRIPTPATH', and add an 'uninstall' method for each install.
5. Do better checking so that certain things in these installs don't end up running if something's already been installed

# Explore
1. Use of the yazi terminal file manager: https://yazi-rs.github.io/docs/
    a. Source: https://github.com/sxyazi/yazi
    b. Showcase: https://yazi-rs.github.io/docs/showcase
    c. Installation Guidance:
        - [windows?](https://github.com/sxyazi/yazi/wiki/Windows-Installation-Guide)
        - [General](https://yazi-rs.github.io/docs/usage/installation)
2. Using something like vscodeepics to improve syntax highlighting in bat/nvim
3. GitHub CLI
4. Improved local git project management & switching
