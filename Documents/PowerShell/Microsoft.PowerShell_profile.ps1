# Opt-out pwsh telemetry, only as admin
if ([bool]([System.Security.Principal.WindowsIdentity]::GetCurrent()).IsSystem) {
    [System.Environment]::SetEnvironmentVariable('POWERSHELL_TELEMETRY_OPTOUT', 'true', [System.EnvironmentVariableTarget]::Machine)
}

Import-Module -Name Terminal-Icons

# Starship
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"

function Invoke-Starship-TransientFunction {
  &starship module character
}

Invoke-Expression (&starship init powershell)
Enable-TransientPrompt

#$ENV:STARSHIP_DISTRO = "  eyes"
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\p10k.toml" | Invoke-Expression

$env:PATH += ";C:\Users\eyes\scoop\shims"
$env:EDITOR = "nvim"
$env:FZF_DEFAULT_OPTS="--color=bg+:-1,bg:-1,fg+:#ffffff,fg:#cccccc,gutter:-1"
$env:BAT_THEME = 'Dracula' #Dracula, Nord

# Navkeys
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Aliasis
Set-Alias mkdir New-MultiDir
Set-Alias ping Test-Connection
Set-Alias ifconfig Get-NetIPAddress
Set-Alias fzf-history Show-HistoryPopup
Set-Alias doom ~/.local/bin/doom.ps1
Set-Alias debian debian.exe

# Navigation Shortcuts
function desktop { Set-Location -Path $HOME\Desktop }
function downloads { Set-Location -Path $HOME\Downloads }
function docs { Set-Location -Path $HOME\Documents }
function .config { Set-Location -Path "$HOME\.config" }
function Dev {Set-Location -Path "$HOME\Development"}
function repos { Set-Location -Path "$HOME\Development\repos" }
function notes { Set-Location -Path "$HOME\Documents\Notes" }
function sites { Set-Location -Path "$HOME\Documents\Local Sites" }

# Hidden Listing
function la { Get-ChildItem -Path . -Force -Hidden | Format-Table -AutoSize }

# which
function which($name) {
    Get-Command $name | Select-Object -ExpandProperty Definition
}

# whichdir
function whichdir($name) {
    $directory = Split-Path -Parent (Get-Command $name | Select-Object -ExpandProperty Definition)
    return $directory
}

# sed
function sed($file, $find, $replace) {
    (Get-Content $file).replace("$find", $replace) | Set-Content $file
}

# grep
function grep($regex, $dir) {
    if ( $dir ) {
        Get-ChildItem $dir | select-string $regex
        return
    }
    $input | select-string $regex
}

# Symbolic Link
function ln-s {
    param (
        [string]$LinkPath,
        [string]$TargetPath
    )
    New-Item -Path $LinkPath -ItemType SymbolicLink -Target $TargetPath
}

# touch
function touch {
    param (
        [string]$Path
    )
    New-Item -Path $Path -ItemType File -Force
}

# mkdir
function New-MultiDir {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Directories
    )

    # Split the input by spaces
    $dirs = $Directories -split '\s+'  # Split by one or more spaces

    foreach ($dir in $dirs) {
        if (-not [string]::IsNullOrWhiteSpace($dir)) {  # Check for non-empty directory names
            New-Item -Path $dir -ItemType Directory -Force
        }
    }
}

# unzip
function unzip ($file) {
    Write-Output("Extracting", $file, "to", $pwd)
    $fullFile = Get-ChildItem -Path $pwd -Filter $file | ForEach-Object { $_.FullName }
    Expand-Archive -Path $fullFile -DestinationPath $pwd
}

# System Information
function sysinfo { Get-ComputerInfo }

# Networking Utilities
function flushdns {
	Clear-DnsClientCache
	Write-Host "DNS has been flushed"
}

# Public IP
function Get-PubIP { (Invoke-WebRequest http://ifconfig.me/ip).Content }

# IP Address Command
function ip {
    param (
        [string]$a
    )
    if ($a -eq 'a') {
        Get-NetIPAddress
    } else {
        Write-Host "Unknown option: $a"
    }
}

# eza
Function ll {
    param (
        [string[]]$Args
    )
    & 'C:\Users\eyes\scoop\shims\eza.exe' -l -a --color=auto --icons=auto --git-ignore  $Args
}

# tree
Function tree {
    param (
        [string[]]$Args
    )
    & 'C:\Users\eyes\scoop\shims\eza.exe' -a --color=auto --icons=auto -T --git-ignore  $Args
}

# eza tree list
function lta4 {
    eza -lT --git-ignore --level=4 --icons
}

# ripgrep
function rg {
    rg -i
}

# fzf-history
function Show-HistoryPopup {
    # Get the last 30 commands from history
    $history = Get-History | Select-Object -Last 30 -ExpandProperty CommandLine
    # Use fzf to select a command
    $selectedCommand = $history | fzf --height 70% --reverse --no-multi --tac
    if ($selectedCommand) {
        Invoke-Expression $selectedCommand
    }
}

# yazi
function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}

# fzf-nvim
function fzf-nvim {
    $file = fzf --height 100% --preview 'bat --style=numbers --color=always {}'
    if ($file) {
        $nvimPath = "C:\Users\eyes\scoop\shims\nvim.exe"  # Path to Neovim
        & $nvimPath $file
    }
}

# nvims
#function nvims()
#{
#  $items = "LazyVim", "AstroNvim", "Nvim", "NvChad"
#  $config = $items | fzf --prompt=" Neovim Config " --height=~50% --layout=reverse --border --exit-0
#
#  if ([string]::IsNullOrEmpty($config))
#  {
#    Write-Output "Nothing selected"
#    break
#  }
#
#  if ($config -eq "default")
#  {
#    $config = ""
#  }
#
#  $env:NVIM_APPNAME=$config
#  nvim $args
#}

# fnm
fnm env --use-on-cd | Out-String | Invoke-Expression

# tgpt
function gen {
    & "$env:USERPROFILE\scoop\shims\tgpt.exe" -i
}

# ollama
function ollama-serve {
    Start-Process -FilePath "ollama" -ArgumentList "serve" -NoNewWindow -RedirectStandardOutput "C:\Temp\ollama_output.log" -RedirectStandardError "C:\Temp\ollama_error.log"
}

function ollama-kill {
    Stop-Process -Name "ollama" -Force -ErrorAction SilentlyContinue
}

# NixOS
function NixOS {
    wsl -d NixOS
}

# preview
function Preview {
    param (
        [string]$ImagePath
    )
    wezterm imgcat $ImagePath
}

# mpv
function mpv {
    & "C:\Users\eyes\scoop\apps\mpv\0.38.0\mpv.exe" @args
}

# Zoxide
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })

