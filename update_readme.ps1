Push-Location $PSScriptRoot
$content = Get-Content .\README.md | Join-String -Separator "`n"
$content -match "\*\*sync job ran \[(\d+)\] times\*\*"
$last = [int]$Matches[1]

$new_content = $content -replace "(?<=\*\*sync job ran )\[(\d+)\](?= times\*\*)", "[$($last+1)]"

Set-Content -Path README.md -Value $new_content

git add "README.md"
git commit -m "update readme"
git push --set-upstream git@github.com:QZLin/coredns-extract.git main
Pop-Location
