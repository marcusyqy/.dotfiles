
function update_vim {
    New-Item -Force -Type Directory ~/AppData/Local/nvim
    Copy-Item -Force -Recurse nvim/* ~/AppData/Local/nvim/
}

function update_ps {
    New-Item -Force -Type File $PROFILE
    Copy-Item -Force powershell/Microsoft.PowerShell_profile.ps1 $PROFILE
}

function update_alacritty {
    New-Item -Force -Type Directory $env:APPDATA/alacritty
    Copy-Item -Force alacritty/alacritty-win.yml $env:APPDATA/alacritty/alacritty.yml
}

function update_workspacer {
    New-Item -Force -Type File ~/.workspacer/workspacer.config.csx
    Copy-Item -Force workspacer/workspacer.config.csx ~/.workspacer/workspacer.config.csx

}

update_vim
update_ps
update_alacritty
update_workspacer


