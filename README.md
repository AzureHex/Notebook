# Notebook

# Install Windows updates via PowerShell
Install-Module PSWindowsUpdate
Add-WUServiceManager -MicrosoftUpdate

# Check Windows Updates
Get-WindowsUpdate

# Install all available updates
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot | Out-File "C:\($env.computername-Get-Date -f yyyy-MM-dd)-MSUpdates.log" -Force

```sh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

# scoop
```sh
scoop install 7zip adb ani-cli aria2 bat btop cacert curl ffmpeg fzf gcc git lua-language-server llvm localsend mingw mpv nano neovim openssl starship tgpt tldr wget winfetch yazi yt-dlp zoxide
```
