#opt-out of telemetry before doing anything, only if PowerShell is run as admin
if ([bool]([System.Security.Principal.WindowsIdentity]::GetCurrent()).IsSystem) {
    [System.Environment]::SetEnvironmentVariable('POWERSHELL_TELEMETRY_OPTOUT', 'true', [System.EnvironmentVariableTarget]::Machine)
}

winfetch

$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
$ENV:STARSHIP_DISTRO = "  eyes"
Invoke-Expression (&starship init powershell)

# Quick Access to System Information
function sysinfo { Get-ComputerInfo }

# Networking Utilities
function flushdns {
	Clear-DnsClientCache
	Write-Host "DNS has been flushed"
}

# Navigation Shortcuts
function desktop { Set-Location -Path $HOME\Desktop }
function docs { Set-Location -Path $HOME\Documents }
function repos {
    Set-Location -Path "C:\Users\eyes\Code\repos"
}

# Enhanced Listing
function ll { Get-ChildItem -Path . -Force -Hidden | Format-Table -AutoSize }

# Aliasis
Set-Alias la Get-ChildItem
Set-Alias mkdir New-MultiDir
Set-Alias ping Test-Connection
Set-Alias ifconfig Get-NetIPAddress
Set-Alias vim nvim
Set-Alias code Open-FzfFile
Set-Alias debian debian.exe

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

# which
function which($name) {
    Get-Command $name | Select-Object -ExpandProperty Definition
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

# vim
function vim {
    Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Neovim\Neovim.lnk"
}

# fzf-code
function Open-FzfFile {
    # Search for all files in the current directory and its subdirectories
    $files = Get-ChildItem -Recurse -File | Select-Object -ExpandProperty FullName

    # Use fzf to let the user select a file
    $selectedFile = $files | fzf

    # Open the selected file in nvim
    if ($selectedFile) {
        nvim $selectedFile
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

