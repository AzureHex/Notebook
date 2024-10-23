# Set the execution policy to RemoteSigned for the current user
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Install Scoop using Invoke-RestMethod
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Add the extras bucket
scoop bucket add extras
scoop bucket add nerd-fonts

# Install the specified applications from Scoop
scoop install 7zip adb ani-cli aria2 bat btop cacert chafa curl eza fd ffmpeg file fnm fzf gcc git grep googlechrome grep imagemagick innounp lazygit less llvm localsend lua-language-server mingw mpv msys2 nano neovim nu obsidian oh-my-posh ollama openssl raspberry-pi-imager ripgrep sed starship tailscale tree tgpt tldr vcredist2022 wezterm wget whatsapp winfetch yazi yt-dlp zoxide

# Install the specified applications using Winget
winget install Mozilla.Thunderbird MacPaw.Encrypto AdrienAllard.FileConverter FxSoundLLC.FxSound Flywheel.Local Microsoft.PowerToys KamilSzymborski.WindowCenteringHelper Debian.Debian

# Install the Terminal-Icons Module
Install-Module -Name Terminal-Icons -Repository PSGallery

# Install the PSReadLine Module
Install-Module -Name PSReadLine -Scope CurrentUser

# Install the PSWindowsUpdate module
Install-Module PSWindowsUpdate -Force

# Add Microsoft Update service
Add-WUServiceManager -MicrosoftUpdate
