#!/bin/bash
set -e

rsync -a --delete --exclude .git --exclude .gitignore --exclude README.md ../main/repo/ .
git config --global user.email "156378334+keiyoushi-bot@users.noreply.github.com"
git config --global user.name "keiyoushi-bot"
git status
if [ -n "$(git status --porcelain)" ]; then
    git add .
    git commit -m "Update extensions repo"
    git push
else
    echo "No changes to commit"
fi
