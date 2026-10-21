@echo off
rd /s /q "%userprofile%\AppData\Local\nvim"
mklink /d "%userprofile%\AppData\Local\nvim" "%userprofile%\.dotfiles\nvim"

rd /s /q "%userprofile%\.config\wezterm"
mklink /d "%userprofile%\.config\wezterm" "%userprofile%\.dotfiles\wezterm"

del /q "%userprofile%\.vimrc"
mklink "%userprofile%\.vimrc" "%userprofile%\.dotfiles\.vimrc"

rd /s /q "%userprofile%\AppData\Roaming\neovide"
mklink /d "%userprofile%\AppData\Roaming\neovide" "%userprofile%\.dotfiles\neovide"

rd /s /q "%userprofile%\AppData\Roaming\alacritty"
mklink /d "%userprofile%\AppData\Roaming\alacritty" "%userprofile%\.dotfiles\alacritty"

rd /s /q "%appdata%\.emacs.d"
mklink /d "%appdata%\.emacs.d" "%userprofile%\.dotfiles\emacs"

rd /s /q "%userprofile%\.emacs.d"
mklink /d "%userprofile%\.emacs.d" "%userprofile%\.dotfiles\emacs"

mkdir "%userprofile%\.claude"
mklink /d "%userprofile%\.claude\rules" "%userprofile%\.dotfiles\claude\rules"
mklink "%userprofile%\.claude\keybindings.json" "%userprofile%\.dotfiles\claude\keybindings.json"
mklink "%userprofile%\.claude\settings.json" "%userprofile%\.dotfiles\claude\settings.json"
