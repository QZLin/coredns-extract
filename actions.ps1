Push-Location $PSScriptRoot

git clone https://github.com/coredns/coredns.git
git clone https://github.com/qzlin/forward.git

# local test repo cache
# git clone local_cache/coredns
# git clone local_cache/forward

Invoke-WebRequest https://raw.githubusercontent.com/newren/git-filter-repo/main/git-filter-repo -OutFile git-filter-repo.py

Push-Location coredns
python ../git-filter-repo.py --path plugin/forward --subdirectory-filter plugin/forward  --force
Pop-Location

Push-Location forward
git pull ../coredns --allow-unrelated-histories
Pop-Location


Pop-Location