$USER = $env:USERPROFILE
$source = ".\config\windows-terminal"
$tempPATH = "$USER\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

cp "$source\Microsoft.PowerShell_profile.ps1" "$USER\Documents\PowerShell\"

