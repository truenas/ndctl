#!/bin/bash -ex
VERSION=74
REVISION=2
BASEURL="https://launchpad.net/debian/+archive/primary/+sourcefiles/ndctl/$VERSION-$REVISION"

# download revision source
REVISION_FILE="ndctl_$VERSION-$REVISION.debian.tar.xz"
wget "$BASEURL/$REVISION_FILE"
tar xf $REVISION_FILE
rm $REVISION_FILE

# download version source
VERSION_FILE="ndctl_$VERSION.orig.tar.gz"
wget "$BASEURL/$VERSION_FILE"
tar xf $VERSION_FILE --strip 1
rm $VERSION_FILE

cp msft.patch debian/patches
echo 'msft.patch' >> debian/patches/series

echo -e "$(cat changelog)\n\n$(cat debian/changelog)" > debian/changelog
