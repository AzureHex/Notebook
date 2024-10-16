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
scoop install 7zip adb ani-cli aria2 bat btop cacert curl ffmpeg fzf gcc git googlechrome lua-language-server llvm localsend mingw mpv nano neovim obsidian ollama openssl starship tailscale tgpt tldr wget whatsapp winfetch yazi yt-dlp zoxide
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

## Winget
```sh
winget install -e --id MacPaw.Encrypto;winget install -e --id FxSoundLLC.FxSound;winget install -e --id LocalSend.LocalSend;winget install -e --id Obsidian.Obsidian;winget install -e --id WhatsApp.WhatsApp;winget install -e --id tailscale.tailscale
```

## Apps
1. Apple Devices
2. File Converter
3. Local
4. Office 2019 Home & Student
5. Scan
6. Zen

## Portable Apps
1. ExifCleaner
2. GIMP
3. Inkscape
4. KeepassXC
5. LibreOffice
6. NVCleanInstall
7. OBS Studio
8. PowerToys
9. Python
10. RevoUninstaller
11. Rufus
12. SuperImage
13. Syncthing
14. Telegram
15. Tor Browser
16. Ventoy
17. Windows Centering Helper
18. Wireshark
