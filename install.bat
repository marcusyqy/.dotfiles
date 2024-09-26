@echo off

rd /s /q %userprofile%\AppData\Local\nvim
echo D | xcopy nvim %userprofile%\AppData\Local\nvim /E /A

REM echo A | xcopy alacritty %userprofile%\AppData\alacritty\ /E /A

REM uncomment when you want to update wezterm config
REM rd /s /q %userprofile%\.config\wezterm
REM echo D | xcopy wezterm %userprofile%\.config\wezterm /E /A
