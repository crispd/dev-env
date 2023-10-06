#!/bin/bash
#
# LazyGit: A useful TUI for handling git repos
#
# Information on lazygit can be found in these places:
# 	[github](https://github.com/jesseduffield/lazygit)
# 	[copr (Cool Other Package Repo)](https://copr.fedorainfracloud.org/coprs/atim/lazygit/)

sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit
