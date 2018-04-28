#!/bin/bash

# do not build mac for PR
if [ "${TRAVIS_PULL_REQUEST}" != "false" ]; then
  exit 0
fi

echo "Installing osxrelocator"
pip install osxrelocator

#install gstreamer#install Qt
echo "Downloading Qt"
wget -c --no-check-certificate -nv -Oqt.tar.bz2 https://cloud.hm.hozed.net/index.php/s/3lyFyolHbBdMx8o/download
echo "Extracting Qt"
bunzip2 qt.tar.bz2
tar -xf qt.tar
echo "Moving Qt to proper location"
mv Qt $HOME/Qt

echo "gstreamer install"
echo "Downloading gstreamer runtime package"
wget -c --no-check-certificate -nv https://gstreamer.freedesktop.org/data/pkg/osx/1.11.2/gstreamer-1.0-1.11.2-x86_64.pkg
echo "Downloading gstreamer devel package"
wget -c --no-check-certificate -nv https://gstreamer.freedesktop.org/data/pkg/osx/1.11.2/gstreamer-1.0-devel-1.11.2-x86_64.pkg
echo "Installing gstreamer runtime package"
sudo installer -package gstreamer-1.0-1.11.2-x86_64.pkg -target /;
echo "Making a deployment copy of the runtime"
sudo cp -R /Library/Frameworks/GStreamer.framework /Library/Frameworks/GStreamer.framework.deploy
echo "Installing gstreamer devel package"
sudo installer -package gstreamer-1.0-devel-1.11.2-x86_64.pkg -target /;
sudo ln -s /Users/travis /Users/lightburnisaac
echo "gstreamer install done"



