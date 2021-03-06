Push-Location $PSScriptRoot

# git clone https://github.com/coredns/coredns.git
# git clone https://github.com/qzlin/forward.git

# local test repo cache
if (Test-Path local_cache) {
    $local_debug = $true
    . ./clean.ps1
    git clone local_cache/coredns
    git clone local_cache/forward
}
# Invoke-WebRequest https://raw.githubusercontent.com/newren/git-filter-repo/main/git-filter-repo -OutFile git-filter-repo.py

Push-Location coredns
python ../git-filter-repo.py --path plugin/forward --subdirectory-filter plugin/forward --prune-empty always --force
Write-Output "=========coredns [3]========="
git log -3
# git config --list
Pop-Location

Push-Location forward
git pull ../coredns --allow-unrelated-histories --force -v
Write-Output "=========forward [3]========="
git log -3
# git config --list
## Remove empty merge commit for actions server git
if (-not $local_debug -and $(git log -1 --format=%s) -eq "Merge ../coredns") {
    $last = git log -1 --skip=1 --format=%H
    git reset --hard $last
}
Write-Output "=========handled [3]========="
git log -3
Pop-Location


Pop-Location