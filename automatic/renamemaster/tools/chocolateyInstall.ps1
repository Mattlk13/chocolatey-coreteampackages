$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'renamemaster'
  fileType      = 'zip'
  url           = 'http://files.snapfiles.com/directdl/rmv403.zip'
  checksum      = '769c76301d7401cc7a6b8d2fca91d17bbb802c861503fdbe02682d7714ae07ea'
  checksumType  = 'sha256'
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs

$executable = Join-Path  $toolsDir "RenameMaster.exe"
$startMenu = [Environment]::GetFolderPath("CommonPrograms")
$startMenuLink = Join-Path $startMenu "Rename Master.lnk"
Install-ChocolateyShortcut $startMenuLink $executable

Remove-Item "$toolsDir\setup.exe" -Force -ea 0
