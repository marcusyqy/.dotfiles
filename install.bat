@echo off

rd /s /q %userprofile%\AppData\Local\nvim
echo D | xcopy nvim %userprofile%\AppData\Local\nvim /E /A

