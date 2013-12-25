#!/bin/sh

cd `dirname $0`
cd support/o3

rm -rf build/ || true
node tools/gluegen.js
node-gyp -vv configure
node-gyp -vv

if [ -f build/default/o3.node ]
then
    cp build/default/o3.node ../../lib/libxml
else
    cp build/Release/o3.node ../../lib/libxml
fi
