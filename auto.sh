#!/bin/bash

git config --global user.email sebastian.oderland@gmail
git config --global user.name SebastianOderland

GIT_PASSWORD="Ferabulok7568"
git add .
read -p "Commit description: " desc
git commit -m "$desc"
git push https://SebastianOderland:Ferabulok7568@zypher_trading_bot.git master

#read -p "Version: " version
#git tag "v_$version"

#python setup.py sdist
#twine upload dist/*