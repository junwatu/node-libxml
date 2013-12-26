#!/bin/sh

cd `dirname $0`

git submodule init
git submodule update

cd support/o3

rm -rf build/ || true

git checkout master

node tools/gluegen.js
node-gyp configure
node-gyp build

if [ -f build/default/o3.node ]
then
    cp build/default/o3.node ../../lib/libxml
else
    cp build/Release/o3.node ../../lib/libxml
fi
