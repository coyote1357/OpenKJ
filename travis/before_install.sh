#!/bin/bash

export PATH=$PATH:$QT_MACOS/bin
if [ "${TRAVIS_BRANCH}" == "release" ]; then
  export BRANCH="release"
else
  export BRANCH="unstable"
fi
export BRANCH_BUCKET=$(echo $TRAVIS_REPO_SLUG | sed -e 's/\//-/g') 
export INSTALLERFN="OpenKJ-${OKJVER}-${BRANCH}-osx-installer.dmg"

chmod 755 ./travis/install.sh
chmod 755 ./travis/build.sh
