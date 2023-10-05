# Things to do at some point
1. Figure out how to handle repositories across git accounts.
	- If one has both github & github enterprise accounts, it would be nice to have a third level for git dotfiles. One true global, one per account, then one per repo. i.e. my name is the same for all, but my email is different on github.com vs ghe, and the desired workflow may be different per repo.
2. Make this more user friendly.
	a. Use logging, especially for the echos like those in the git install which say things like "No git username set! Add one via...".
	b. Describe the use of <file>.private folders in this repo
	c. Make the overall output more readable. dnf uses full width '====' separators which really stand out, but it's pretty difficult to scan the output for where these scripts are starting new `dnf install` calls (at least with the current ########## Installing xxx ###########)
3. Figure out the best way to handle insertion of code within existing dotfiles
	a. _making backups is fine, but not always ideal_
	b. For instance: what's the best way to add the ssh-agent startup code to .profile, or the nvim-switcher function, or whatever special lines one might want to make fzf work as desired?
4. Consider theme/font/prompt management. These things may span several shell environments, and/or require special installs
	a. Example: Theming WSL in Windows Terminal, or things like PowerShell, don't seem quite as easily scriptable. Not only that, but one might want to theme other apps as well--slack, firefox, obsidian, vscode, etc...
	b. It may make sense to have a separate repository for these theming assets/configs.
