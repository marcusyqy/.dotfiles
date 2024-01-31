$env:TERM='xterm-256color'
$env:EDITOR='nvim'
$desktop='C:\Users\Marcus\Desktop'

function cd_dotfiles() {
    cd ~/.dotfiles
}

function cd_desktop() {
    cd $desktop
}

function git_status() {
    git status
}


# Import-Module posh-git
# Import-Module oh-my-posh
Set-Alias vim nvim
Set-Alias vi nvim
Set-Alias gvim nvim-qt
Set-Alias quit exit
Set-Alias t alacritty
Set-Alias e nvim-qt
Set-Alias lzg lazygit
Set-Alias ll ls
Set-Alias grep rg
Set-Alias g git
Set-Alias .df cd_dotfiles
Set-Alias .dd cd_desktop
Set-Alias gs git_status

function IsVirtualTerminalProcessingEnabled {
    $MethodDefinitions = @'
[DllImport("kernel32.dll", SetLastError = true)]
public static extern IntPtr GetStdHandle(int nStdHandle);
[DllImport("kernel32.dll", SetLastError = true)]
public static extern bool GetConsoleMode(IntPtr hConsoleHandle, out uint lpMode);
'@
    $Kernel32 = Add-Type -MemberDefinition $MethodDefinitions -Name 'Kernel32' -Namespace 'Win32' -PassThru
    $hConsoleHandle = $Kernel32::GetStdHandle(-11) # STD_OUTPUT_HANDLE
    $mode = 0
    $Kernel32::GetConsoleMode($hConsoleHandle, [ref]$mode) >$null
    if ($mode -band 0x0004) { # 0x0004 ENABLE_VIRTUAL_TERMINAL_PROCESSING
            return $true
            }
            return $false
        }

function CanUsePredictionSource {
    return (! [System.Console]::IsOutputRedirected) -and (IsVirtualTerminalProcessingEnabled)
}


if(CanUsePredictionSource) {
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
    Set-PSReadLineOption -EditMode Emacs
    Set-PSReadLineOption -BellStyle None
}
#Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
#Set-PSReadLineOption -PredictionSource History

function Invoke-Environment {
    param
    (
        # Any cmd shell command, normally a configuration batch file.
        [Parameter(Mandatory=$true)]
        [string] $Command
    )

    $Command = "`"" + $Command + "`""
    cmd /c "$Command > nul 2>&1 && set" | . { process {
        if ($_ -match '^([^=]+)=(.*)') {
            [System.Environment]::SetEnvironmentVariable($matches[1], $matches[2])
        }
    }}

}

function init_msvc_env {
    # pushd 'C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools'
    pushd 'C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build'
    Invoke-Environment ./vcvars64.bat
    # cmd /c "VsDevCmd.bat&set" |
    # foreach {
    #   if ($_ -match "=") {
    #     $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
    #   }
    # }
    popd
    Write-Host "`nVisual Studio 2019 Command Prompt variables set." -ForegroundColor Yellow
}

Set-Alias -Name msvc -Value init_msvc_env

# removed so that we can see the warnings
# clear

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
oh-my-posh --init --shell pwsh --config ~\AppData\Local\Programs\oh-my-posh\themes\robbyrussell.omp.json | Invoke-Expression

