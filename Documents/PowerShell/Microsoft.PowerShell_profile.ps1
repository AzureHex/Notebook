#opt-out of telemetry before doing anything, only if PowerShell is run as admin
if ([bool]([System.Security.Principal.WindowsIdentity]::GetCurrent()).IsSystem) {
    [System.Environment]::SetEnvironmentVariable('POWERSHELL_TELEMETRY_OPTOUT', 'true', [System.EnvironmentVariableTarget]::Machine)
}

#winfetch

Import-Module -Name Terminal-Icons
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\p10k.toml" | Invoke-Expression
#$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
#$ENV:STARSHIP_DISTRO = "  eyes"
#Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
$env:BAT_THEME = 'Nord'

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Aliasis
Set-Alias mkdir New-MultiDir
Set-Alias ping Test-Connection
Set-Alias ifconfig Get-NetIPAddress
Set-Alias fzf-history Show-HistoryPopup
Set-Alias debian debian.exe

# Navigation Shortcuts
function desktop { Set-Location -Path $HOME\Desktop }
function downloads { Set-Location -Path $HOME\Downloads }
function docs { Set-Location -Path $HOME\Documents }
function .config { Set-Location -Path "$HOME\.config" }
function code { Set-Location -Path "$HOME\Code" }
function repos { Set-Location -Path "$HOME\Code\repos" }
function sites { Set-Location -Path "$HOME\Local Sites" }

# Hidden Listing
function la { Get-ChildItem -Path . -Force -Hidden | Format-Table -AutoSize }

# eza
Function eza {
    param (
        [string[]]$Args
    )
    & 'C:\Users\eyes\scoop\shims\eza.exe' -a -h -m -U --color=auto --icons=auto --git-ignore  $Args
}

# fzf-file-manager

function fzf-file-manager {
    param (
        [string]$Path = "."
    )

    # Get files and pipe to fzf with bat preview
    $selectedFile = Get-ChildItem -Path $Path -File -Recurse | 
                    Select-Object -ExpandProperty FullName | 
                    fzf --preview 'bat --style=numbers --color=always {}' --preview-window=right:50%:wrap --select-1 --exit-0

    # Check if a file was selected
    if ($selectedFile) {
        # Open the selected file in nano
        # Make sure nano is available in your PATH or use another editor
        try {
            nano $selectedFile
        } catch {
            Write-Host "Failed to open file in nano. Please ensure nano is installed."
        }
    } else {
        Write-Host "No file selected."
    }
}

# tree
Function tree {
    param (
        [string[]]$Args
    )
    & 'C:\Users\eyes\scoop\shims\eza.exe' -a --color=auto --icons=auto -T --git-ignore  $Args
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

# vim
function vim {
    Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Neovim\Neovim.lnk"
}

# nvims
function nvims()
{
  $items = "AstroNvim", "LazyVim", "NvChad"
  $config = $items | fzf --prompt=" Neovim Config " --height=~50% --layout=reverse --border --exit-0

  if ([string]::IsNullOrEmpty($config))
  {
    Write-Output "Nothing selected"
    break
  }
 
  if ($config -eq "default")
  {
    $config = ""
  }

  $env:NVIM_APPNAME=$config
  nvim $args
}

# fzf-nvim
function fzf-nvim {
    $file = fzf --height 100% --preview 'bat --style=numbers --color=always {}'
    if ($file) {
        $nvimPath = "C:\Users\eyes\scoop\shims\nvim.exe"  # Path to Neovim
        & $nvimPath $file
    }
}

# fzf-nano
function fzf-nano {
    $file = fzf --height 100% --preview 'bat --style=numbers --color=always {}'
    if ($file) {
        $nanoPath = "C:\Users\eyes\scoop\shims\nano.exe"  # Path to nano
        & $nanoPath $file
    }
}

# git
function github {
    git add .
    git commit -m "$args"
    git push
}

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

# mpv
function mpv {
    & "C:\Users\eyes\scoop\apps\mpv\0.38.0\mpv.exe" @args
}

# Quick Access to System Information
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
