Push-Location $PSScriptRoot
Remove-Item coredns -Force -ErrorAction Ignore
Remove-Item forward -Force -ErrorAction Ignore
Pop-Location