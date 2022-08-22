#!/bin/bash

PROJECT_NAME=${1:-test_repo}
PROJECT_USER=${2:-MatteoLacki}
# Create git repo and push the code there
cd $PROJECT_NAME
git init
git add README.md setup.py setup.cfg Makefile __init__.py $PROJECT_NAME/__init__.py
git commit -m "first commit"

# make sure we use ssh instead of https
gh config set git_protocol ssh -h github.com

# Create github repo
gh repo create $PROJECT_NAME
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:$PROJECT_USER/$PROJECT_NAME.git
git push -u origin main

