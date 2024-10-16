# Notebook

## Scoop
```sh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

```sh
scoop install 7zip adb ani-cli aria2 bat btop cacert curl ffmpeg fzf gcc git lua-language-server llvm localsend mingw mpv nano neovim o>
```

```sh | Windows Updates
Install-Module PSWindowsUpdate
Add-WUServiceManager -MicrosoftUpdate
```

```sh | Check for Updates
Get-WindowsUpdate
```

```sh | Install all available updates
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot | Out-File "C:\($env.computername-Get-Date -f yyyy-MM-dd)-MSUpdates.log" -Force
```

