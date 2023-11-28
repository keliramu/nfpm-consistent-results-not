#!/bin/bash

if [ -z "$1" ]; then
	echo "Give me dir name where to put deb..."
	exit 1
fi
echo "Build DEB into: $1"
echo "Create dir: $1..."
mkdir -p $1
echo "Create DEB package..."
/usr/bin/nfpm pkg --packager deb --target $1
echo "Done."

