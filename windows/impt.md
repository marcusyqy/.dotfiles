
add macros
`reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d "doskey /macrofile=\"C:\Users\marcu\macros.txt\"" /f`


add to %userprofile%\macros.txt
`init-cl=call "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvarsall.bat" x64`

