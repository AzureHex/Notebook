# Notebook

### Check Windows Updates

```sh | Check for Updates
Get-WindowsUpdate
```

```sh | Install all available updates
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot | Out-File "C:\($env.computername-Get-Date -f yyyy-MM-dd)-MSUpdates.log" -Force
```

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
