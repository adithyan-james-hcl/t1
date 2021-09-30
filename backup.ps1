Param(
  [string]$Path = './webapp',
  [string]$DestinationPath = './',
  [switch]$PathIsWebAppp
)

Write-Host $PathIsWebAppp
If ($PathIsWebAppp -eq $True)
{
  Write-Host "here"
  Try 
  {
    $ContainsApplicationFiles = "$((Get-ChildItem $Path).Extension | Sort-Object -Unique)" -match  '\.js|\.html|\.css'
    If ( -Not $ContainsApplicationFiles) 
    {
      Throw "Not a web app"
    }
    Else 
    {
      Write-Host "Source files look good, continuing"
    }
  } 
  Catch
  {
  Throw "No backup created due to: $($_.Exception.Message)"
  }

}

If( -not (Test-Path $Path))
{
  Throw "the $Path doesnot exist "
}
$date = Get-Date -format "yyyy-MM-dd"
$DestinationFile= "$($DestinationPath+'backup-')$date.zip"
If(-not (Test-Path $DestinationFile))
{
  Compress-Archive -Path $Path -CompressionLevel 'Fastest' -DestinationPath "$($DestinationPath + 'backup-' + $date)"
  Write-Host "Created backup at $( $DestinationPath + 'backup-' + $date).zip"
}
else
{
  Write-Error "Today's backup already exists"
}