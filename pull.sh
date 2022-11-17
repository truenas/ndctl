#!/bin/bash -ex
VERSION=74
REVISION=2

wget http://deb.debian.org/debian/pool/main/n/ndctl/ndctl_$VERSION.debian.tar.gz
tar xf ndctl_$VERSION.debian.tar.gz
rm ndctl_$VERSION.debian.tar.gz

wget http://deb.debian.org/debian/pool/main/n/ndctl/ndctl_$VERSION.orig.tar.gz
tar xf ndctl_$VERSION.orig.tar.gz --strip 1
rm ndctl_$VERSION.orig.tar.gz

cp msft.patch debian/patches
echo 'msft.patch' >> debian/patches/series

echo -e "$(cat changelog)\n\n$(cat debian/changelog)" > debian/changelog
