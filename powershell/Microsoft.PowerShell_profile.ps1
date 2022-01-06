# Import-Module posh-git
# Import-Module oh-my-posh
Set-Alias vim nvim
Set-Alias vi nvim
Set-Alias gvim nvim-qt
Set-Alias neovide neovide.exe
Set-Alias quit exit
Set-Alias vima alacritty
Set-Alias lzg lazygit
Set-Alias ll ls
Set-Alias grep rg

$work = 'D:\work'

Import-Module PSReadLine

# Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Autocompleteion for Arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History

# PSReadLine
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

function init_msvc_env {
    pushd 'C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools'
    cmd /c "VsDevCmd.bat&set" |
    foreach {
      if ($_ -match "=") {
        $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
      }
    }
    popd
    Write-Host "`nVisual Studio 2019 Command Prompt variables set." -ForegroundColor Yellow
}

Set-Alias -Name msvc -Value init_msvc_env

clear

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
# "`nNew-Alias which get-command" | add-content $profile
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# init_msvc_env
oh-my-posh --init --shell pwsh --config ~\AppData\Local\Programs\oh-my-posh\themes\spaceship.omp.json | Invoke-Expression
