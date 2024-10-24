# Installing Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Add the extras bucket
scoop bucket add extras
scoop bucket add nerd-fonts
scoop install nerd-fonts/JetBrains-Mono

# Install the specified applications from Scoop
scoop install 7zip adb ani-cli aria2 bat btop cacert chafa curl eza fd ffmpeg file fnm fzf gcc git grep googlechrome grep imagemagick innounp lazygit less llvm localsend lua-language-server mingw mpv msys2 nano neovim nu obsidian oh-my-posh ollama openssl raspberry-pi-imager ripgrep sed starship tailscale tree tgpt tldr vcredist2022 wezterm wget winfetch yazi yt-dlp zoxide

# Install the specified applications using Winget
winget install Mozilla.Thunderbird MacPaw.Encrypto AdrienAllard.FileConverter FxSoundLLC.FxSound Flywheel.Local Microsoft.PowerToys KamilSzymborski.WindowCenteringHelper Canonical.Ubuntu Debian.Debian 9NKSQGP7F2NH

# Install the Terminal-Icons Module
Install-Module -Name Terminal-Icons -Repository PSGallery

# Install the PSReadLine Module
Install-Module -Name PSReadLine -Scope CurrentUser

# Install the PSWindowsUpdate module
Install-Module PSWindowsUpdate -Force

# Add Microsoft Update service
Add-WUServiceManager -MicrosoftUpdate
