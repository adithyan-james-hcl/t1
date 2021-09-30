Unblock-File -Path " c:\powershell\p1.ps1"
# PI.ps1
$PI = 3.14
Write-Host "The value of `$PI is $PI"
Write-Host 'The value of $PI is $PI'

New-Item
    -ItemType "file"
    -value 'Write-Host "Hello Adithyan, welcome back" -foregroundcolor Green'
    -path $profile.CurrentUserCurrentHost -force