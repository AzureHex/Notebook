# Notebook

## Scoop
```sh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

```sh
scoop bucket add extras
```

```sh
scoop install 7zip adb ani-cli aria2 bat btop cacert curl ffmpeg fnm fzf gcc git googlechrome lua-language-server llvm localsend mingw mpv nano neovim obsidian ollama openssl raspberry-pi-imager starship tailscale tgpt tldr wget whatsapp winfetch yazi yt-dlp zoxide
```
## Winget
```sh
winget install MacPaw.Encrypto AdrienAllard.FileConverter FxSoundLLC.FxSound Flywheel.Local Microsoft.PowerToys KamilSzymborski.WindowCenteringHelper Debian.Debian 
```

## Windows Updates
```sh
Install-Module PSWindowsUpdate
Add-WUServiceManager -MicrosoftUpdate
```

```sh | Check for Updates
Get-WindowsUpdate
```

```sh | Install all available updates
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot | Out-File "C:\($env.computername-Get-Date -f yyyy-MM-dd)-MSUpdates.log" -Force
```

## Apps
1. Apple Devices
2. Office 2019 Home & Student
3. Scan
4. Zen

## Portable Apps
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
