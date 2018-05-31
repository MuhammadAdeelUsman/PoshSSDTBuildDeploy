try{
    Import-PackageProvider PowerShellGet -Force
    }
  catch{
  Write-Error "cannot run Import-PackageProvider PowerShellGet -Force"
  Throw
  }

try {
    Get-InstalledModule Pester -MinimumVersion 4.3.1 -ErrorAction Stop | Out-Null
}
catch {
    write-host "Pester Module not found. Trying to install..."
    Install-Module Pester -MinimumVersion 4.3.1 -Force -SkipPublisherCheck -Scope CurrentUser
}

Invoke-Pester .\*.Tests.ps1