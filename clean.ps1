Push-Location $PSScriptRoot
Remove-Item coredns -Recurse -Force -ErrorAction SilentlyContinue -Confirm:$false
Remove-Item forward -Recurse -Force -ErrorAction SilentlyContinue -Confirm:$false
Pop-Location