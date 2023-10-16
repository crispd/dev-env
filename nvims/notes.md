# notes specific to the nvim-switcher or nvim distributions
## General
**Guidance:**
- It is probably always a good idea to enter `:checkhealth lazy` after installation of LazyVim (& the equivalent for any nvim distro incl. base nvim)


**TODO:**
- robust-ness: Test re-install of nvims+LazyVim when already installed
- LazyVim:
    - Have installer update the default colorscheme from TokyoNight to something more generally appealable.

**23Oct16:**
- Updated some of these scripts and ran a clean `$DEVENV/install.sh nvims` (which worked, LazyVim is good)
- Fixed a plugin install issue for LazyVim (req. no changes to dev-env repo)

## LazyVim
**Default is working, with the following caveat...**
1. Encountered checkout failure for nvim-ts-autotag plugin
    - Cloned into $HOME/.local/share/LazyVim/lazy/nvim-ts-autotag
    - error: RPC failed; HTTP 408 curl 22 The requested URL returned error: 408
    - Inspect what was checked out with `git status` & retry with `git restore --source=HEAD :/`
    - Not sure why it didn't work by default... doing the above fixed it, though
