@echo off

rd /s /q %userprofile%\AppData\Local\nvim
echo D | xcopy nvim %userprofile%\AppData\Local\nvim /E /A

echo A | xcopy alacritty %userprofile%\AppData\alacritty\ /E /A

rd /s /q %userprofile%\.config\wezterm
echo D | xcopy wezterm %userprofile%\.config\wezterm /E /A
