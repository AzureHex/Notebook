# Set the execution policy to RemoteSigned for the current user
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Install Scoop using Invoke-RestMethod
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Add the extras bucket
scoop bucket add extras

# Install the specified applications from Scoop
scoop install 7zip adb ani-cli aria2 bat btop cacert curl eza ffmpeg fnm fzf gcc git googlechrome grep lua-language-server llvm localsend mingw mpv nano neovim obsidian ollama openssl raspberry-pi-imager sed starship tailscale tgpt tldr wezterm wget whatsapp winfetch yazi yt-dlp zoxide

# Install the specified applications using Winget
winget install Mozilla.Thunderbird MacPaw.Encrypto AdrienAllard.FileConverter FxSoundLLC.FxSound Flywheel.Local Microsoft.PowerToys KamilSzymborski.WindowCenteringHelper Debian.Debian

# Install the PSWindowsUpdate module
Install-Module PSWindowsUpdate -Force

# Add Microsoft Update service
Add-WUServiceManager -MicrosoftUpdate
