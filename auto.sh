#!/bin/bash

git config --global user.email sebastian.oderland@gmail
git config --global user.name SebastianOderland
git config --global github.token 7eada1464f1ef7f528ffe4c070aaf43b5c5a6178

branch=$(git rev-parse --abbrev-ref HEAD)
repo_full_name=$(git config --get remote.origin.url | sed 's/.*:\/\/github.com\///;s/.git$//')
token=$(git config --global github.token)

read -p "Commit description: " desc
read -p "Version: " version

generate_post_data()
{
  cat <<EOF
{
  "tag_name": "$version",
  "target_commitish": "$branch",
  "name": "$version",
  "body": "null",
  "draft": false,
  "prerelease": false
}
EOF
}

git add .

git commit -m "$desc"
git push https://SebastianOderland:Ferabulok7568@github.com/"$repo_full_name".git master

curl --data "$(generate_post_data)" "https://api.github.com/repos/$repo_full_name/releases?access_token=$token"

#python setup.py sdist
#twine upload dist/*