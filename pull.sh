#!/bin/bash -ex
VERSION=74
REVISION=2

wget http://deb.debian.org/debian/pool/main/n/ndctl/ndctl_$VERSION-$REVISION.debian.tar.xz
tar xf ndctl_$VERSION-$REVISION.debian.tar.xz
rm ndctl_$VERSION-$REVISION.debian.tar.xz

wget http://deb.debian.org/debian/pool/main/n/ndctl/ndctl_$VERSION.orig.tar.xz
tar xf ndctl_$VERSION.orig.tar.xz --strip 1
rm ndctl_$VERSION.orig.tar.xz

cp msft.patch debian/patches
echo 'msft.patch' >> debian/patches/series

echo -e "$(cat changelog)\n\n$(cat debian/changelog)" > debian/changelog
