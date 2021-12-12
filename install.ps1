
function update_vim {
    New-Item -Force -Type Directory ~/AppData/Local/nvim
    Copy-Item -Force -Recurse nvim/* ~/AppData/Local/nvim/
}

function update_ps {
    New-Item -Force -Type File $PROFILE
    Copy-Item -Force powershell/Microsoft.PowerShell_profile.ps1 $PROFILE
}

update_vim
update_ps


