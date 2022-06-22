Push-Location $PSScriptRoot

# git clone https://gitclone.com/github.com/coredns/coredns.git
# git clone https://gitclone.com/github.com/qzlin/forward.git

# local test repo cache
git clone local_cache/coredns
git clone local_cache/forward

# wget https://raw.githubusercontents.com/newren/git-filter-repo/main/git-filter-repo -O git-filter-repo.py

Push-Location coredns
python ../git-filter-repo.py --path plugin/forward --subdirectory-filter plugin/forward  --force
Pop-Location

Push-Location forward
git pull ../coredns
Pop-Location


Pop-Location