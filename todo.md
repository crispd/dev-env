# Things to do at some point
1. Figure out how to handle repositories across git accounts.
	a. If one has both github & github enterprise accounts, it would be nice to have a third level for git dotfiles. One true global, one per account, then one per repo. i.e. my name is the same for all, but my email is different on github.com vs ghe, and the desired workflow may be different per repo.
2. Make this more user friendly.
	a. Use logging, especially for the echos like those in the git install which say things like "No git username set! Add one via...".
3. Consider theme/font/prompt management. These things may span several shell environments, and/or require special installs
	a. Example: Theming WSL in Windows Terminal, or things like PowerShell, don't seem quite as easily scriptable. Not only that, but one might want to theme other apps as well--slack, firefox, obsidian, vscode, etc...
	b. It may make sense to have a separate repository for these theming assets/configs.
4. Come up with a better way of handling 'SCRIPTPATH', and add an 'uninstall' method for each install.
5. Do better checking so that certain things in these installs don't end up running if something's already been installed
6. See if the way I'm doing file/folder testing actually makes sense...
