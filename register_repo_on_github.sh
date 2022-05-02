#!/bin/bash

PROJECT_NAME=${1:-test_repo}

# Create git repo and push the code there
cd $PROJECT_NAME
git init
git add README.md setup.py setup.cfg Makefile __init__.py $PROJECT_NAME/__init__.py
git commit -m "first commit"

# make sure we use ssh instead of https
gh config set git_protocol ssh -h github.com

# Create github repo
gh repo create
git branch -M main
git push -u origin main

