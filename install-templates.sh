#!/bin/bash

SCRIPT_DIR=$(dirname $0)
FIREBASE_FRAMEWORK="https://cdn.firebase.com/ios/Firebase.framework-LATEST.zip"
FRAMEWORK_DEST="/Users/Shared/Firebase/Frameworks/"
TEMPLATE_DEST="$HOME/Library/Developer/Xcode/Templates"

echo Downloading latest Firebase framework
mkdir -p $FRAMEWORK_DEST
if [ $? -ne 0 ]; then
  echo Unable to create framework destination directory.
  exit 1
fi

cd $FRAMEWORK_DEST
rm -rf Firebase.framework
curl -o Firebase.framework.zip $FIREBASE_FRAMEWORK
if [ $? -ne 0 ]; then
  echo Unable to download latest Firebase framework.
  exit 1
fi
unzip Firebase.framework.zip
rm -f Firebase.framework.zip
cd -

echo Installing Firebase Xcode templates
mkdir -p $TEMPLATE_DEST
if [ $? -ne 0 ]; then
  echo Unable to create template destination directory.
  exit 1
fi
cp -a $SCRIPT_DIR/Firebase $TEMPLATE_DEST

echo
echo
echo "All done! Be sure to restart Xcode to see the new Firebase templates when creating new projects."
