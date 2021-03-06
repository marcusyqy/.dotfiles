
function update_vim {
    Remove-Item '~/AppData/Local/nvim' -Recurse
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


function update_vs {
    New-Item -Force -Type File ~/.vsvimrc
    Copy-Item -Force vs/.vsvimrc ~/.vsvimrc

}

function update_ideavim {
    New-Item -Force -Type File ~/.ideavimrc
    Copy-Item -Force ideavim/.ideavimrc ~/.ideavimrc

}

update_vim
update_ideavim
update_vs
update_ps
update_alacritty


