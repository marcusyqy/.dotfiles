@echo off

rd /s /q %userprofile%\AppData\Local\nvim
echo D | xcopy nvim %userprofile%\AppData\Local\nvim /E /A

rd /s /q %userprofile%\.config\wezterm
echo D | xcopy wezterm %userprofile%\.config\wezterm /E /A
