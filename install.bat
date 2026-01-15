@echo off
rd /s /q %userprofile%\AppData\Local\nvim
mklink /d %userprofile%\AppData\Local\nvim %userprofile%\.dotfiles\nvim

rd /s /q %userprofile%\.config\wezterm
mklink /d %userprofile%\.config\wezterm %userprofile%\.dotfiles\wezterm

rd /s /q %userprofile%\.vimrc
mklink %userprofile%\.vimrc %userprofile%\.dotfiles\.vimrc

rd /s /q %userprofile%\AppData\Roaming\neovide
mklink /d %userprofile%\AppData\Roaming\neovide %userprofile%\.dotfiles\neovide
