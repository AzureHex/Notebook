winfetch

$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
$ENV:STARSHIP_DISTRO = "  eyes"
Invoke-Expression (&starship init powershell)

# mpv
function mpv {
    & "C:\Users\eyes\scoop\apps\mpv\0.38.0\mpv.exe" @args
}

# vim
function vim {
    Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Neovim\Neovim.lnk"
}

# Aliasis
Set-Alias vim nvim
Set-Alias code Open-FzfFile
Set-Alias debian debian.exe

Set-Alias la Get-ChildItem
function la { Get-ChildItem -Force -File | Format-Table Name,Length,LastWriteTime }

# Networking
Set-Alias ping Test-Connection
Set-Alias ifconfig Get-NetIPAddress

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

# Create an alias for the function
Set-Alias mkdir New-MultiDir

