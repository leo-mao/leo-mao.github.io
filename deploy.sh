# !/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project. 
hugo

# change the baseURL temporarily
PRODUCT_URL="https://leo-mao.github.io"
./replace-url.sh $PRODUCT_URL

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin draft
git subtree push --prefix=public origin master

# revert the baseURL to dev URL
DEV_URL="http://localhost:1313"
./replace-url.sh $DEV_URL
