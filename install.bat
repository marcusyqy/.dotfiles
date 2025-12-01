@echo off

REM rd /s /q %userprofile%\AppData\Local\nvim
REM echo D | xcopy nvim %userprofile%\AppData\Local\nvim /E /A

REM echo A | xcopy alacritty %userprofile%\AppData\alacritty\ /E /A

REM uncomment when you want to update wezterm config
REM rd /s /q %userprofile%\.config\wezterm
REM echo D | xcopy wezterm %userprofile%\.config\wezterm /E /A

rd /s /q %userprofile%\AppData\Local\nvim
mklink /d %userprofile%\AppData\Local\nvim %userprofile%\.dotfiles\nvim

rd /s /q %userprofile%\.config\wezterm
mklink /d %userprofile%\.config\wezterm %userprofile%\.dotfiles\wezterm

rd /s /q %userprofile%\.vimrc
mklink %userprofile%\.vimrc %userprofile%\.dotfiles\.vimrc
