# font-list.ps1

$fonts = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
$fonts.PSObject.Properties | ForEach-Object {
    "{0,-40} : {1}" -f $_.Name, $_.Value
}