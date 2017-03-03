#!/bin/bash
set -e # Exit with nonzero exit code if anything fails

# our branches
SOURCE_BRANCH="master"

# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
    echo "Skipping install"
    exit 0
fi

git clone ${RSTBLOG_REPO} rstblog
cd rstblog

# install the library
python setup.py install

cd ..