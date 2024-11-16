### Check Windows Updates

```sh | Checks for Updates
Get-WindowsUpdate
```

```sh | Install all available updates
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot | Out-File "C:\($env.computername-Get-Date -f yyyy-MM-dd)-MSUpdates.log" -Force
```
---

```sh
# Installing Nerd Fonts
wget -P ~/.local/share/fonts/JetBrainsMono https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
cd ~/.local/share/fonts/JetBrainsMono
unzip JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -fv
```

```sh
# Installing Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Add the extras bucket
scoop bucket add extras
scoop bucket add nerd-fonts
scoop install nerd-fonts/JetBrains-Mono

# Install the specified applications from Scoop
scoop install 7zip adb ani-cli aria2 bat btop cacert chafa curl delta eza fd ffmpeg file fnm fzf gcc git grep googlechrome grep imagemagick innounp lazygit less llvm localsend lua-language-server mingw mpv msys2 nano neovim nu obsidian ollama openssl raspberry-pi-imager ripgrep sed starship tailscale tree tgpt tldr vcredist2022 wezterm wget winfetch yazi yt-dlp zoxide

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

git clone --depth 1 https://github.com/AstroNvim/template $env:LOCALAPPDATA\AstroVim
git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\LazyVim
git clone https://github.com/NvChad/starter $ENV:USERPROFILE\AppData\Local\NvChad
```
## Manual Install
### Apps
1. Apple Devices
2. Office 2019 Home & Student
3. Scan
4. Zen

### Portable Apps
1. ExifCleaner
2. GIMP
3. Inkscape
4. KeepassXC
5. LibreOffice
6. NVCleanInstall
7. OBS Studio
8. RevoUninstaller
9. Rufus
10. SuperImage
11. Syncthing
12. Telegram
13. Tor Browser
14. Ventoy
15. Wireshark
