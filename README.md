# vimrc

## Installing and updating packages

Below is obsolete while we've moved from vimscript to lua and now
uses packer.nvim instead.

This config uses [vim-plug](https://github.com/junegunn/vim-plug),
so you'll need to run `:PlugInstall` and possibly `:PlugUpdate` whenever consider an
update of the plug-ins is necessary.

This vimrc config will automatically install plug-ins for the first time cloned from github.

i.e.

1. Under your home directory, run:

```
$ git clone git@github.com:vsdmars/neovim.git ~/.config/nvim
```

3. Launch vim which will automatically install plug-ins on its behalf.

From there, you should occasionally run `:PlugUpdate` to keep your plugins up-to-date.

You can also run `:PlugUpgrade` to upgrade vim-plug itself.

## To disable plugins

Rename package folder under ./layer with prefix '\_' (e.g. theme -> \_theme) to
disable plugins within that folder from being installed/set.

:wink:
