Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme robbyrussel
Set-Alias vim nvim
Set-Alias vi nvim
Set-Alias gvim nvim-qt
Set-Alias neovide neovide.exe
Set-Alias quit exit
Set-Alias vima alacritty
Set-Alias lzg lazygit

Import-Module PSReadLine

# Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Autocompleteion for Arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History

function init_msvc_env {
    pushd 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\Tools'
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
